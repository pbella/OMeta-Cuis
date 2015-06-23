'From Cuis 4.2 of 25 July 2013 [latest update: #2384] on 23 June 2015 at 4:04:28.496138 am'!
'Description Optional extensions to OMeta'!
!provides: 'OMeta2Extensions' 2 1!
!requires: 'OMeta2' 2 0 nil!
!classDefinition: #OMeta2DebugCompiler category: #OMeta2Extensions!
OMeta2Compiler subclass: #OMeta2DebugCompiler
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2Extensions'!
!classDefinition: 'OMeta2DebugCompiler class' category: #OMeta2Extensions!
OMeta2DebugCompiler class
	instanceVariableNames: ''!

!classDefinition: #OMeta2DebugError category: #OMeta2Extensions!
Error subclass: #OMeta2DebugError
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2Extensions'!
!classDefinition: 'OMeta2DebugError class' category: #OMeta2Extensions!
OMeta2DebugError class
	instanceVariableNames: ''!

!classDefinition: #OMeta2Debug category: #OMeta2Extensions!
OMeta2 subclass: #OMeta2Debug
	instanceVariableNames: 'om2ApplyPc om2ApplyWithArgsPc om2DebugRoot om2Eos om2TraceLog om2Trans om2TransId'
	classVariableNames: 'LastMatcher'
	poolDictionaries: ''
	category: 'OMeta2Extensions'!
!classDefinition: 'OMeta2Debug class' category: #OMeta2Extensions!
OMeta2Debug class
	instanceVariableNames: ''!

!classDefinition: #OMeta2ExtendedParser category: #OMeta2Extensions!
OMeta2Debug subclass: #OMeta2ExtendedParser
	instanceVariableNames: 'ast curNode temps'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2Extensions'!
!classDefinition: 'OMeta2ExtendedParser class' category: #OMeta2Extensions!
OMeta2ExtendedParser class
	instanceVariableNames: ''!

!classDefinition: #OMeta2DebugRuleTranslator category: #OMeta2Extensions!
OMeta2RuleTranslator subclass: #OMeta2DebugRuleTranslator
	instanceVariableNames: 'transLogId transLog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2Extensions'!
!classDefinition: 'OMeta2DebugRuleTranslator class' category: #OMeta2Extensions!
OMeta2DebugRuleTranslator class
	instanceVariableNames: ''!

!classDefinition: #SHTextStylerOMeta2 category: #OMeta2Extensions!
SHTextStyler subclass: #SHTextStylerOMeta2
	instanceVariableNames: 'smalltalkFallbackStyler useOMetaStyler'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2Extensions'!
!classDefinition: 'SHTextStylerOMeta2 class' category: #OMeta2Extensions!
SHTextStylerOMeta2 class
	instanceVariableNames: 'textAttributes'!

!classDefinition: #SyntaxTreeNode category: #OMeta2Extensions!
Object subclass: #SyntaxTreeNode
	instanceVariableNames: 'node properties children'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2Extensions'!
!classDefinition: 'SyntaxTreeNode class' category: #OMeta2Extensions!
SyntaxTreeNode class
	instanceVariableNames: ''!


!OMeta2DebugCompiler commentStamp: '<historical>' prior: 0!
WORK IN PROGRESS... not ready for normal use!!!

!OMeta2DebugError commentStamp: '<historical>' prior: 0!
This is so we can determine debug vs. regular OMeta runtime errors!

!OMeta2Debug commentStamp: '<historical>' prior: 0!
WORK IN PROGRESS... not ready for normal use!!

This is a debugging and profiling version of OMeta2.  It trades quite a bit of performance to try to detect and report known runtime errors and collect detailed statistics.  This is often worthwhile when initially designing and debugging a parser.

To use, simply set this class as your parser's parent class.  Once you're happy with how the parser is operating, feel free to change your parser's parent class back to OMeta2 to eliminate the runtime overhead.

todo: infinite recursion detection!

!OMeta2ExtendedParser commentStamp: '<historical>' prior: 0!
WORK IN PROGRESS... not ready for normal use!!

This is a more full-featured OMeta parser that renders to a labelled syntax tree.  While significantly larger than the default parser, it will allow for much more flexibility.!

!OMeta2DebugRuleTranslator commentStamp: '<historical>' prior: 0!
WORK IN PROGRESS... not ready for normal use!!!

!SHTextStylerOMeta2 commentStamp: '<historical>' prior: 0!
WORK IN PROGRESS... not ready for normal use!!!

!SyntaxTreeNode commentStamp: '<historical>' prior: 0!
A simple, generic syntax tree node which can be used for both concrete and abstract trees.!

!OMeta2Compiler class methodsFor: '*OMeta2Extensions' stamp: 'pb 6/22/2015 20:01'!
textStylerClass
	^ SHTextStylerOMeta2! !

!OMeta2DebugCompiler class methodsFor: 'as yet unclassified' stamp: 'pb 6/15/2015 02:22'!
ometa2RuleTranslatorClass
	^ OMeta2DebugRuleTranslator! !

