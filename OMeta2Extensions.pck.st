'From Cuis 5.0 [latest update: #4219] on QDate(2020-06-18) at 2:51:48 am'!
'Description Optional extensions to OMeta including: syntax highlighting in Browser windows, basic debugging and profiling.'!
!provides: 'OMeta2Extensions' 2 20!
!requires: 'OMeta2' 2 0 nil!
SystemOrganization addCategory: #OMeta2Extensions!


!classDefinition: #OMeta2DebugError category: #OMeta2Extensions!
Error subclass: #OMeta2DebugError
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2Extensions'!
!classDefinition: 'OMeta2DebugError class' category: #OMeta2Extensions!
OMeta2DebugError class
	instanceVariableNames: ''!

!classDefinition: #SHTextStylerOMeta2 category: #OMeta2Extensions!
SHTextStyler subclass: #SHTextStylerOMeta2
	instanceVariableNames: 'smalltalkFallbackStyler useSmalltalkStyler'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2Extensions'!
!classDefinition: 'SHTextStylerOMeta2 class' category: #OMeta2Extensions!
SHTextStylerOMeta2 class
	instanceVariableNames: 'textAttributes'!

!classDefinition: #SHTextStylerOtherOMeta2 category: #OMeta2Extensions!
SHTextStylerOMeta2 subclass: #SHTextStylerOtherOMeta2
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2Extensions'!
!classDefinition: 'SHTextStylerOtherOMeta2 class' category: #OMeta2Extensions!
SHTextStylerOtherOMeta2 class
	instanceVariableNames: ''!

!classDefinition: #OMeta2DebugRuleTranslator category: #OMeta2Extensions!
OMeta2RuleTranslator subclass: #OMeta2DebugRuleTranslator
	instanceVariableNames: 'transLogId transLog tempSequenceId'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2Extensions'!
!classDefinition: 'OMeta2DebugRuleTranslator class' category: #OMeta2Extensions!
OMeta2DebugRuleTranslator class
	instanceVariableNames: ''!

!classDefinition: #OMeta2Debug category: #OMeta2Extensions!
OMeta2 subclass: #OMeta2Debug
	instanceVariableNames: 'om2ApplyPc om2ApplyWithArgsPc om2DebugRoot om2Eos om2TraceLog om2Trans om2TransId'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2Extensions'!
!classDefinition: 'OMeta2Debug class' category: #OMeta2Extensions!
OMeta2Debug class
	instanceVariableNames: 'LastMatcher'!

!classDefinition: #OMeta2ExtendedRuleParser category: #OMeta2Extensions!
OMeta2 subclass: #OMeta2ExtendedRuleParser
	instanceVariableNames: 'ast curNode temps blockLevel'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2Extensions'!
!classDefinition: 'OMeta2ExtendedRuleParser class' category: #OMeta2Extensions!
OMeta2ExtendedRuleParser class
	instanceVariableNames: ''!

!classDefinition: #OMeta2RuleIntrospection category: #OMeta2Extensions!
OMeta2 subclass: #OMeta2RuleIntrospection
	instanceVariableNames: 'result'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2Extensions'!
!classDefinition: 'OMeta2RuleIntrospection class' category: #OMeta2Extensions!
OMeta2RuleIntrospection class
	instanceVariableNames: ''!

!classDefinition: #SyntaxTreeNode category: #OMeta2Extensions!
Object subclass: #SyntaxTreeNode
	instanceVariableNames: 'node properties children'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2Extensions'!
!classDefinition: 'SyntaxTreeNode class' category: #OMeta2Extensions!
SyntaxTreeNode class
	instanceVariableNames: ''!


!OMeta2DebugError commentStamp: '<historical>' prior: 0!
This is so we can determine debug vs. regular OMeta runtime errors!

!SHTextStylerOMeta2 commentStamp: '<historical>' prior: 0!
Styler for OMeta2-based code (which can include Smalltalk)!

