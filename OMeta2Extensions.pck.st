'From Cuis6.3 [latest update: #6293] on 27 March 2024 at 8:42:23 pm'!
'Description Optional extensions to OMeta including: syntax highlighting in Browser windows, basic debugging and profiling.'!
!provides: 'OMeta2Extensions' 2 22!
!requires: 'OMeta2' 2 0 nil!



!OMeta2Compiler class methodsFor: '*OMeta2Extensions' stamp: 'pb 5/22/2019 00:39:45'!
autoCompleterClass
	^ nil! !

!OMeta2Compiler class methodsFor: '*OMeta2Extensions' stamp: 'pb 6/22/2015 20:01'!
textStylerClass
	^ SHTextStylerOMeta2! !

!SHRange methodsFor: '*OMeta2Extensions' stamp: 'pb 5/23/2018 02:23:38'!
printOn: aStream
	aStream
		nextPutAll: 'a ';
		nextPutAll: self class name;
		nextPut: $(;
		print: start;
		nextPutAll: '..';
		print: end;
		nextPut: $:;
		print: type;
		nextPut: $).! !

!OMeta2 class methodsFor: '*OMeta2Extensions' stamp: 'pb 5/3/2020 14:08:48'!
findInternallyUnusedRules
	"What is returned should typically be your top level rules called externally or rules not used by other rules at the same level in the class"
	| referencedRules rules |
	rules := self methodDict keys asSet.
	referencedRules := Set new.
	rules do: [ :eaRule |
		(self parseOMetaRuleOrNil: eaRule) ifNotNil: [ :parsedRule |
			parsedRule first = #Rule ifTrue: [ | ruleName ruleBody |
				ruleName := parsedRule second.
				ruleBody := parsedRule
					copyFrom: 3
					to: parsedRule size.
				(OMeta2RuleIntrospection
					debugMatch: ruleBody
					with: #referencedOMetaRules) do: [ :eaRef |
					referencedRules add: eaRef ]]]].
	rules removeAllSuchThat: [ :eaRule |
		(referencedRules includes: eaRule) ].
	^ rules.! !

!OMeta2 class methodsFor: '*OMeta2Extensions' stamp: 'pb 4/26/2020 20:00:16'!
findLeftRecursiveRules
	^ self methodDict keys select: [ :eaSelector | 
		self isRuleLeftRecursive: eaSelector ].! !

!OMeta2 class methodsFor: '*OMeta2Extensions' stamp: 'pb 4/29/2020 22:34:57'!
hasLeftRecursiveRules
	^ self findLeftRecursiveRules isEmpty not! !

!OMeta2 class methodsFor: '*OMeta2Extensions' stamp: 'pb 4/29/2020 22:27:32'!
isRuleLeftRecursive: aRule
	^ (self parseOMetaRuleOrNil: aRule)
		ifNil: [ false ]
		ifNotNil: [ :parsedRule |
			parsedRule first = #Rule and: [ | ruleName ruleBody |
				ruleName := parsedRule second.
				ruleBody := parsedRule
					copyFrom: 3
					to: parsedRule size.
				(OMeta2RuleIntrospection
					debugMatch: ruleBody
					with: #appliesDirectOMetaRule
					withArgs:
						{ruleName}) notNil ]].! !

!OMeta2 class methodsFor: '*OMeta2Extensions' stamp: 'pb 4/26/2020 20:14:26'!
parseOMetaRuleOrNil: aSymbol
	^ self ometa2RuleParserClass
		matchAll: (self methodDict at: aSymbol) sourceCode
		with: #ometaRule
		ifFail: [ ].! !

!OMeta2 class methodsFor: '*OMeta2Extensions' stamp: 'pb 5/27/2020 02:54:36'!
recompileAllOMetaRules
	"Need to subscribe to add/change/delete method events via SystemChangeNotifier #methodAdded, #methodChanged, #methodRemoved events and dispatch here if the method changed was #isOMetaLeftRecursionEnabled
	FIXME - WIP"
	self methodDict keysAndValuesDo: [ :eaRule :eaCompiledMethod |
		(self parseOMetaRuleOrNil: eaRule) ifNotNil: [
			Transcript show: 're-compiling: ' , eaRule asString , ' in cat ' , eaCompiledMethod category.
			"
			p1 := self ometa2RuleParserClass
				matchAll: (self sourceCodeAt: eaRule) readStream
				with: #rule.
			p2 := self ometa2OptimizerClass optimizeOMetaAst: p1.
			p3 := self ometa2RuleTranslatorClass
				match: p2
				with: #translate
				withArgs:
					{OMeta2}.
			self ometa2FlattenerClass
				match: p3
				with: #flatten.
			"
			self
				compile: (self sourceCodeAt: eaRule)
				classified: eaCompiledMethod category ]].! !