!OMeta2Debug methodsFor: 'ometa grammar' stamp: 'pb 6/16/2015 03:45'!
apply: aRule
	input class = OM2EndOfStream ifTrue: [
		om2Eos > 100000
			ifTrue: [ OMeta2DebugError new signal: 'Infinite recursion detected'
				"There's a good possibility that there is a rule with optional arity (i.e. using * and/or ?) that is being matched even though we are at the end of the input stream." ]
			ifFalse: [ om2Eos := om2Eos + 1 ]].
	"]"
	"
	nextVal := (om2ApplyPc
		at: aRule
		ifAbsentPut: [ 0 ]) + 1.
	om2ApplyPc
		at: aRule
		put: nextVal.
		"
	om2ApplyPc
		at: aRule
		put:
			(om2ApplyPc
				at: aRule
				ifAbsentPut: [ 0 ]) + 1.
	^ super apply: aRule.! !

!OMeta2Debug methodsFor: 'ometa grammar' stamp: 'pb 6/13/2015 15:29'!
apply: aRule withArgs: args
	"
	nextVal := (om2ApplyWithArgsPc
		at: aRule
		ifAbsentPut: [ 0 ]) + 1.
	om2ApplyWithArgsPc
		at: aRule
		put: nextVal.
		"
	om2ApplyWithArgsPc
		at: aRule
		put:
			(om2ApplyWithArgsPc
				at: aRule
				ifAbsentPut: [ 0 ]) + 1.
	^ super
		apply: aRule
		withArgs: args.! !

!OMeta2Debug methodsFor: 'as yet unclassified' stamp: 'pb 6/15/2015 05:51'!
debugFinishTrans: name id: transId
	self debugShouldTrace ifTrue: [
		self flag: #todo.
		Transcript
			show: name , ' matched';
			finishEntry.
		(om2Trans at: transId)
			at: #matched
			put: true ].! !

!OMeta2Debug methodsFor: 'as yet unclassified' stamp: 'pb 6/15/2015 05:53'!
debugLogTrace
	om2TraceLog add: om2Trans.
	om2Trans := Dictionary new.! !

!OMeta2Debug methodsFor: 'as yet unclassified' stamp: 'pb 6/15/2015 05:03'!
debugShouldTrace
	^ false! !

!OMeta2Debug methodsFor: 'as yet unclassified' stamp: 'pb 6/15/2015 05:52'!
debugStartTrans: name
	self debugShouldTrace ifTrue: [
		self flag: #todo.
		Transcript
			show: name , ' entered';
			finishEntry.
		om2TransId := om2TransId + 1.
		om2Trans
			at: om2TransId
			put:
				(Dictionary new
					
						at: #rule
						put: name;
					
						at: #matched
						put: false;
					yourself).
		^ om2TransId ].! !

!OMeta2Debug methodsFor: 'initialization' stamp: 'pb 6/15/2015 05:54'!
initialize
	super initialize.
	"
	om2FirstRun := true.
	om2ErrorIR := false.
	om2LastStartingPos := 1.
	"
	om2Eos := 0.
	om2ApplyPc := Dictionary new.
	om2ApplyWithArgsPc := Dictionary new.
	om2Trans := Dictionary new.
	om2TransId := 0.
	om2TraceLog := OrderedCollection new.! !

!OMeta2Debug methodsFor: 'as yet unclassified' stamp: 'pb 6/12/2015 07:08'!
om2DebugPc
	^ Dictionary new at: #applyPc put: om2ApplyPc; at: #applyWithArgsPc put: om2ApplyWithArgsPc; yourself! !

!OMeta2Debug methodsFor: 'as yet unclassified' stamp: 'pb 6/12/2015 07:17'!
om2DebugRoot: aRule
	om2DebugRoot := aRule! !

!OMeta2Debug methodsFor: 'ometa grammar' stamp: 'pb 6/12/2015 14:58'!
seq
	| xs |
	xs := self apply: #anything.
	[
	xs do: [ :x |
		" may want to inline #apply:withArgs: below as an
		  optimization, since this rule gets used a lot "
		self
			apply: #exactly
			withArgs: {x} ].
	^ xs ] on: Exception
		do: [ :e |
			(xs isKindOf: Collection)
				ifTrue: [ e signal
					"no idea what the problem is" ]
				ifFalse: [ OMeta2DebugError new signal: 'Not a sequence: ' , xs asString
					"we were probably passed in a character, number, etc..." ]].! !

!OMeta2Debug class methodsFor: 'as yet unclassified' stamp: 'pb 6/15/2015 02:21'!
compilerClass

        ^ OMeta2DebugCompiler! !

!OMeta2Debug class methodsFor: 'as yet unclassified' stamp: 'pb 6/12/2015 06:20'!
lastMatcher
	^ LastMatcher! !