!SHTextStylerOtherOMeta2 commentStamp: '<historical>' prior: 0!
Styler for 'other' OMeta2-based code (which doesn't necessarily use OMeta or Smalltalk syntax).  Since this can be arbitrary code, it doesn't attempt to parse it: it bolds the first line and displays the rest as normal text.

FIXME - when in prettyPrint mode should use a fallback Smalltalk styler (so actually we want to use the fallback parser as the primary (can't it doesn't error... so we use the OMeta parser which also handles Smalltalk... FIXME: hack) and if it fails, do it another way)!

!OMeta2Debug commentStamp: '<historical>' prior: 0!
This is a debugging and profiling version of OMeta2.  It trades quite a bit of performance to try to detect and report known runtime errors and collect detailed statistics.  This is often worthwhile when initially designing and debugging a parser.

To use, simply set this class as your parser's parent class.  Once you're happy with how the parser is operating, feel free to change your parser's parent class back to OMeta2 to eliminate the runtime overhead.

todo: infinite recursion detection

FIXME - due to inlining, need to move apply overrides to a subclass of OMeta2Translator!

!OMeta2ExtendedRuleParser commentStamp: '<historical>' prior: 0!
This is a more full-featured OMeta parser that renders to a labelled syntax tree.  While significantly larger than the default parser, it will allow for much more flexibility.

Open issues:
- should I even be trying to re-use Smalltalk themes?  There is no clean mapping so even if we do it, using other themes may look unacceptably bad.
- need to finalize approach: extend existing ast or go with a more annotated version?!

!OMeta2RuleIntrospection commentStamp: '<historical>' prior: 0!
Utility rules to ask questions about rules.  While these rules aren't directly used compiling OMeta2 code into Smalltalk, they help with some core functionality.  All of these rules expect to match a parsed rule AST.

Note: these rules all assume that you are using OMeta in the 'normal' way via OMeta source code.  If you are directly invoking rules via Smalltalk blocks etc., these rules will not see that.!

!SyntaxTreeNode commentStamp: '<historical>' prior: 0!
A simple, generic syntax tree node which can be used for both concrete and abstract trees.!

!OMeta2ExtendedRuleParser methodsFor: 'private' stamp: 'pb 5/1/2020 19:12:57'!
name =
	spaces nsName! !

!SyntaxTreeNode methodsFor: 'printing' stamp: 'pb 10/15/2017 19:36:10'!
printOn: aStream
	| title |
	title := self class name.
	aStream
		nextPutAll:
			(title first isVowel
				ifTrue: [ 'an ' ]
				ifFalse: [ 'a ' ]);
		nextPutAll: title;
		nextPut: $(;
		print: node;
		nextPut: $).! !

!SHTextStylerOMeta2 methodsFor: 'private' stamp: 'pb 9/3/2017 19:21:52'!
attributesFor: aSymbol
	^ useSmalltalkStyler
		ifTrue: [ smalltalkFallbackStyler class attributesFor: aSymbol ]
		ifFalse: [ self class attributesFor: aSymbol ].! !

!SHTextStylerOMeta2 methodsFor: 'private' stamp: 'pb 5/2/2020 23:32:03'!
classOrMetaClass: anObject
	"FIXME - this is rather inefficient but if we don't determine which styler to use here (via #pvtExtractRangesFromSource), the first time we view pretty printed code it will use the wrong styler"
	self pvtExtractRangesFromSource.
	^ useSmalltalkStyler
		ifTrue: [ smalltalkFallbackStyler classOrMetaClass: anObject ]
		ifFalse: [ self ].! !

!SHTextStylerOMeta2 methodsFor: 'private' stamp: 'pb 6/17/2015 00:33'!
disableFormatAndConvert! !

!SHTextStylerOMeta2 methodsFor: 'private' stamp: 'pb 6/17/2015 00:31'!
privateFormatAndConvert! !

!SHTextStylerOMeta2 methodsFor: 'private' stamp: 'pb 5/2/2020 23:32:29'!
privateStyle
	| ranges |
	ranges _ self pvtExtractRangesFromSource.
	ranges ifNil: [
		ranges _ smalltalkFallbackStyler
			textModel: textModel;
			
				formatAndStyle: textModel actualContents
				allowBackgroundStyleProcess: false;
			parseSetWorkspace: true ].
	ranges ifNotNil: [
		self
			setAttributesIn: formattedText
			fromRanges: ranges
			in: nil ].! !

!SHTextStylerOMeta2 methodsFor: 'private' stamp: 'pb 5/2/2020 23:34:52'!
pvtExtractRangesFromSource
	useSmalltalkStyler _ true.
	^ formattedText ifNotNil: [
		(self class rangeParserClass extractRangesFromSmalltalkSourceCode: formattedText) ifNotNil: [ :useRanges |
			useSmalltalkStyler _ false.
			useRanges ]]! !

!SHTextStylerOMeta2 methodsFor: 'private' stamp: 'pb 6/16/2015 23:13'!
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

!SHTextStylerOMeta2 methodsFor: 'private' stamp: 'pb 5/2/2020 14:29:41'!
workspace: inst
	"Needed for Debugger>>shoutAboutToStyle:"
	self flag: #FIXME.
	^ nil.! !

!SHTextStylerOMeta2 methodsFor: 'initialization' stamp: 'pb 9/3/2017 19:21:19'!
initialize
	super initialize.
	useSmalltalkStyler := false.
	smalltalkFallbackStyler := SHTextStylerST80 new.! !

!SHTextStylerOMeta2 class methodsFor: 'accessing' stamp: 'pb 5/1/2020 19:13:39'!
rangeParserClass
	^ OMeta2ExtendedRuleParser.! !

!SHTextStylerOMeta2 class methodsFor: 'private' stamp: 'pb 6/17/2015 00:15'!
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

!SHTextStylerOMeta2 class methodsFor: 'private' stamp: 'pb 4/22/2020 02:50:53'!
attributesFor: aSymbol
	^ (textAttributes ifNil: [ textAttributes := self initialTextAttributes ])
		at: aSymbol
		ifAbsent:
			(self
				attributeArrayForColor: Color black
				emphasis: nil).! !

!SHTextStylerOMeta2 class methodsFor: 'private' stamp: 'pb 5/23/2018 01:53:53'!
initialTextAttributes
	"emphasis can be bold, italic, underlined... what about outline & strikethrough?"
	false
		ifTrue: [ | attrArray color dict element emphasis styleTable |
			"FIXME - at some point want to finish integrating with themes rather than the hard-coded approach currently being used..."
			styleTable := Theme current generateShoutConfig.
			dict := Dictionary new.
			styleTable do: [ :each |
				element := each first.
				color := each
					at: 2
					ifAbsent: nil.
				color := color ifNotNil: [ Color colorFrom: color ].
				emphasis := each
					at: 3
					ifAbsent: nil.
				attrArray := self
					attributeArrayForColor: color
					emphasis: emphasis.
				attrArray notEmpty ifTrue: [
					dict
						at: element
						put: attrArray ]].
			^ dict ]
		ifFalse: [ "keys: #nil->keywords (true/false/nil)
			#tempVar->inst vars
			#comment->/* */ and // comments
			#blockStartN->block nesting level
			#keyword->rules & parms
			#blockArg->arity (*+?)/lookahead (&~)
			#blockTempVar->apply/rule name
			#text->'string'
			#stringSymbol->token
			#character->$c and ``abc''
			#patternArg->semantic action/predicate
			#number->123
			#externalFunctionCallingConvention->squeak code"
			^ Dictionary new
				addAll:
					{
						#nil ->
							(self
								attributeArrayForColor: Color red muchDarker
								emphasis: nil). 
						#tempVar ->
							(self
								attributeArrayForColor: Color gray muchDarker
								emphasis: #italic). 
						#blockStart1 ->
							(self
								attributeArrayForColor:
									(Color
										r: 0.6
										g: 0.6
										b: 0.6)
								emphasis: nil). 
						#blockStart2 ->
							(self
								attributeArrayForColor:
									(Color
										r: 0.45
										g: 0.45
										b: 0.45)
								emphasis: nil). 
						#blockStart3 ->
							(self
								attributeArrayForColor:
									(Color
										r: 0.3
										g: 0.3
										b: 0.3)
								emphasis: nil). 
						#blockStart4 ->
							(self
								attributeArrayForColor:
									(Color
										r: 0.15
										g: 0.15
										b: 0.15)
								emphasis: nil). 
						#blockStart5 ->
							(self
								attributeArrayForColor:
									(Color
										r: 0.0
										g: 0.0
										b: 0.0)
								emphasis: nil). 
						#default ->
							(self
								attributeArrayForColor: Color black
								emphasis: nil). 
						#comment ->
							(self
								attributeArrayForColor: Color green
								emphasis: #italic). 
						#keyword ->
							(self
								attributeArrayForColor: Color blue lighter
								emphasis: #bold). 
						#blockArg ->
							(self
								attributeArrayForColor: Color orange lighter
								emphasis: #bold). 
						#blockTempVar ->
							(self
								attributeArrayForColor: Color blue
								emphasis: nil). 
						#text ->
							(self
								attributeArrayForColor: Color blue
								emphasis: #bold). 
						#stringSymbol ->
							(self
								attributeArrayForColor: Color blue muchDarker
								emphasis: #bold). 
						#symbol ->
							(self
								attributeArrayForColor: Color blue darker
								emphasis: #bold). 
						#character ->
							(self
								attributeArrayForColor: Color red muchDarker
								emphasis: nil). 
						#patternArg ->
							(self
								attributeArrayForColor: Color cyan muchDarker
								emphasis: nil). 
						#number ->
							(self
								attributeArrayForColor: Color purple
								emphasis: nil). 
						#externalFunctionCallingConvention ->
							(self
								attributeArrayForColor: Color cyan veryMuchDarker
								emphasis: nil)
					};
				yourself ].! !

!SHTextStylerOMeta2 class methodsFor: 'private' stamp: 'pb 6/18/2020 02:35:14'!
privateResetTextAttributes
	textAttributes := nil! !

!SHTextStylerOMeta2 class methodsFor: 'private-development' stamp: 'pb 6/17/2015 01:09'!
resetAttributes
	textAttributes := nil! !

!SHTextStylerOtherOMeta2 methodsFor: 'private' stamp: 'pb 4/25/2020 04:01:29'!
privateStyle
	| ranges |
	useSmalltalkStyler := true.
	ranges := self class rangeParserClass extractRangesFromSmalltalkSourceCode: formattedText.
	ranges ifNil: [ | idx |
		useSmalltalkStyler := false.
		idx := formattedText indexOf: Character lf.
		ranges := idx > 0
			ifTrue: [
				{
					SHRange
						start: 1
						end: idx - 1
						type: #bold. 
					SHRange
						start: idx
						end: formattedText size
						type: #normal
				} ]
			ifFalse: [
				{
					SHRange
						start: 1
						end: formattedText size
						type: #error
				} ]].
	ranges ifNotNil: [
		self
			setAttributesIn: formattedText
			fromRanges: ranges
			in: nil ].! !

!SHTextStylerOtherOMeta2 class methodsFor: 'private' stamp: 'pb 9/3/2017 18:32:05'!
initialTextAttributes
	"emphasis can be bold, italic, underlined... what about outline & strikethrough?"
	^ Dictionary new
		
			at: #bold
			put:
				(self
					attributeArrayForColor: Color black
					emphasis: #bold);
		
			at: #default
			put:
				(self
					attributeArrayForColor: Color black
					emphasis: nil);
		
			at: #error
			put:
				(self
					attributeArrayForColor: Color red
					emphasis: nil);
		yourself.! !

!SHTextStylerOtherOMeta2 class methodsFor: 'as yet unclassified' stamp: 'pb 5/1/2020 19:13:47'!
rangeParserClass
	^ OMeta2ExtendedRuleParser.! !

!OMeta2DebugRuleTranslator methodsFor: 'private' stamp: 'pb 6/20/2016 21:54'!
debugNextSequenceId
	"Some generated debugging code requires unique generated names in the event of nesting... a sequence provides uniqueness."
	^ tempSequenceId  := tempSequenceId + 1! !

!OMeta2DebugRuleTranslator methodsFor: 'private' stamp: 'pb 4/30/2020 23:56:38'!
debugWrapRule: rule body: body
	^ {'debugTmpTransId:=self pvtOMetaDebugStartTrans: #'. rule . '.
debugTmpResult :='. body. '.
self pvtOMetaDebugFinishTrans: #'. rule. ' id: debugTmpTransId.
^ debugTmpResult'}.! !

!OMeta2DebugRuleTranslator methodsFor: 'private' stamp: 'pb 5/30/2020 16:04:08'!
form =
// FIXME - doing it here so that #pvtOMetaForm: doesn't need to know about debug transactions...
// Form is a sort of built-in sub-rule that can be useful to trace when troubleshooting with structured data
//	trans:x -> [{'(self pvtOMetaForm: ['. x. '])'}]
	[self flag: #pvtOMetaForm:;
		flag: #pvtOMetaDebugStartTrans:]
	[self debugNextSequenceId asString]:ftId
	trans:x -> [{'[|fresult',ftId,' ftr',ftId,'|
			ftr',ftId,' := self pvtOMetaDebugStartTrans: #subRuleForm.
			fresult',ftId,':=(self pvtOMetaForm: ['. x. ']).
			self pvtOMetaDebugFinishTrans: #subRuleForm id: ftr',ftId,'.
			fresult',ftId,'] value'}]! !

!OMeta2DebugRuleTranslator methodsFor: 'private' stamp: 'pb 5/23/2018 03:00:51'!
rule =

	symbol:name
	anything:temps [temps select: [:t | (grammarClass instVarNames includes: t) not]]:temps
	trans:body
	-> [{name. ' | debugTmpResult debugTmpTransId '. self delim: temps asSortedCollection with: ' '. ' | '. self class constOMetaGeneratorString. self debugWrapRule: name body: body}]! !

!OMeta2DebugRuleTranslator methodsFor: 'initialization' stamp: 'pb 6/20/2016 21:52'!
initialize
	super initialize.
	tempSequenceId := 0.
	transLog := OrderedCollection new.
	transLogId := 1.! !

!OMeta2Debug methodsFor: 'initialization' stamp: 'pb 10/1/2017 15:26:31'!
initialize
	super initialize.
	om2Eos := 0.
	om2ApplyPc := Dictionary new.
	om2ApplyWithArgsPc := Dictionary new.
	om2Trans := Dictionary new.
	om2TransId := 0.
	om2TraceLog := OrderedCollection new.! !

!OMeta2Debug methodsFor: 'ometa grammar' stamp: 'pb 5/5/2020 08:22:32'!
privateOMetaApply: aRule
	input class = OM2EndOfStream ifTrue: [
		om2Eos > 100000
			ifTrue: [ OMeta2DebugError new signal: 'Infinite recursion detected'
				"There's a good possibility that there is a rule with optional arity (i.e. using * and/or ?) that is being matched even though we are at the end of the input stream." ]
			ifFalse: [ om2Eos := om2Eos + 1 ]].
	om2ApplyPc
		at: aRule
		put:
			(om2ApplyPc
				at: aRule
				ifAbsentPut: [ 0 ]) + 1.
	^ super privateOMetaApply: aRule.
! !

!OMeta2Debug methodsFor: 'ometa grammar' stamp: 'pb 5/5/2020 08:22:46'!
privateOMetaApply: aRule withArgs: args
	om2ApplyWithArgsPc
		at: aRule
		put:
			(om2ApplyWithArgsPc
				at: aRule
				ifAbsentPut: [ 0 ]) + 1.
	^ super
		privateOMetaApply: aRule
		withArgs: args.! !

!OMeta2Debug methodsFor: 'ometa grammar' stamp: 'pb 5/5/2020 08:27:25'!
seq
	| xs |
	xs := self privateOMetaApply: #anything.
	[
	xs do: [ :x |
		" may want to inline #apply:withArgs: below as an
		  optimization, since this rule gets used a lot "
		self
			privateOMetaApply: #exactly
			withArgument: x ].
	^ xs ] on: Exception
		do: [ :e |
			(xs isKindOf: Collection)
				ifTrue: [ e pass
					"no idea what the problem is" ]
				ifFalse: [ OMeta2DebugError new signal: 'Not a sequence: ' , xs asString
					"we were probably passed in a character, number, etc..." ]].! !

!OMeta2Debug methodsFor: 'private' stamp: 'pb 4/30/2020 23:59:02'!
ometaDebugPc
	^ Dictionary new
		
			at: 'applyPc'
			put: om2ApplyPc;
		
			at: 'applyWithArgsPc'
			put: om2ApplyWithArgsPc;
		yourself.! !

!OMeta2Debug methodsFor: 'private' stamp: 'pb 4/30/2020 23:59:33'!
ometaDebugRoot: aRule
	om2DebugRoot := aRule! !

!OMeta2Debug methodsFor: 'private' stamp: 'pb 5/1/2020 00:18:32'!
pvtOMetaDebugFinishTrans: name id: transId
	self pvtOMetaDebugShouldTrace ifTrue: [
		(om2Trans at: transId)
			
				at: 'matched'
				put: true;
			
				at: 'pos'
				put: self ometaPositionInStream ].! !

!OMeta2Debug methodsFor: 'private' stamp: 'pb 4/30/2020 23:58:16'!
pvtOMetaDebugLogTrace
	om2TraceLog add: om2Trans.
	om2Trans := Dictionary new.! !

!OMeta2Debug methodsFor: 'private' stamp: 'pb 4/30/2020 23:58:33'!
pvtOMetaDebugShouldTrace
	^ false! !

!OMeta2Debug methodsFor: 'private' stamp: 'pb 5/1/2020 00:18:39'!
pvtOMetaDebugStartTrans: name
	self pvtOMetaDebugShouldTrace ifTrue: [
		om2TransId := om2TransId + 1.
		om2Trans
			at: om2TransId
			put:
				(Dictionary new
					
						at: 'rule'
						put: name;
					
						at: 'matched'
						put: false;
					
						at: 'pos'
						put: self ometaPositionInStream;
					yourself).
		^ om2TransId ].! !

!OMeta2Debug class methodsFor: 'accessing' stamp: 'pb 6/12/2015 06:20'!
lastMatcher
	^ LastMatcher! !

!OMeta2Debug class methodsFor: 'private' stamp: 'pb 5/10/2020 14:19:09'!
matchStream: aReadStream with: aRule withArgs: args withPlaybackDebugging: debugging
	| input matcher ans |
	input := OM2LazyStream
		for: aReadStream
		withPos: 1.
	matcher := self new initOMetaInputStream: input.
	matcher ometaDebugRoot: aRule.
	LastMatcher := matcher.
	ans := self
		pvtMatchOMetaStream: input
		matcher: matcher
		with: aRule
		withArgs: args
		withPlaybackDebugging: debugging.
	Transcript
		show: matcher ometaDebugPc asString;
		finishEntry.
	^ ans.! !

!OMeta2Debug class methodsFor: 'private' stamp: 'pb 2/3/2016 21:33'!
ometa2RuleTranslatorClass
	^ OMeta2DebugRuleTranslator.! !

!OMeta2ExtendedRuleParser methodsFor: 'private' stamp: 'pb 5/2/2020 05:20:27'!
application =
	@<"^" name:rule>:superIdx args:as	-> [(self pvtNewNode: #SuperApp)
				properties: {#op -> rule.
							#args -> as.
							self pvtNewRange: superIdx type: #blockTempVar};
				yourself]
|	@<name:grm $. nsName:rule>:app1Idx	 @<args:as>:app2Idx -> [(self pvtNewNode: #App)
				properties: {#op -> #pvtOMetaForeignParser.
					#parm -> grm.
					#huh1 -> ('#', rule) asSymbol.
					#huh2 -> as.
					self pvtNewRange: app1Idx type: #blockTempVar with: app2Idx type: #externalFunctionCallingConvention}]
|	@<name:rule>:app1Idx @<args:as>:app2Idx					-> [(self pvtNewNode: #App)
				properties: { #op -> rule.
					#parm -> as.
					self pvtNewRange: app1Idx type: #blockTempVar with: app2Idx type: #externalFunctionCallingConvention}]! !

!OMeta2ExtendedRuleParser methodsFor: 'private' stamp: 'pb 5/2/2020 02:02:32'!
args =
	/* FIXME
	$( (
	listOf(#squeakArgExprOrWrappedInnerBlock, ',')
	|  listOf(#squeakExpression, '.')
	):ans ")" -> [ans]
	*/
	$( listOf(#squeakArgExprOrWrappedInnerBlock, ','):ans ")" -> [ans] // new syntax
|	$( listOf(#squeakExpression, '.'):ans ")" -> ["Transcript show: 'legacy listOf syntax with args: ', ans asString; finishEntry." ans] // legacy syntax
|	~$( -> [#()]! !

!OMeta2ExtendedRuleParser methodsFor: 'private' stamp: 'pb 5/2/2020 05:20:34'!
characterLiteral =
	@<spaces $$ char:c>:cIdx -> [(self pvtNewNode: #App) properties: { #op -> #exactly.
																#parm -> c storeString.
																self pvtNewRange: cIdx type: #character}]! !

!OMeta2ExtendedRuleParser methodsFor: 'private' stamp: 'pb 5/2/2020 05:20:38'!
characters =
	@<"``" (~($' $') char)*:xs $' $'>:charIdx -> [(self pvtNewNode: #App) properties:
							{ #op -> #seq.
							#parm -> (String withAll: xs) storeString.
							self pvtNewRange:  charIdx type: #character}]! !

!OMeta2ExtendedRuleParser methodsFor: 'private' stamp: 'pb 5/2/2020 05:20:41'!
expr =
	// Wrap the sub-expressions with an 'or'.  If it's not needed, we'll optimize it away later.
	// FIXME - how to best highlight OR...
	listOf(#expr4, '|'):xs -> [(self pvtNewNode: #Or) addChildren: xs]! !

!OMeta2ExtendedRuleParser methodsFor: 'private' stamp: 'pb 5/2/2020 14:19:01'!
expr1 =
	// Handle any syntactic sugar (brackets etc) and the rest of the expression
	@<(keyword('true') | keyword('false') | keyword('nil')):lit>:litIdx
						-> [(self pvtNewNode: #App) properties: {#op -> #exactly. #parm -> lit. self pvtNewRange: litIdx type: #nil}]
|	application
|	semanticAction
|	semanticPredicate
|	characters
|	tokenSugar
|	stringLiteral
|	symbolLiteral
|	numberLiteral
|	characterLiteral
|	@<"{">:blkStart [self pvtBlockEnter]  expr:e @<"}">:blkEnd
					-> [(self pvtNewNode: #Form) properties: {#op -> e.
											self pvtNewRange: blkStart and: blkEnd type: self pvtBlockLevelAndLeave}]
|	@<"<">:blkStart [self pvtBlockEnter]  expr:e @<">">:blkEnd
				 	-> [(self pvtNewNode: #ConsBy) properties: {#op -> e.
											self pvtNewRange: blkStart and: blkEnd type: self pvtBlockLevelAndLeave}]
|	@<"@<">:blkStart [self pvtBlockEnter] expr:e @<">">:blkEnd
				 	-> [(self pvtNewNode: #IdxConsBy) properties: {#op -> e.
											self pvtNewRange: blkStart and: blkEnd type: self pvtBlockLevelAndLeave}]
|	@<"(">:blkStart expr:e @<")">:blkEnd -> [e] // FIXME - syntax highlighting! !

!OMeta2ExtendedRuleParser methodsFor: 'private' stamp: 'pb 5/2/2020 05:21:06'!
expr2 =
	// Handle lookahead
	@<"~">:xIdx expr2:x -> [(self pvtNewNode: #Not) properties: {#op -> x. self pvtNewRange: xIdx type: #blockArg}] 
|	@<"&">:xIdx expr2:x -> [(self pvtNewNode: #Lookahead) properties: {#op -> x. self pvtNewRange: xIdx type: #blockArg}] 
|	expr1! !

!OMeta2ExtendedRuleParser methodsFor: 'private' stamp: 'pb 5/2/2020 05:21:19'!
expr3 =
	// Handle arity and variable assignment
	expr2:x optIter(x):x
		(	$: @<nsName:n>:tmpIdx [temps add: n] -> [(self pvtNewNode: #Set) properties: {#op -> n. #parm -> x. self pvtNewRange: tmpIdx type: #tempVar}]
		|	empty						-> [x]
		)
|	":" nsName:n [temps add: n] -> [(self pvtNewNode: #Set) properties: {#op -> n};
										addChild: ((self pvtNewNode: #App) properties: {#op -> #anything})]! !

!OMeta2ExtendedRuleParser methodsFor: 'private' stamp: 'pb 5/2/2020 05:21:22'!
expr4 =
	// Wrap related rule sub-expressions with an 'and'.  If it's not needed, we'll optimize it away later
	expr3*:xs -> [(self pvtNewNode: #And) addChildren: xs]! !

!OMeta2ExtendedRuleParser methodsFor: 'private' stamp: 'pb 5/2/2020 05:21:30'!
initialize
	super initialize.
	ast := self pvtNewNode: #rule.
	blockLevel := 0.
	curNode := ast.
	curNode properties at: #comments put: OrderedCollection new.
	temps := IdentitySet new.! !

!OMeta2ExtendedRuleParser methodsFor: 'private' stamp: 'pb 5/1/2020 19:12:57'!
keyword :xs =
	token(xs) ~letterOrDigit -> [xs]! !

!OMeta2ExtendedRuleParser methodsFor: 'private' stamp: 'pb 5/1/2020 19:12:57'!
nameFirst =
	letter! !

!OMeta2ExtendedRuleParser methodsFor: 'private' stamp: 'pb 5/1/2020 19:12:57'!
nameRest =
	nameFirst | digit! !

!OMeta2ExtendedRuleParser methodsFor: 'private' stamp: 'pb 5/2/2020 01:25:04'!
nsName =
	firstAndRest(#nameFirst, #nameRest):xs -> [(String withAll: xs) asSymbol]
|	$_ -> [#anything]
! !

!OMeta2ExtendedRuleParser methodsFor: 'private' stamp: 'pb 5/2/2020 05:21:34'!
numberLiteral =
	@<spaces ($- spaces -> [-1] | empty -> [1]):sign digit+:ds>:numIdx
		-> [(self pvtNewNode: #App) properties: {#op -> #exactly.
				#parm -> (sign * (String withAll: ds) asNumber) storeString.
				self pvtNewRange: numIdx type: #number}]! !

!OMeta2ExtendedRuleParser methodsFor: 'private' stamp: 'pb 5/2/2020 05:21:38'!
ometaRule =
	&(^space* nsName):n rulePart(n):x ("," rulePart(n))*:xs spaces end
		-> [ curNode := (curNode node: #Rule) properties: {#temps -> temps asSortedCollection.
					#n -> n};
					addChild: ((self pvtNewNode: #Or) addChild: x; addChildren: xs)]! !

!OMeta2ExtendedRuleParser methodsFor: 'private' stamp: 'pb 5/2/2020 05:21:51'!
optIter :x =
	@<"*">:arManyIdx		-> [(self pvtNewNode: #Many) properties: {#parm -> x.
																	self pvtNewRange: arManyIdx type: #blockArg}]
|	@<"+">:arMany1Idx		-> [(self pvtNewNode: #Many1) properties: {#parm -> x.
																	self pvtNewRange: arMany1Idx type: #blockArg}]
|	@<"?">:arOptIdx ~$[	-> [(self pvtNewNode: #Opt) properties: {#parm -> x.
																	self pvtNewRange: arOptIdx type: #blockArg}]
|	empty	-> [x]! !

!OMeta2ExtendedRuleParser methodsFor: 'private' stamp: 'pb 5/1/2020 19:17:20'!
pvtBlockEnter
	blockLevel := blockLevel+1.! !

!OMeta2ExtendedRuleParser methodsFor: 'private' stamp: 'pb 5/1/2020 19:16:29'!
pvtBlockLevelAndLeave
	| retVal |
	retVal := blockLevel caseOf: {
		[ 1 ] -> [ #blockStart1 ].
		[ 2 ] -> [ #blockStart2 ].
		[ 3 ] -> [ #blockStart3 ]}
		 otherwise: [ "Only go up to 4"
		#blockStart4 ].
	blockLevel := blockLevel - 1.
	^ retVal.! !

!OMeta2ExtendedRuleParser methodsFor: 'private' stamp: 'pb 5/2/2020 05:20:02'!
pvtNewNode: nodeType
	^ SyntaxTreeNode node: nodeType.! !

!OMeta2ExtendedRuleParser methodsFor: 'private' stamp: 'pb 5/2/2020 14:20:27'!
pvtNewRange: rangeAssoc1 and: rangeAssoc2 type: type
	"Create assoc to be use as a range property.  This currently covers every use case except comments in the space rule."
	| passoc |
	passoc := self
		pvtNewRange: rangeAssoc1
		type: type.
	passoc value
		add:
			(self
				pvtNewSHRangeType: type
				rangeAssoc: rangeAssoc2);
		yourself.
	^ passoc.! !

!OMeta2ExtendedRuleParser methodsFor: 'private' stamp: 'pb 5/2/2020 14:20:44'!
pvtNewRange: rangeAssoc type: type
	"Create assoc to be use as a range property.  This currently covers every use case except comments in the space rule"
	^ #rangeIdxList ->
		(OrderedCollection new
			add:
				(self
					pvtNewSHRangeType: type
					rangeAssoc: rangeAssoc);
			yourself).! !

!OMeta2ExtendedRuleParser methodsFor: 'private' stamp: 'pb 5/2/2020 14:20:53'!
pvtNewRange: rangeAssoc1 type: type1 with: rangeAssoc2 type: type2
	"Create assoc to be use as a range property.  This currently covers every use case except comments in the space rule"
	^ #rangeIdxList ->
		(OrderedCollection new
			add:
				(self
					pvtNewSHRangeType: type1
					rangeAssoc: rangeAssoc1);
			add:
				(self
					pvtNewSHRangeType: type2
					rangeAssoc: rangeAssoc2);
			yourself).! !

!OMeta2ExtendedRuleParser methodsFor: 'private' stamp: 'pb 5/1/2020 19:12:57'!
pvtNewSHRangeType: useType rangeAssoc: rangeAssoc
	^ SHRange
		start: rangeAssoc key
		end: rangeAssoc value - 1
		type: useType.! !

!OMeta2ExtendedRuleParser methodsFor: 'private' stamp: 'pb 5/2/2020 14:21:11'!
rulePart :ruleName =
	[nil]:retVal
	@<name:n ?[n = ruleName] expr4:b1>:nIdx -> [|| curNode properties: {self pvtNewRange: nIdx type: #keyword}. retVal]
		(	@<"=">:nIdx2 expr:b2	-> [|| ((curNode properties at: #rangeIdxList) at: 1) end: nIdx2 value. "rangeAssoc" retVal := (self pvtNewNode: #And) addChild: b1; addChild: b2] // nIdx2 is a hack to get to the '='.  Highly non-optimal as we really want params highlighted in a different style anyway
		|	empty			-> [retVal := curNode addChild: b1]
		)! !

!OMeta2ExtendedRuleParser methodsFor: 'private' stamp: 'pb 6/16/2020 11:25:26'!
ruleProduction =

	"->"! !

!OMeta2ExtendedRuleParser methodsFor: 'private' stamp: 'pb 6/16/2020 11:25:37'!
semanticAction =
	@<ruleProduction? "[">:saIdx1 (squeakExpression:expr|squeakInnerBlock:blk) @<$]>:saIdx2
		-> [expr
				ifNil: [(self pvtNewNode: #SemBlkAct) properties: {#op -> blk. self pvtNewRange: saIdx1 and: saIdx2 type: #patternArg}]
				ifNotNil: [(self pvtNewNode: #SemAct) properties: {#op -> expr. self pvtNewRange: saIdx1 and: saIdx2 type: #patternArg}]]! !

!OMeta2ExtendedRuleParser methodsFor: 'private' stamp: 'pb 5/2/2020 05:22:06'!
semanticPredicate =
	@<"?[">:spIdx1 (squeakExpression:expr|squeakInnerBlock:blk) @<$]>:spIdx2
		-> [expr
				ifNil: [(self pvtNewNode: #SemBlkPred) properties: {#op -> blk. self pvtNewRange: spIdx1 and: spIdx2 type: #patternArg}]
				ifNotNil: [(self pvtNewNode: #SemPred) properties: {#op -> expr. self pvtNewRange: spIdx1 and: spIdx2 type: #patternArg}]]! !

!OMeta2ExtendedRuleParser methodsFor: 'private' stamp: 'pb 5/16/2020 21:36:54'!
space =
	^space
	| @<fromTo('/*', '*/')>:longCommentIdx
		-> [(curNode properties at: #comments) add: (self pvtNewSHRangeType: #comment rangeAssoc: longCommentIdx)]
	| @<fromToEndOfLine('//')>:commentIdx
		-> [(curNode properties at: #comments) add: (self pvtNewSHRangeType: #comment rangeAssoc: commentIdx)]
! !

!OMeta2ExtendedRuleParser methodsFor: 'private' stamp: 'pb 5/2/2020 19:26:27'!
squeakArgExprOrWrappedInnerBlock =

	[self pvtOMetaGetExternalSmalltalkRecognizerClass]:recog 
	recog.squeakArgExprOrWrappedInnerBlock:ans spaces -> [ans]! !

!OMeta2ExtendedRuleParser methodsFor: 'private' stamp: 'pb 5/2/2020 19:27:01'!
squeakExpression =

	@<[self pvtOMetaGetExternalSmalltalkRecognizerClass]:recog
		recog.squeakExpr:ans>:sqIdx spaces
			-> [(self pvtNewNode: #Smalltalk) properties: {#parm -> ans.
				self pvtNewRange: sqIdx type: #externalFunctionCallingConvention}]! !

!OMeta2ExtendedRuleParser methodsFor: 'private' stamp: 'pb 5/2/2020 19:28:47'!
squeakInnerBlock =

	[self pvtOMetaGetExternalSmalltalkRecognizerClass]:recog
	@<	recog.squeakInnerBlock:ans>:sqIdx spaces
			 ->  [(self pvtNewNode: #Smalltalk) properties: {#parm -> ans.
				self pvtNewRange: sqIdx type: #externalFunctionCallingConvention}]! !

!OMeta2ExtendedRuleParser methodsFor: 'private' stamp: 'pb 5/2/2020 05:22:21'!
stringLiteral =
	@<"'" ($' $' -> [$'] | ~$' char)*:xs $'>:strIdx -> [(self pvtNewNode: #App) properties: 											{#op -> #exactly.
											 #parm ->  (String withAll: xs) storeString.
											self pvtNewRange: strIdx type: #text}]! !

!OMeta2ExtendedRuleParser methodsFor: 'private' stamp: 'pb 5/2/2020 05:22:25'!
symbolLiteral =
	// TODO: make this accept, e.g., #foo:bar:
	@<"#" nsName:s>:symIdx -> [(self pvtNewNode: #App) properties: {
											#op -> #exactly.
											#parm -> s storeString.
											self pvtNewRange: symIdx type: #symbol
											}]! !

!OMeta2ExtendedRuleParser methodsFor: 'private' stamp: 'pb 5/2/2020 05:22:28'!
tokenSugar =
	@<token('"') (~$" char)*:xs $">:tokIdx -> [(self pvtNewNode: #App) properties: {
															#op -> #token.
															#parm -> (String withAll: xs) storeString.
															self pvtNewRange: tokIdx type: #stringSymbol
															}]! !

!OMeta2ExtendedRuleParser methodsFor: 'grammar' stamp: 'pb 5/1/2020 19:31:28'!
rule =
	squeakRule
	| ometaRule! !

!OMeta2ExtendedRuleParser methodsFor: 'grammar' stamp: 'pb 5/2/2020 05:22:17'!
squeakRule =
	// This isn't OMeta code so we'll handoff to Squeak when the time comes
	~(^space* nsName expr4 "=") <char*>:squeakCode -> [self pvtNewNode: #Squeak]! !

!OMeta2ExtendedRuleParser class methodsFor: 'extract' stamp: 'pb 5/2/2020 03:26:52'!
extractRangesFromSmalltalkSourceCode: source
	^ (self isSmalltalkSourceCode: source) ifFalse: [ | result |
		result := OrderedCollection new.
		(self
			matchAll: source
			with: #rule
			ifFail: []) ifNotNil: [:found| found do: [ :ea |
			self
				pvtRecurseForRanges: ea
				into: result ].
		result sort: [ :a :b |
			a start < b start ]]].! !

!OMeta2ExtendedRuleParser class methodsFor: 'testing' stamp: 'pb 5/1/2020 19:28:42'!
isSmalltalkSourceCode: aString
	^ (self
		matchAll: aString
		with: #squeakRule
		ifFail: [ false ]) = false
		ifTrue: [ false ]
		ifFalse: [ true ].! !

!OMeta2ExtendedRuleParser class methodsFor: 'private' stamp: 'pb 5/1/2020 19:12:57'!
pvtRecurseForRanges: ea into: result
	ea properties
		
			at: #rangeIdxList
			ifPresent: [ :ranges |
				result addAll: ranges ];
		
			at: #comments
			ifPresent: [ :ranges |
				result addAll: ranges ];
		
			at: #op
			ifPresent: [ :op |
				(op isKindOf: SyntaxTreeNode) ifTrue: [
					op do: [ :opNode |
						self
							pvtRecurseForRanges: opNode
							into: result ]]];
		
			at: #parm
			ifPresent: [ :parm |
				(parm isKindOf: SyntaxTreeNode) ifTrue: [
					parm do: [ :parmNode |
						self
							pvtRecurseForRanges: parmNode
							into: result ]]].
	^ result.! !

!OMeta2RuleIntrospection methodsFor: 'ometa grammar' stamp: 'pb 4/27/2020 01:56:31'!
appliesDirectOMetaRule :aRule =
	// Is aRule directly referenced? (i.e. via apply)
	(directApply exactly(aRule) anything* -> [self pvtStoreResult: aRule]
	| (~directApply anything) ({appliesDirectOMetaRule(aRule)} | anything)+
	| { appliesDirectOMetaRule(aRule) })
	[result]! !

!OMeta2RuleIntrospection methodsFor: 'ometa grammar' stamp: 'pb 5/3/2020 14:08:04'!
appliesOMetaRule :aRule =
	// Is aRule referenced? (i.e. via (super) apply)
	(anyApply exactly(aRule) anything* -> [self pvtStoreResult: aRule]
	| (~anyApply anything) ({appliesOMetaRule(aRule)} | anything)+
	| { appliesOMetaRule(aRule) })
	[result]! !

!OMeta2RuleIntrospection methodsFor: 'ometa grammar' stamp: 'pb 4/27/2020 01:44:15'!
referencedOMetaRules =
	// Return a collection of all rules referenced
	[result ifNil: [result := Set new]]
	(anyApply anything:aRule anything* -> [result add: aRule]
	| (~anyApply anything) ({referencedOMetaRules} | anything)+
	| { referencedOMetaRules })
	[result]! !

!OMeta2RuleIntrospection methodsFor: 'private' stamp: 'pb 4/26/2020 19:13:28'!
anyApply =
	anything:found ?[#(#App #SuperApp) includes: found]! !

!OMeta2RuleIntrospection methodsFor: 'private' stamp: 'pb 4/26/2020 19:53:44'!
directApply =
	anything:found ?[found=#App]! !

!OMeta2RuleIntrospection methodsFor: 'private' stamp: 'pb 4/26/2020 19:08:39'!
match :findItem =
	anything:gotItem ?[gotItem=findItem]! !

!OMeta2RuleIntrospection methodsFor: 'private' stamp: 'pb 5/3/2020 14:07:44'!
nonSuperRuleSendsTo :findRule =
	{ nonSuperRuleSendsTo(findRule) }
	| (~(pvtInnerNonSuperRuleSendsTo(findRule)) anything)* pvtInnerNonSuperRuleSendsTo(findRule)! !

!OMeta2RuleIntrospection methodsFor: 'private' stamp: 'pb 4/26/2020 18:48:52'!
pvtInnerNonSuperRuleSendsTo :findRule =
	~#SuperApp anything:matchRule ?[matchRule=findRule] -> [findRule]! !

!OMeta2RuleIntrospection methodsFor: 'private' stamp: 'pb 4/26/2020 19:50:14'!
pvtStoreResult: useResult
	^ result := useResult.! !

!SyntaxTreeNode methodsFor: 'accessing' stamp: 'pb 6/13/2015 19:10'!
at: key
	^ properties at: key.! !

!SyntaxTreeNode methodsFor: 'accessing' stamp: 'pb 6/13/2015 19:09'!
at: key put: value
	^ properties
		at: key
		put: value.! !

!SyntaxTreeNode methodsFor: 'accessing' stamp: 'pb 6/13/2015 18:32'!
node
	^ node! !

!SyntaxTreeNode methodsFor: 'accessing' stamp: 'pb 6/12/2015 21:18'!
node: aNode
	node := aNode! !

!SyntaxTreeNode methodsFor: 'accessing' stamp: 'pb 6/13/2015 19:09'!
properties: propColl
	propColl do: [ :prop |
		self
			at: prop key
			put: prop value ].! !

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

!SyntaxTreeNode methodsFor: 'enumerating' stamp: 'pb 6/14/2015 02:54'!
childrenDo: aBlock
	"Call aBlock for each direct child"
	children do: aBlock.! !

!SyntaxTreeNode methodsFor: 'enumerating' stamp: 'pb 6/8/2019 18:21:51'!
collect: aBlock
	"Recurse the tree depth-first collecting the result of calling aBlock for each element"
	^ self
		depthFirstCollect: aBlock
		with: self.! !

!SyntaxTreeNode methodsFor: 'enumerating' stamp: 'pb 6/8/2019 18:22:33'!
do: aBlock
	"Recurse the tree depth-first calling aBlock for each element"
	^ self
		depthFirstDo: aBlock
		with: self.! !

!SyntaxTreeNode methodsFor: 'initialization' stamp: 'pb 6/13/2015 01:52'!
initialize
	super initialize.
	properties := Dictionary new.
	children := OrderedCollection new.! !

!SyntaxTreeNode methodsFor: 'private' stamp: 'pb 6/14/2015 01:51'!
children
	^ children! !

!SyntaxTreeNode methodsFor: 'private' stamp: 'pb 6/8/2019 18:21:51'!
depthFirstCollect: aBlock with: aNode
	"Recurse the tree depth-first collecting the result of calling aBlock for each element"
	| results |
	results := OrderedCollection new.
	results add: (aBlock value: aNode).
	aNode childrenDo: [ :cnode |
		results addAll:
			(self
				depthFirstCollect: aBlock
				with: cnode) ].
	^ results.! !

!SyntaxTreeNode methodsFor: 'private' stamp: 'pb 6/8/2019 18:22:33'!
depthFirstDo: aBlock with: aNode
	"Recurse the tree depth-first calling aBlock for each element"
	aBlock value: aNode.
	aNode childrenDo: [ :cnode |
		self
			depthFirstDo: aBlock
			with: cnode ].! !

!SyntaxTreeNode methodsFor: 'private' stamp: 'pb 6/16/2015 17:23'!
properties
	^ properties! !

!SyntaxTreeNode class methodsFor: 'instance creation' stamp: 'pb 6/13/2015 02:14'!
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