!OMeta2Debug class methodsFor: 'as yet unclassified' stamp: 'pb 6/12/2015 07:18'!
matchStream: aReadStream with: aRule withArgs: args withPlaybackDebugging: debugging
	| input matcher ans |
	input := OM2LazyStream
		for: aReadStream
		withPos: 1.
	matcher := self new initInput: input.
	matcher om2DebugRoot: aRule.
	LastMatcher := matcher.
	[
	matcher
		apply: #empty
		withArgs: args.
	ans := matcher apply: aRule.
	matcher apply: #end.
	^ ans ]
		on: OM2Fail
		do: [ :e | | curr prev prevPrev |
			debugging ifFalse: [ e signal ].
			curr := input.
			prev := nil.
			prevPrev := nil.
			[ curr notNil ] whileTrue: [
				prevPrev := prev.
				prev := curr.
				curr := curr basicTail ].
			curr := prevPrev
				ifNil: [ prev ]
				ifNotNil: [ prevPrev ].
			"fixme - does this add any value?
		self inform: 'will halt each time matcher reaches ', curr printString.
		"
			matcher
				initInput: input;
				forgetEverything.
			curr ifNil: [ self error: 'you''ve found a bug -- please tell Alex' ].
			curr become: (OM2StreamDebugger for: curr copy).
			matcher haltingPoint: curr.
			matcher
				apply: #empty
				withArgs: args.
			ans := matcher apply: aRule.
			matcher apply: #end.
			Transcript
				show: matcher om2DebugPc asString;
				finishEntry.
			^ ans ].! !

!OMeta2ExtendedParser methodsFor: 'private' stamp: 'pb 6/17/2015 16:53'!
application =

	@<"^" name:rule args:as>:superIdx	-> [(self newNode: #SuperApp)
				properties: {#op -> rule.
							#args -> as.
							self newRange: superIdx type: #blockTempVar};
				yourself]
										//-> [{#SuperApp. rule}, as]
|	@<name:grm $. nsName:rule args:as>:app1Idx	-> [(self newNode: #App)
				properties: {#op -> #foreign.
					#parm -> grm.
					#huh1 -> ('#', rule) asSymbol.
					#huh2 -> as.
					self newRange: app1Idx type: #blockTempVar}]
										//-> [{#App. #foreign. grm. ('#', rule) asSymbol}, as]
|	@<name:rule args:as>:app2Idx					-> [(self newNode: #App)
				properties: { #op -> rule.
					#parm -> as.
					self newRange: app2Idx type: #blockTempVar.
					}]
										//-> [{#App. rule}, as]! !

!OMeta2ExtendedParser methodsFor: 'private' stamp: 'pb 6/17/2015 19:43'!
args =
	// fixme - best way to style?
	$( listOf(#squeakExpression. '.'):ans ")" -> [ans]
|	~$( -> [#()]! !

!OMeta2ExtendedParser methodsFor: 'private' stamp: 'pb 6/17/2015 17:27'!
characterLiteral =

	@<spaces $$ char:c>:cIdx -> [(self newNode: #App) properties: { #op -> #exactly.
																#parm -> c storeString.
																self newRange: cIdx type: #character}]
					//-> [{#App. #exactly. c storeString}]! !

!OMeta2ExtendedParser methodsFor: 'private' stamp: 'pb 6/17/2015 19:29'!
characters =

	@<"``" (~($' $') char)*:xs $' $'>:charIdx -> [(self newNode: #App) properties:
							{ #op -> #seq.
							#parm -> (String withAll: xs) storeString.
							self newRange:  charIdx type: #character}]
							//-> [{#App. #seq. (String withAll: xs) storeString}]! !

!OMeta2ExtendedParser methodsFor: 'private' stamp: 'pb 6/17/2015 19:36'!
expr =
	// Wrap the sub-expressions with an 'or'.  If it's not needed, we'll optimize it away later.
	// fixme - how to best highlight OR...
	listOf(#expr4. '|'):xs -> [(self newNode: #Or) addChildren: xs]
					//-> [(OrderedCollection with: #Or) addAll: xs; yourself]! !

!OMeta2ExtendedParser methodsFor: 'private' stamp: 'pb 6/17/2015 19:35'!
expr1 =
	// Handle any syntactic sugar and parse the final expression
	@<(keyword('true') | keyword('false') | keyword('nil')):lit>:litIdx
						-> [(self newNode: #App) properties: {#op -> #exactly. #parm -> lit. self newRange: litIdx type: #blockTempVar}]
						//-> [{#App. #exactly. lit}]
|	application
|	semanticAction
|	semanticPredicate
|	characters
|	tokenSugar
|	stringLiteral
|	symbolLiteral
|	numberLiteral
|	characterLiteral
|	"{"  expr:e "}" 		-> [(self newNode: #Form) properties: {#op -> e}]
						//-> [{#Form. e}]
|	"<"  expr:e ">" 	-> [(self newNode: #ConsBy) properties: {#op -> e}]
						//-> [{#ConsBy. e}]
|	"@<" expr:e ">" 	-> [(self newNode: #IdxConsBy) properties: {#op -> e}]
						//-> [{#IdxConsBy. e}]
|	"("  expr:e ")" -> [e]! !

!OMeta2ExtendedParser methodsFor: 'private' stamp: 'pb 6/17/2015 17:23'!
expr2 =
	// Handle lookahead
	@<"~" expr2:x>:xIdx -> [(self newNode: #Not) properties: {#op -> x. self newRange: xIdx type: #blockArg}] //-> [{#Not. x}]
|	@<"&" expr2:x>:xIdx -> [(self newNode: #Lookahead) properties: {#op -> x. self newRange: xIdx type: #blockArg}] //-> [{#Lookahead. x}]
|	expr1! !

!OMeta2ExtendedParser methodsFor: 'private' stamp: 'pb 6/17/2015 22:42'!
expr3 =
	// Handle arity and variable assignment
	expr2:x optIter(x):x
		(	$: nsName:n [temps add: n] -> [(self newNode: #Set) properties: {#op -> n. #parm -> x}]
										 //-> [{#Set. n. x}]
		|	empty						-> [x]
		)
|	":" nsName:n [temps add: n] -> [(self newNode: #Set) properties: {#op -> n};
										addChild: ((self newNode: #App) properties: {#op -> #anything})]
									 //-> [{#Set. n. {#App. #anything}}]! !

!OMeta2ExtendedParser methodsFor: 'private' stamp: 'pb 6/13/2015 20:00'!
expr4 =
	// Wrap related rule sub-expressions with an 'and'.  If it's not needed, we'll optimize it away later
	expr3*:xs -> [(self newNode: #And) addChildren: xs]
			//-> [(OrderedCollection with: #And) addAll: xs; yourself]! !

!OMeta2ExtendedParser methodsFor: 'private' stamp: 'pb 6/16/2015 22:02'!
initialize
	super initialize.
	ast := self newNode: #rule.
	curNode := ast.
	curNode properties at: #comments put: OrderedCollection new.
	temps := IdentitySet new.! !

!OMeta2ExtendedParser methodsFor: 'grammar' stamp: 'pb 6/16/2015 23:10'!
isSmalltalkCode = ~(^space* nsName expr4 "=") <char*>:squeakCode -> [true]
		|	anything* -> [false]
		// fixme - inefficient way to test! !

!OMeta2ExtendedParser methodsFor: 'private' stamp: 'pb 6/13/2015 06:31'!
keyword :xs =

	token(xs) ~letterOrDigit -> [xs]! !

!OMeta2ExtendedParser methodsFor: 'private' stamp: 'pb 6/12/2015 19:19'!
name =

	spaces nsName! !

!OMeta2ExtendedParser methodsFor: 'private' stamp: 'pb 6/12/2015 19:19'!
nameFirst =

	letter! !

!OMeta2ExtendedParser methodsFor: 'private' stamp: 'pb 6/12/2015 19:19'!
nameRest =

	nameFirst | digit! !

!OMeta2ExtendedParser methodsFor: 'private' stamp: 'pb 6/14/2015 17:29'!
newNode: nodeType
	^ SyntaxTreeNode node: nodeType.! !

!OMeta2ExtendedParser methodsFor: 'private' stamp: 'pb 6/17/2015 19:58'!
newRange: assoc and: otherAssoc type: type
	"create assoc to be use as a range property.  this currently covers every use case except comments in the space rule.  fixme... not currently used"
	| passoc |
	passoc := (self newRange: assoc type: type).
	passoc value add: (SHRange start: otherAssoc key end: otherAssoc value -1 type: type); yourself.
	^ passoc
! !

!OMeta2ExtendedParser methodsFor: 'private' stamp: 'pb 6/17/2015 02:26'!
newRange: assoc type: type
	"create assoc to be use as a range property.  this currently covers every use case except comments in the space rule"
	"#rangeIdxList -> (OrderedCollection new add: (SHRange start: app2Idx key end: app2Idx value type: #key); yourself)"
	^ #rangeIdxList ->
		(OrderedCollection new
			add:
				(SHRange
					start: assoc key
					end: assoc value - 1
					type: type);
			yourself).! !

!OMeta2ExtendedParser methodsFor: 'private' stamp: 'pb 6/13/2015 21:17'!
nsName =

	firstAndRest(#nameFirst. #nameRest):xs -> [(String withAll: xs) asSymbol]
|	$_ -> [#anything]
! !

!OMeta2ExtendedParser methodsFor: 'private' stamp: 'pb 6/17/2015 17:14'!
numberLiteral =

	@<spaces ($- spaces -> [-1] | empty -> [1]):sign digit+:ds>:numIdx
		-> [(self newNode: #App) properties: {#op -> #exactly.
				#parm -> (sign * (String withAll: ds) asNumber) storeString.
				self newRange: numIdx type: #number}]
		//-> [{#App. #exactly. (sign * (String withAll: ds) asNumber) storeString}]! !

!OMeta2ExtendedParser methodsFor: 'private' stamp: 'pb 6/17/2015 16:51'!
optIter :x =

	@<"*">:arManyIdx		-> [(self newNode: #Many) properties: {#parm -> x.
																	self newRange: arManyIdx type: #blockArg}]
			//-> [{#Many.  x}]
|	@<"+">:arMany1Idx		-> [(self newNode: #Many1) properties: {#parm -> x.
																	self newRange: arMany1Idx type: #blockArg}]
			//-> [{#Many1. x}]
|	@<"?">:arOptIdx ~$[	-> [(self newNode: #Opt) properties: {#parm -> x.
																	self newRange: arOptIdx type: #blockArg}]
			//-> [{#Opt. x}]
|	empty	-> [x]! !

!OMeta2ExtendedParser methodsFor: 'grammar' stamp: 'pb 6/17/2015 04:14'!
rule = ~(^space* nsName expr4 "=") <char*>:squeakCode -> [self newNode: #Squeak]
											//-> [{#Squeak. squeakCode}]
											// This isn't OMeta code so we'll handoff to Squeak when the time comes
|	&(^space* nsName):n rulePart(n):x ("," rulePart(n))*:xs spaces end
		-> [ curNode := (curNode node: #Rule) properties: {#temps -> temps asSortedCollection.
					#n -> n};
					addChild: ((self newNode: #Or) addChild: x; addChildren: xs)]
		//-> [{#Rule. n. temps asSortedCollection. (OrderedCollection with: #Or with: x) addAll: xs; yourself}]
! !

!OMeta2ExtendedParser methodsFor: 'private' stamp: 'pb 6/17/2015 22:42'!
rulePart :ruleName =
	// testing
	[nil]:retVal
	@<name:n ?[n = ruleName] expr4:b1>:nIdx -> [[curNode properties: {self newRange: nIdx type: #keyword}. retVal] value]
		(	@<"=">:nIdx2 expr:b2	-> [[((curNode properties at: #rangeIdxList) at: 1) end: nIdx2 value. retVal := (self newNode: #And) addChild: b1; addChild: b2] value] // nIdx2 is a hack to get to the '='.  Highly non-optimal as we really want params highlighted in a different style anyway
							//-> [{#And. b1. b2}]
		|	empty			-> [retVal := curNode addChild: b1]
							// [b1]
		)! !

!OMeta2ExtendedParser methodsFor: 'private' stamp: 'pb 6/17/2015 19:59'!
semanticAction =

	@<"->"? "[">:saIdx1 squeakExpression:e @<$]>:saIdx2 -> [(self newNode: #Act) properties: {#op -> e. self newRange: saIdx1 and: saIdx2 type: #patternArg}]
									//-> [{#Act. e}]! !

!OMeta2ExtendedParser methodsFor: 'private' stamp: 'pb 6/17/2015 20:00'!
semanticPredicate =

	@<"?[">:spIdx1 squeakExpression:e @<$]>:spIdx2 -> [(self newNode: #Pred) properties: {#op -> e. self newRange: spIdx1 and: spIdx2 type: #patternArg}]
								//-> [{#Pred. e}]! !

!OMeta2ExtendedParser methodsFor: 'private' stamp: 'pb 6/17/2015 02:26'!
space =

	^space
	| @<fromTo('/*'. '*/')>:longCommentIdx -> [(curNode properties at: #comments) add: (SHRange start: longCommentIdx key end: longCommentIdx value - 1 type: #comment)]
	| @<fromToEnd('//')>:commentIdx -> [(curNode properties at: #comments) add: (SHRange start: commentIdx key end: commentIdx value - 1 type: #comment)]! !

!OMeta2ExtendedParser methodsFor: 'private' stamp: 'pb 6/17/2015 17:16'!
squeakExpression = @<O2SqueakRecognizer.squeakExpr:ans>:sqIdx spaces
							-> [(self newNode: #Smalltalk) properties: {#parm -> ans.
									self newRange: sqIdx type: #externalFunctionCallingConvention}]
							//-> [ans]! !

!OMeta2ExtendedParser methodsFor: 'private' stamp: 'pb 6/17/2015 19:30'!
stringLiteral =

	@<"'" ($' $' -> [$'] | ~$' char)*:xs $'>:strIdx -> [(self newNode: #App) properties: 											{#op -> #exactly.
											 #parm ->  (String withAll: xs) storeString.
											self newRange: strIdx type: #text}]
									//-> [{#App. #exactly. (String withAll: xs) storeString}]! !

!OMeta2ExtendedParser methodsFor: 'private' stamp: 'pb 6/13/2015 20:02'!
symbolLiteral =

	// TODO: make this accept, e.g., #foo:bar:
	"#" nsName:s -> [(self newNode: #App) properties: {#op -> #exactly.
											#parm -> s storeString}]
				//-> [{#App. #exactly. s storeString}]! !

!OMeta2ExtendedParser methodsFor: 'private' stamp: 'pb 6/17/2015 16:48'!
tokenSugar =

	@<token('"') (~$" char)*:xs $">:tokIdx -> [(self newNode: #App) properties: {#op -> #token.
															#parm -> (String withAll: xs) storeString.
															self newRange: tokIdx type: #stringSymbol}]
							//-> [{#App. #token. (String withAll: xs) storeString}]! !

!OMeta2ExtendedParser class methodsFor: 'as yet unclassified' stamp: 'pb 6/17/2015 05:13'!
rangesFor: source
	| recurseForRanges result |
	(OMeta2ExtendedParser
		matchAll: source
		with: #isSmalltalkCode)
		ifTrue: [ ^ nil ]
		ifFalse: [
			result := OrderedCollection new.
			recurseForRanges := [ :ea :useResult | | p |
			p := ea properties.
			p
				at: #rangeIdxList
				ifPresent: [ :ranges |
					useResult addAll: ranges ].
			useResult ].
			(OMeta2ExtendedParser
				matchAll: source
				with: #rule) do: [ :ea | | p |
				p := ea properties.
				p
					at: #rangeIdxList
					ifPresent: [ :ranges |
						result addAll: ranges ].
				p
					at: #comments
					ifPresent: [ :ranges |
						result addAll: ranges ].
				p
					at: #op
					ifPresent: [ :op |
						(op isKindOf: SyntaxTreeNode) ifTrue: [
							recurseForRanges
								value: op
								value: result ]].
				p
					at: #parm
					ifPresent: [ :parm |
						(parm isKindOf: SyntaxTreeNode) ifTrue: [
							recurseForRanges
								value: parm
								value: result ]].
				result ].
			^ result sort: [ :a :b |
				a start < b start ]].! !

!OMeta2ExtendedParser class methodsFor: 'private' stamp: 'pb 6/17/2015 05:13'!
scratchParserNew
	^ OMeta2ExtendedParser matchAll: ((OMeta2ExtendedParser methodDict at: #rulePart) getSource) with: #rule! !

!OMeta2ExtendedParser class methodsFor: 'private' stamp: 'pb 6/17/2015 05:12'!
scratchParserStock
	"Stock OMeta rule parser"
	^ OMeta2RuleParser
		matchAll: (OMeta2ExtendedParser methodDict at: #rulePart) getSource
		with: #rule.! !

!OMeta2ExtendedParser class methodsFor: 'private' stamp: 'pb 6/17/2015 05:13'!
scratchRecurseSHRange
	| recurseForRanges result |
	result := OrderedCollection new.
	recurseForRanges := [ :ea :useResult | | p |
	p := ea properties.
	p
		at: #rangeIdxList
		ifPresent: [ :ranges |
			useResult addAll: ranges ].
	useResult ].
	OMeta2ExtendedParser demo do: [ :ea | | p |
		p := ea properties.
		p
			at: #rangeIdxList
			ifPresent: [ :ranges |
				result addAll: ranges ].
		p at: #comments ifPresent: [:ranges|
			result addAll: ranges].
		p
			at: #op
			ifPresent: [ :op |
				(op isKindOf: SyntaxTreeNode) ifTrue: [
					recurseForRanges
						value: op
						value: result ]].
		p
			at: #parm
			ifPresent: [ :parm |
				(parm isKindOf: SyntaxTreeNode) ifTrue: [
					recurseForRanges
						value: parm
						value: result ]].
		result ].
	^ result sort: [:a :b| a start<b start].! !

!OMeta2DebugRuleTranslator methodsFor: 'as yet unclassified' stamp: 'pb 6/15/2015 04:11'!
debugWrapRule: rule body: body
	^ {'debugTmpTransId:=self debugStartTrans: '''. rule. '''.
debugTmpResult :='. body. '.
self debugFinishTrans: '''. rule. ''' id: debugTmpTransId.
^ debugTmpResult'}.! !

!OMeta2DebugRuleTranslator methodsFor: 'as yet unclassified' stamp: 'pb 6/15/2015 03:56'!
initialize
	super initialize.
	transLog := OrderedCollection new.
	transLogId := 1.! !

!OMeta2DebugRuleTranslator methodsFor: 'as yet unclassified' stamp: 'pb 6/15/2015 04:00'!
rule =

	symbol:name
	anything:temps [temps select: [:t | (grammarClass instVarNames includes: t) not]]:temps
	trans:body
	-> [{name. ' | debugTmpResult debugTmpTransId '. self delim: temps asSortedCollection with: ' '. ' | '. self debugWrapRule: name body: body}]! !

!SHTextStylerOMeta2 methodsFor: 'as yet unclassified' stamp: 'pb 6/23/2015 03:01'!
attributesFor: aSymbol
	^ useOMetaStyler
		ifTrue: [ self class attributesFor: aSymbol ]
		ifFalse: [ smalltalkFallbackStyler class attributesFor: aSymbol ].! !

!SHTextStylerOMeta2 methodsFor: 'as yet unclassified' stamp: 'pb 6/23/2015 03:02'!
classOrMetaClass: anObject
	useOMetaStyler
		ifTrue: [ self ]
		ifFalse: [ smalltalkFallbackStyler classOrMetaClass: anObject ].! !

!SHTextStylerOMeta2 methodsFor: 'as yet unclassified' stamp: 'pb 6/17/2015 00:33'!
disableFormatAndConvert! !

!SHTextStylerOMeta2 methodsFor: 'as yet unclassified' stamp: 'pb 6/23/2015 02:59'!
initialize
	super initialize.
	useOMetaStyler := true.
	smalltalkFallbackStyler := SHTextStylerST80 new.! !

!SHTextStylerOMeta2 methodsFor: 'as yet unclassified' stamp: 'pb 6/17/2015 00:31'!
privateFormatAndConvert! !

!SHTextStylerOMeta2 methodsFor: 'as yet unclassified' stamp: 'pb 6/23/2015 03:00'!
privateStyle
	| ranges |
	ranges := [
	useOMetaStyler := true.
	OMeta2ExtendedParser rangesFor: formattedText ]
		on: OM2Fail
		do: [ ].
	"
	ranges ifNotNil: [
		useOMetaStyler
			ifTrue: [
				self
					setAttributesIn: formattedText
					fromRanges: ranges
					in: nil ]
			ifFalse: [
				smalltalkFallbackStyler
					setAttributesIn: formattedText
					fromRanges: ranges
					in: nil ]].
			"
	ranges ifNil: [
		"
		Transcript
			show: 'falling back';
			finishEntry.
			"
		ranges := smalltalkFallbackStyler
			rangesIn: formattedText
			setWorkspace: true.
		useOMetaStyler := false ].
	ranges ifNotNil: [
		self
			setAttributesIn: formattedText
			fromRanges: ranges
			in: nil ].! !

!SHTextStylerOMeta2 methodsFor: 'as yet unclassified' stamp: 'pb 6/16/2015 23:13'!
setAttributesIn: aText fromRanges: ranges in: anInterval
	"modified by jmv to keep existing attributes if they answer true to #isParagraphAttribute"
	| attributes defaultAttributes paragraphAttributes attr newRuns newValues lastAttr lastCount beginning chunkRuns end |
	anInterval
		ifNil: [
			beginning := 1.
			end := aText size ]
		ifNotNil: [
			beginning := anInterval first.
			end := anInterval last ].
	defaultAttributes := self attributesFor: #default.
	paragraphAttributes := Array new: end - beginning + 1.
	1
		to: paragraphAttributes size
		do: [ :i |
			paragraphAttributes
				at: i
				put:
					((aText attributesAt: i + beginning - 1) select: [ :each |
						each isParagraphAttribute ]) ].
	attributes := Array new: end - beginning + 1.
	1
		to: attributes size
		do: [ :i |
			attributes
				at: i
				put: (paragraphAttributes at: i) , defaultAttributes ].
	ranges do: [ :range |
		(attr := self attributesFor: range rangeType) ifNotNil: [
			range start
				to: range end
				do: [ :i |
					attributes
						at: i
						put: (paragraphAttributes at: i) , attr ]]].
	newRuns := OrderedCollection new: attributes size // 10.
	newValues := OrderedCollection new: attributes size // 10.
	1
		to: attributes size
		do: [ :i |
			attr := attributes at: i.
			i = 1
				ifTrue: [
					newRuns add: 1.
					lastCount := 1.
					lastAttr := newValues add: attr ]
				ifFalse: [
					attr == lastAttr
						ifTrue: [
							lastCount := lastCount + 1.
							newRuns
								at: newRuns size
								put: lastCount ]
						ifFalse: [
							newRuns add: 1.
							lastCount := 1.
							lastAttr := newValues add: attr ]]].
	chunkRuns := (RunArray
		runs: newRuns
		values: newValues) coalesce.
	aText
		basicReplaceAttributesFrom: beginning
		to: end
		with: chunkRuns.! !

!SHTextStylerOMeta2 class methodsFor: 'as yet unclassified' stamp: 'pb 6/17/2015 00:15'!
attributeArrayForColor: aColorOrNil emphasis: anEmphasisSymbolOrArrayorNil
	"Answer a new Array containing any non nil TextAttributes specified"
	| answer emphArray |
	answer := #().
	aColorOrNil ifNotNil: [ answer := answer , {TextColor color: aColorOrNil} ].
	anEmphasisSymbolOrArrayorNil ifNotNil: [
		emphArray := anEmphasisSymbolOrArrayorNil isSymbol
			ifTrue: [ {anEmphasisSymbolOrArrayorNil} ]
			ifFalse: [ anEmphasisSymbolOrArrayorNil ].
		emphArray do: [ :each |
			each ~= #normal ifTrue: [ answer := answer , {TextEmphasis perform: each} ]]].
	^ answer.! !

!SHTextStylerOMeta2 class methodsFor: 'as yet unclassified' stamp: 'pb 6/17/2015 01:19'!
attributesFor: aSymbol
	textAttributes ifNil: [ textAttributes := self initialTextAttributes ].
	^ textAttributes
		at: aSymbol
		ifAbsent: (self attributeArrayForColor: Color black emphasis: nil).! !

!SHTextStylerOMeta2 class methodsFor: 'as yet unclassified' stamp: 'pb 6/17/2015 22:50'!
initialTextAttributes
	"emphasis can be bold, italic, underlined... what about outline & strikethrough?"
	| attrArray color dict element emphasis styleTable |
	styleTable := Theme current generateShoutConfig.
	dict := Dictionary new.
	false ifTrue: [
	styleTable do: [:each|
		element := each first.
		color := each at: 2 ifAbsent: nil.
		color:=color ifNotNil: [ Color colorFrom: color].
		emphasis := each at: 3 ifAbsent: nil.
		attrArray := self attributeArrayForColor: color emphasis: emphasis.
		attrArray notEmpty 
			ifTrue: [
				dict at: element put: attrArray]
		].
	^ dict
	] ifFalse: [
	^ Dictionary new
		
			at: #default
			put:
				(self
					attributeArrayForColor: Color black
					emphasis: nil);
		
			at: #comment
			put:
				(self
					attributeArrayForColor: Color green
					emphasis: #italic);
		
			at: #keyword "rule"
			put:
				(self
					attributeArrayForColor: Color blue
					emphasis: #bold);
		
			at: #blockArg "arity/lookahead"
			put:
				(self
					attributeArrayForColor: Color orange
					emphasis: #bold);
		
			at: #blockTempVar "apply/rule name"
			put:
				(self
					attributeArrayForColor: Color gray
					emphasis: nil);
		
			at: #text
			put:
				(self
					attributeArrayForColor: Color blue
					emphasis: #underlined);
		
			at: #stringSymbol "token"
			put:
				(self
					attributeArrayForColor: Color darkBlue
					emphasis: #underlined);

			at: #character
			put:
				(self
					attributeArrayForColor: Color orange
					emphasis: nil);

			at: #patternArg "semantic action/predicate"
			put:
				(self
					attributeArrayForColor: Color cyan muchDarker
					emphasis: nil);

			at: #number
			put:
				(self
					attributeArrayForColor: Color purple
					emphasis: nil);

			at: #externalFunctionCallingConvention "squeak code"
			put:
				(self
					attributeArrayForColor: Color brown
					emphasis: nil);
		yourself.
		]! !

!SHTextStylerOMeta2 class methodsFor: 'private-development' stamp: 'pb 6/17/2015 01:09'!
resetAttributes
	textAttributes := nil! !

!SyntaxTreeNode methodsFor: 'adding' stamp: 'pb 6/12/2015 21:15'!
addChild: aNode
	children add: aNode! !

!SyntaxTreeNode methodsFor: 'adding' stamp: 'pb 6/13/2015 02:21'!
addChildren: nodes
	nodes do: [ :curNode |
		children add: curNode ].! !

!SyntaxTreeNode methodsFor: 'converting' stamp: 'pb 6/14/2015 02:42'!
asArray
	^ self collect: [:ea| ea]! !

!SyntaxTreeNode methodsFor: 'accessing' stamp: 'pb 6/13/2015 19:10'!
at: key
	^ properties at: key.! !

!SyntaxTreeNode methodsFor: 'accessing' stamp: 'pb 6/13/2015 19:09'!
at: key put: value
	^ properties
		at: key
		put: value.! !

!SyntaxTreeNode methodsFor: 'private' stamp: 'pb 6/14/2015 01:51'!
children
	^ children! !

!SyntaxTreeNode methodsFor: 'enumerating' stamp: 'pb 6/14/2015 02:54'!
childrenDo: aBlock
	"Call aBlock for each direct child"
	children do: aBlock.! !

!SyntaxTreeNode methodsFor: 'enumerating' stamp: 'pb 6/14/2015 02:46'!
collect: aBlock
	"Recurse the tree depth-first collecting the result of calling aBlock for each element"
	^ self
		collectDepthFirst: aBlock
		with: self.! !

!SyntaxTreeNode methodsFor: 'private' stamp: 'pb 6/14/2015 02:46'!
collectDepthFirst: aBlock with: node
	"Recurse the tree depth-first collecting the result of calling aBlock for each element"
	| results |
	results := OrderedCollection new.
	results add: (aBlock value: node).
	node childrenDo: [ :cnode |
		results addAll:
			(self
				collectDepthFirst: aBlock
				with: cnode) ].
	^ results.! !

!SyntaxTreeNode methodsFor: 'enumerating' stamp: 'pb 6/14/2015 02:46'!
do: aBlock
	"Recurse the tree depth-first calling aBlock for each element"
	^ self
		doDepthFirst: aBlock
		with: self.! !

!SyntaxTreeNode methodsFor: 'private' stamp: 'pb 6/14/2015 02:46'!
doDepthFirst: aBlock with: node
	"Recurse the tree depth-first calling aBlock for each element"
	aBlock value: node.
	node childrenDo: [ :cnode |
		self
			doDepthFirst: aBlock
			with: cnode ].! !

!SyntaxTreeNode methodsFor: 'initialization' stamp: 'pb 6/13/2015 01:52'!
initialize
	super initialize.
	properties := Dictionary new.
	children := OrderedCollection new.! !

!SyntaxTreeNode methodsFor: 'accessing' stamp: 'pb 6/13/2015 18:32'!
node
	^ node! !

!SyntaxTreeNode methodsFor: 'accessing' stamp: 'pb 6/12/2015 21:18'!
node: aNode
	node := aNode! !

!SyntaxTreeNode methodsFor: 'printing' stamp: 'pb 6/13/2015 18:30'!
printOn: aStream
	| title |
	title := self class name.
	aStream
		nextPutAll:
			(title first isVowel
				ifTrue: [ 'an ' ]
				ifFalse: [ 'a ' ]);
		nextPutAll: title;
		nextPutAll: '(';
		nextPutAll: node asString;
		nextPutAll: ')'.! !

!SyntaxTreeNode methodsFor: 'private' stamp: 'pb 6/16/2015 17:23'!
properties
	^ properties! !

!SyntaxTreeNode methodsFor: 'accessing' stamp: 'pb 6/13/2015 19:09'!
properties: propColl
	propColl do: [ :prop |
		self
			at: prop key
			put: prop value ].! !

!SyntaxTreeNode class methodsFor: 'as yet unclassified' stamp: 'pb 6/13/2015 02:14'!
node: aNode
	^ (self
		new)
		node: aNode;
		yourself.! !

!SyntaxTreeNode class methodsFor: 'private' stamp: 'pb 6/14/2015 02:01'!
testTree
	| child node |
	node := self node: 1.
	child := self node: 2.
	5
		to: 7
		do: [ :idx | | gChild |
			gChild := self node: idx.
			gChild addChild: (self node: idx * 10).
			child addChild: gChild ].
	node addChild: child.
	child := self node: 3.
	8
		to: 10
		do: [ :idx |
			child addChild: (self node: idx) ].
	node addChild: child.
	child := self node: 4.
	11
		to: 13
		do: [ :idx |
			child addChild: (self node: idx) ].
	node addChild: child.
	^ node.! !
