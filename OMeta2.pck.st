'From Cuis 5.0 [latest update: #4219] on QDate(2020-06-16) at 11:00:22 am'!
'Description OMeta2 (often referred to just as ''OMeta'') is a PEG-based (Parsing Expression Grammar) Object Oriented pattern matching language.   More simply put, it''s a parser which you can use to write other parsers.  A few of its unique characteristics:

1) It is a parasitic language which is a hybrid of its own OMeta syntax and the host language, in this case Smalltalk.
2) It is written in itself.  There is a preload file (see below) which provides a minimal Smalltalk implementation of OMeta, and then this package is overlaid on it effectively reimplementing OMeta in OMeta.
3) As you can see from 2, it is a dynamic parser which is very compatible with the Smalltalk ethos.  In many cases, you can modify the definition of an existing parser while it is running.
4) While it was originally written to help prototype new programming languages, it can just as easily parse just about anything you can think of from data files to network packets.

Note: OMeta2Preload.st needs to be filed in before loading this package (handled by OMeta2Package class>>prePackageInstall)

This package is based on the original work by Alessandro Warth http://www.tinlizzie.org/ometa/OMeta.sar with updates from OMeta2-Preload-hmm.14.mcz OMeta2-Postload-hmm.12.mcz and modified and extended by Phil Bellalouna for Cuis.

Since the original implementation of OMeta2 has been abandoned by its author, I''ve decided to not retain absolute compatiblity with it.  Mostly this means that I''ve made a few minor extensions to the core language that are (mostly) backwards compatible and fixed some bugs.'!
!provides: 'OMeta2' 2 16!
SystemOrganization addCategory: #OMeta2!


!classDefinition: #OMeta2Package category: #OMeta2!
CodePackage subclass: #OMeta2Package
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2'!
!classDefinition: 'OMeta2Package class' category: #OMeta2!
OMeta2Package class
	instanceVariableNames: ''!


!OMeta2Package commentStamp: '<historical>' prior: 0!
My #prePackageInstall method ensures that OMeta2Preload (a non-package prerequisite) is loaded before this package loads.!

!OMeta2Package class methodsFor: 'installing' stamp: 'pb 4/22/2020 03:50:43'!
prePackageInstall
	(Smalltalk classNamed: 'OMeta2Base') ifNil: [
		"If warnings are enabled they will currently likely overwhelm the transcript"
		Preferences
			setPreference: #warnAboutNonLocalReturnsInExceptionHandlers
			toValue: false.
		Transcript
			show: 'Loading OMeta2Preload.st';
			finishEntry.
		ChangeSet fileIn: (self package fullFileName asFileEntry parent concatPathComponentsAsFile: 'OMeta2Preload.st' asPathComponents).
		Transcript
			show: 'Finished loading OMeta2Preload.st';
			finishEntry ].! !

!OMeta2Package class methodsFor: 'private-meta-development' stamp: 'pb 4/27/2019 23:48:34'!
isAbstract
	^ thisContext methodClass == self class.! !
OMeta2Package prePackageInstall!
!classDefinition: #OMeta2 category: #OMeta2!
OMeta2Base subclass: #OMeta2
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2'!
!classDefinition: 'OMeta2 class' category: #OMeta2!
OMeta2 class
	instanceVariableNames: ''!

!classDefinition: #OMeta2Flattener category: #OMeta2!
OMeta2 subclass: #OMeta2Flattener
	instanceVariableNames: 'ws'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2'!
!classDefinition: 'OMeta2Flattener class' category: #OMeta2!
OMeta2Flattener class
	instanceVariableNames: ''!

!classDefinition: #OMeta2NullOptimizer category: #OMeta2!
OMeta2 subclass: #OMeta2NullOptimizer
	instanceVariableNames: 'didSomething'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2'!
!classDefinition: 'OMeta2NullOptimizer class' category: #OMeta2!
OMeta2NullOptimizer class
	instanceVariableNames: ''!

!classDefinition: #OMeta2AndOrOptimizer category: #OMeta2!
OMeta2NullOptimizer subclass: #OMeta2AndOrOptimizer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2'!
!classDefinition: 'OMeta2AndOrOptimizer class' category: #OMeta2!
OMeta2AndOrOptimizer class
	instanceVariableNames: ''!

!classDefinition: #OMeta2FinalizeOptimizer category: #OMeta2!
OMeta2NullOptimizer subclass: #OMeta2FinalizeOptimizer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2'!
!classDefinition: 'OMeta2FinalizeOptimizer class' category: #OMeta2!
OMeta2FinalizeOptimizer class
	instanceVariableNames: ''!

!classDefinition: #OMeta2Optimizer category: #OMeta2!
OMeta2 subclass: #OMeta2Optimizer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2'!
!classDefinition: 'OMeta2Optimizer class' category: #OMeta2!
OMeta2Optimizer class
	instanceVariableNames: ''!

!classDefinition: #OMeta2RuleParser category: #OMeta2!
OMeta2 subclass: #OMeta2RuleParser
	instanceVariableNames: 'temps'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2'!
!classDefinition: 'OMeta2RuleParser class' category: #OMeta2!
OMeta2RuleParser class
	instanceVariableNames: ''!

!classDefinition: #OMeta2RuleTranslator category: #OMeta2!
OMeta2 subclass: #OMeta2RuleTranslator
	instanceVariableNames: 'grammarClass'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2'!
!classDefinition: 'OMeta2RuleTranslator class' category: #OMeta2!
OMeta2RuleTranslator class
	instanceVariableNames: ''!

!classDefinition: #OMeta2SqueakSmalltalkRecognizer category: #OMeta2!
OMeta2 subclass: #OMeta2SqueakSmalltalkRecognizer
	instanceVariableNames: 'useArgTypeTable'
	classVariableNames: 'ArgTypeTable TypeTable'
	poolDictionaries: ''
	category: 'OMeta2'!
!classDefinition: 'OMeta2SqueakSmalltalkRecognizer class' category: #OMeta2!
OMeta2SqueakSmalltalkRecognizer class
	instanceVariableNames: ''!

!classDefinition: #OMeta2CuisSmalltalkRecognizer category: #OMeta2!
OMeta2SqueakSmalltalkRecognizer subclass: #OMeta2CuisSmalltalkRecognizer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2'!
!classDefinition: 'OMeta2CuisSmalltalkRecognizer class' category: #OMeta2!
OMeta2CuisSmalltalkRecognizer class
	instanceVariableNames: ''!


!OMeta2 commentStamp: '<historical>' prior: 0!
OMeta Implementation

Parser Notes:
========

If your input consists of strings you want to parse (source code, text files, etc.), you most likely want to call the class-side 'MatchAll' methods (i.e. #matchAll:with:).  If your input consists of structured data (nested arrays etc) to parse, you probably want to call the class-side 'Match' methods (i.e. #match:with:).

For more unconventional parsing needs, you will likely need to override some OMeta2Base methods in your parser subclass.  It is highly suggested that you do not change OMeta2Base directly as any bugs or changes in behavior will likely break OMeta2 itself.  Therefore, overriding in your subclass is the recommended approach.

Todos:
====

* implement OMeta -> Squeak translator
* implement Squeak parser
* implement OMeta/Squeak "compiler", make it OMeta2's compilerClass

* rewrite #empty and #firstAndRest in OMeta syntax
* consider implementing position-related functionality (see http://www.tinlizzie.org/ometa-js/ometa-base.js)
* consider the optimization suggestions in the comments of OMeta2Lib's methods!

!OMeta2Flattener commentStamp: '<historical>' prior: 0!
OMeta2Flattener is phase 4 of OMeta code compilation.  I take the rendered code tree produced by phase 3 and flatten it into a single string of source code that will be passed to the Smalltalk compiler or parser.

OMeta implementation!

!OMeta2NullOptimizer commentStamp: '<historical>' prior: 0!
I am an identity transform used to build OMeta AST optimizers.  Typically each subclass represents an optimization pass performing a specific type of optimization returning the transformed AST.  Optimizers, such as OMeta2AndOrOptimizer, are called during phase 2.

OMeta implementation!

!OMeta2AndOrOptimizer commentStamp: '<historical>' prior: 0!
Syntax tree grammar used by OMeta2Optimizer in stage 2 of compilation.

OMeta implementation!

!OMeta2FinalizeOptimizer commentStamp: '<historical>' prior: 0!
Wrap #And nodes with a #TrueIfTrue node when necessary

OMeta implementation!

!OMeta2Optimizer commentStamp: '<historical>' prior: 0!
OMeta2Optimizer is phase 2 of OMeta code compilation.  I take the parse tree from phase 1 and apply a syntax tree grammar (OMeta2AndOrOptimizer) which provides transformations to produce a simplified syntax tree.

OMeta implementation!

!OMeta2RuleParser commentStamp: '<historical>' prior: 0!
OMeta2RuleParser is phase 1 of OMeta code compilation.  I take arbitrary source code and produce an syntax tree of raw operations in a Lispy nested list containing elements in the form #(arg1. arg2...) where:

arg1 is the OMeta primitive to perform (#SemAct, #And, #App, #ConsBy, #Form, #IdxConsBy, #Opt, #Or, #Lookahead, #Many, #Many1, #Not, #SemPred, #Rule, #Set, #SuperApp) each corresponding to an OMeta primitive operation:
- #And and #Or correspond to Smalltalk #and: and #or:
- #SemAct and #Rule indicate a method call defined in arg2
- #Set indicates a collection (implemented as an array)
- #App, #ConsBy, #Form, #IdxConsBy, #Opt, #Lookahead, #Many, #Many1, #Not, #SemPred and #SuperApp have corresponding methods in OMeta2Base

arg2 is either an operand for the atomic operation (an OMeta or application rule name or semantic predicate/action code snippet) or a list of child operations in the case of #And and #Or operations.

arg3, if it exists, is either an operand for the atomic operation (often an operand for the rule supplied in arg2 such as a string literal) or a list of child operations.

And so on... arg4 and greater occur in more complex #And and #Or lists or for rules/method calls requiring additional parameters passed.

The syntax tree produced represents the worst case application logic as no optmization is performed yet.  Stages 2 and 3 require this simple form to perform their transformations. (i.e. any changes/extensions here will have significant implications downstream)

OMeta implementation!

!OMeta2RuleTranslator commentStamp: '<historical>' prior: 0!
OMeta2RuleTranslator is phase 3 of OMeta code compilation.  I take the parse tree from phase 1 or 2 and translate it to a list-based tree containing rendered Smalltalk code snippets.

OMeta implementation!

!OMeta2SqueakSmalltalkRecognizer commentStamp: '<historical>' prior: 0!
I am a null Smalltalk parser for the Squeak dialect.  While I don't actually *do* anything with parsed Smalltalk code, I am useful as a minimal test to determine if any given text is valid Smalltalk code.  I also serve as an example of parsing a programming language with OMeta.

OMeta implementation!

!OMeta2CuisSmalltalkRecognizer commentStamp: '<historical>' prior: 0!
Extensions specific to Cuis!

!OMeta2 class methodsFor: 'methods' stamp: 'pb 5/22/2020 03:09:24'!
methodNodeFor: sourceCode noPattern: aBoolean
	(self ometa2RuleParserClass isOMeta2Rule: sourceCode) ifTrue: [ ^ nil ].
	^ super
		methodNodeFor: sourceCode
		noPattern: aBoolean.! !

!OMeta2RuleParser methodsFor: 'private' stamp: 'pb 5/22/2015 19:02'!
name =

	spaces nsName! !

!OMeta2SqueakSmalltalkRecognizer methodsFor: 'private' stamp: 'pb 5/2/2020 19:42:37'!
comment =

	$" <(~$" anything)*> $" $.?! !

!OMeta2 methodsFor: 'ometa grammar' stamp: 'pb 5/2/2020 14:26:03'!
empty
	^ true.! !

!OMeta2 methodsFor: 'ometa grammar' stamp: 'pb 5/16/2020 22:07:13'!
end =

	// Are we at the end of the input stream?
	~anything! !

!OMeta2 methodsFor: 'ometa grammar' stamp: 'pb 5/22/2015 18:25'!
exactly :wanted =

	anything:got ?[wanted = got] -> [wanted]! !

!OMeta2 methodsFor: 'ometa grammar' stamp: 'pb 5/2/2020 14:26:16'!
firstAndRest
	"A meta rule for 'first rest+' where the rule names are substituted with the values of first and rest.  See listOf for another example of a meta rule.  FIXME - rewrite in OMeta"
	| first rest |
	first := self privateOMetaApply: #anything.
	rest := self privateOMetaApply: #anything.
	^ self pvtOMetaGenericMany: [self privateOMetaApply: rest] into: (OrderedCollection with: (self privateOMetaApply: first))! !

!OMeta2 methodsFor: 'ometa grammar' stamp: 'pb 5/16/2020 22:07:23'!
fromTo :x :y =

	// Match the sequence from x to y.  Example to match a comment: fromTo("/*", "*/"):commentText
	seq(x) (~seq(y) anything)*:enclosed seq(y) -> [enclosed]! !

!OMeta2 methodsFor: 'ometa grammar' stamp: 'pb 5/16/2020 22:07:27'!
fromToOrEnd :x :y =

	// Match the sequence from x to y.  Example to match a comment: fromTo("/*", "*/"):commentText
	seq(x) (~seq(y) anything)*:enclosed (seq(y) | end) -> [enclosed]! !

!OMeta2 methodsFor: 'ometa grammar' stamp: 'pb 5/16/2020 22:07:32'!
listOf :rule :delim =

	// Match :rule one or more times delimited by :delim returning the results as a collection
		applyRule(rule):x (token(delim) applyRule(rule))*:xs -> [xs addFirst: x; yourself]
	|	empty -> [#()]! !

!OMeta2 methodsFor: 'ometa grammar' stamp: 'pb 5/5/2020 07:33:00'!
notLast :rule =

	applyRule(rule):ans &applyRule(rule) -> [ans]! !

!OMeta2 methodsFor: 'ometa grammar' stamp: 'pb 5/22/2015 18:31'!
number =

	anything:x ?[x isNumber] -> [x]! !

!OMeta2 methodsFor: 'ometa grammar' stamp: 'pb 5/16/2020 22:07:40'!
range :a :b =

	// Is the next object within the range of a .. b?  Example usage: checking if an input character falls within the given range.
	anything:x ?[a <= x & (x <= b)] -> [x]! !

!OMeta2 methodsFor: 'ometa grammar' stamp: 'pb 5/22/2015 18:34'!
string =

	anything:x ?[x isString] -> [x]! !

!OMeta2 methodsFor: 'ometa grammar' stamp: 'pb 5/22/2015 18:34'!
symbol =

	anything:x ?[x isSymbol] -> [x]! !

!OMeta2 methodsFor: 'ometa grammar - character' stamp: 'pb 5/16/2020 22:00:46'!
char =

	anything:x ?[x class == Character] -> [x]! !

!OMeta2 methodsFor: 'ometa grammar - character' stamp: 'pb 5/16/2020 22:04:53'!
digit =

// Inlined for performance
//	char:x ?[x isDigit] -> [x]
	anything:x ?[x class == Character and: [x isDigit]] -> [x]! !

!OMeta2 methodsFor: 'ometa grammar - character' stamp: 'pb 5/16/2020 22:04:48'!
letter =

// Inlined for performance
//	char:x ?[x isLetter] -> [x]
	anything:x ?[x class == Character and: [x isLetter]] -> [x]! !

!OMeta2 methodsFor: 'ometa grammar - character' stamp: 'pb 5/16/2020 22:04:43'!
letterOrDigit =

// Inlined for performance
//	char:x ?[x isAlphaNumeric] -> [x]
	anything:x ?[x class == Character and: [x isAlphaNumeric]] -> [x]! !

!OMeta2 methodsFor: 'ometa grammar - character' stamp: 'pb 5/16/2020 22:11:31'!
lower =

// Inlined for performance
//	char:x ?[x isLowercase] -> [x]
	anything:x ?[x class == Character and: [x isLowercase]] -> [x]! !

!OMeta2 methodsFor: 'ometa grammar - character' stamp: 'pb 5/16/2020 22:03:45'!
space =

// Inlined for performance
//	char:x ?[x numericValue <= 32] -> [x]
	anything:x ?[x class == Character and: [x numericValue <= 32]] -> [x]! !

!OMeta2 methodsFor: 'ometa grammar - character' stamp: 'pb 5/22/2015 18:33'!
spaces =

	space*! !

!OMeta2 methodsFor: 'ometa grammar - character' stamp: 'pb 5/16/2020 22:04:11'!
upper =

// Inlined for performance
//	char:x ?[x isUppercase] -> [x]
	anything:x ?[x class == Character and: [x isUppercase]] -> [x]! !

!OMeta2 methodsFor: 'ometa grammar - text' stamp: 'pb 5/16/2020 22:07:54'!
fromToEndOfLine :from =

	/* Match the sequence :from to either the end of line or the input stream.  Example to match a comment: fromToEndOfLine("//"):commentText
	FIXME - if 2nd param could be made optional and default to lf, this rule would be usable by any type of object */
	fromToOrEnd(from, `Character newLineCharacter asString`)! !

!OMeta2 methodsFor: 'ometa grammar - text' stamp: 'pb 5/22/2015 18:34'!
token :t =

	spaces seq(t)! !

!OMeta2 methodsFor: 'private' stamp: 'pb 4/22/2020 03:39:18'!
pvtParseLog: aString
	Transcript
		show: aString;
		finishEntry.! !

!OMeta2 class methodsFor: 'matching' stamp: 'pb 4/22/2020 03:52:13'!
matchAll: aSequenceableCollection with: aRule ifFail: failBlock
	^ [
	self
		matchAll: aSequenceableCollection
		with: aRule ]
		on: OM2Fail
		do: [ :ex |
			ex return: failBlock value ].! !

!OMeta2Flattener methodsFor: 'grammar root' stamp: 'pb 5/22/2015 18:40'!
flatten :tree =

	iFlatten(tree) -> [ws contents]! !

!OMeta2Flattener methodsFor: 'private' stamp: 'pb 5/22/2015 18:41'!
iFlatten =

	string:s 	[ws nextPutAll: s]
|	{iFlatten*}! !

!OMeta2Flattener methodsFor: 'initialization' stamp: 'aw 2/18/2009 15:05'!
initialize

	super initialize.
	ws := (String new: 64) writeStream! !

!OMeta2NullOptimizer methodsFor: 'private' stamp: 'aw 5/20/2009 12:44'!
and = trans*:xs -> [xs addFirst: #And; yourself]! !

!OMeta2NullOptimizer methodsFor: 'private' stamp: 'aw 5/20/2009 12:44'!
consby = trans:x -> [{#ConsBy. x}]! !

!OMeta2NullOptimizer methodsFor: 'private' stamp: 'aw 5/20/2009 12:44'!
form = trans:x -> [{#Form. x}]! !

!OMeta2NullOptimizer methodsFor: 'private' stamp: 'aw 5/20/2009 12:01'!
helped = ?[didSomething]! !

!OMeta2NullOptimizer methodsFor: 'private' stamp: 'aw 5/20/2009 12:44'!
idxconsby = trans:x -> [{#IdxConsBy. x}]! !

!OMeta2NullOptimizer methodsFor: 'private' stamp: 'aw 5/20/2009 12:44'!
lookahead = trans:x -> [{#Lookahead. x}]! !

!OMeta2NullOptimizer methodsFor: 'private' stamp: 'aw 5/20/2009 12:44'!
many = trans:x -> [{#Many. x}]! !

!OMeta2NullOptimizer methodsFor: 'private' stamp: 'aw 5/20/2009 12:44'!
many1 = trans:x -> [{#Many1. x}]! !

!OMeta2NullOptimizer methodsFor: 'private' stamp: 'aw 5/20/2009 12:45'!
not = trans:x -> [{#Not. x}]! !

!OMeta2NullOptimizer methodsFor: 'private' stamp: 'aw 5/20/2009 12:45'!
opt = trans:x -> [{#Opt. x}]! !

!OMeta2NullOptimizer methodsFor: 'private' stamp: 'aw 5/20/2009 12:45'!
or = trans*:xs -> [xs addFirst: #Or; yourself]! !

!OMeta2NullOptimizer methodsFor: 'private' stamp: 'aw 5/20/2009 12:45'!
rule = _:name _:temps trans:body -> [{#Rule. name. temps. body}]! !

!OMeta2NullOptimizer methodsFor: 'private' stamp: 'aw 5/20/2009 12:45'!
set = _:name trans:val -> [{#Set. name. val}]! !

!OMeta2NullOptimizer methodsFor: 'private' stamp: 'aw 5/20/2009 12:00'!
setHelped = [didSomething := true]! !

!OMeta2NullOptimizer methodsFor: 'private' stamp: 'pb 5/5/2020 07:32:54'!
trans =

	{:t [t asLowercase asSymbol]:t ?[self class canUnderstand: t] applyRule(t):ans} -> [ans]
|	_! !

!OMeta2NullOptimizer methodsFor: 'private' stamp: 'pb 4/27/2020 20:59:38'!
trueiftrue =
	trans:x -> [{#TrueIfTrue. x}]! !

!OMeta2NullOptimizer methodsFor: 'initialization' stamp: 'aw 5/20/2009 12:30'!
initialize

	super initialize.
	didSomething := false! !

!OMeta2NullOptimizer methodsFor: 'grammar root' stamp: 'aw 5/20/2009 12:02'!
optimize = trans:x helped -> [x]! !

!OMeta2AndOrOptimizer methodsFor: 'private' stamp: 'aw 5/20/2009 12:46'!
and =

	trans:x end setHelped -> [x]
|	transInside(#And):xs -> [xs addFirst: #And; yourself]! !

!OMeta2AndOrOptimizer methodsFor: 'private' stamp: 'aw 5/20/2009 12:46'!
or =

	trans:x end setHelped -> [x]
|	transInside(#Or):xs -> [xs addFirst: #Or; yourself]! !

!OMeta2AndOrOptimizer methodsFor: 'private' stamp: 'aw 5/20/2009 12:36'!
transInside :t =

	{exactly(t) transInside(t):xs} transInside(t):ys setHelped -> [xs, ys]
|	trans:x transInside(t):xs -> [xs addFirst: x; yourself]
|	empty -> [OrderedCollection new]! !

!OMeta2FinalizeOptimizer methodsFor: 'private' stamp: 'pb 4/30/2020 23:08:55'!
rule =
	_:name _:temps trans:body
		-> [OrderedCollection new
			add: #Rule;
			add: name;
			add: temps;
			add: ((#(#Or #TrueIfTrue) includes: body first)
				ifTrue: [body]
				ifFalse: [self setHelped. {#TrueIfTrue. body}]);
			yourself]! !

!OMeta2FinalizeOptimizer methodsFor: 'private' stamp: 'pb 4/28/2020 01:12:29'!
set =
	_:name trans:val
		-> [{#Set.
				name.
				val first = #And
					ifTrue: [
						self setHelped.
						{#TrueIfTrue. val}]
					ifFalse: [val]}]! !

!OMeta2Optimizer methodsFor: 'grammar root' stamp: 'pb 4/27/2020 20:42:56'!
finalOptimizeRule = _:ans (OMeta2FinalizeOptimizer.optimize(ans):ans)* -> [ans]! !

!OMeta2Optimizer methodsFor: 'grammar root' stamp: 'pb 6/7/2015 17:47'!
optimizeRule = _:ans (OMeta2AndOrOptimizer.optimize(ans):ans)* -> [ans]! !

!OMeta2Optimizer class methodsFor: 'optimize' stamp: 'pb 4/27/2020 22:31:33'!
optimizeOMetaAst: ast
	^ self
		match:
			(self
				match: ast
				with: #optimizeRule)
		with: #finalOptimizeRule.! !

!OMeta2RuleParser methodsFor: 'private' stamp: 'pb 4/25/2020 01:00'!
application =

	"^" name:rule args:as				-> [{#SuperApp. rule}, as]
|	name:grm $. nsName:rule args:as	-> [{#App. #pvtOMetaForeignParser. grm. ('#', rule) asSymbol}, as]
|	name:rule args:as						-> [{#App. rule}, as]! !

!OMeta2RuleParser methodsFor: 'private' stamp: 'pb 5/2/2020 01:29:30'!
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

!OMeta2RuleParser methodsFor: 'private' stamp: 'pb 5/22/2015 19:00'!
characterLiteral =

	spaces $$ char:c -> [{#App. #exactly. c storeString}]! !

!OMeta2RuleParser methodsFor: 'private' stamp: 'pb 5/22/2015 19:01'!
characters =

	"``" (~($' $') char)*:xs $' $' -> [{#App. #seq. (String withAll: xs) storeString}]! !

!OMeta2RuleParser methodsFor: 'private' stamp: 'pb 5/2/2020 00:12:28'!
expr =
	// Wrap the sub-expressions with an 'or'.  If it's not needed, we'll optimize it away later.
	listOf(#expr4, '|'):xs -> [(OrderedCollection with: #Or) addAll: xs; yourself]! !

!OMeta2RuleParser methodsFor: 'private' stamp: 'pb 5/2/2020 14:34:33'!
expr1 =
	// Handle any syntactic sugar (brackets etc) and the rest of the expression
	(keyword('true') | keyword('false') | keyword('nil')):lit -> [{#App. #exactly. lit}]
|	application
|	semanticAction
|	semanticPredicate
|	characters
|	tokenSugar
|	stringLiteral
|	symbolLiteral
|	numberLiteral
|	characterLiteral
|	"{"  expr:e "}" -> [{#Form. e}]
|	"<"  expr:e ">" -> [{#ConsBy. e}]
|	"@<" expr:e ">" -> [{#IdxConsBy. e}]
|	"("  expr:e ")" -> [e]! !

!OMeta2RuleParser methodsFor: 'private' stamp: 'pb 6/11/2015 18:49'!
expr2 =
	// Handle lookahead
	"~" expr2:x -> [{#Not. x}]
|	"&" expr2:x -> [{#Lookahead. x}]
|	expr1! !

!OMeta2RuleParser methodsFor: 'private' stamp: 'pb 6/11/2015 18:49'!
expr3 =
	// Handle arity and variable assignment
	expr2:x optIter(x):x
		(	$: nsName:n [temps add: n]	-> [{#Set. n. x}]
		|	empty								-> [x]
		)
|	":" nsName:n [temps add: n]			-> [{#Set. n. {#App. #anything}}]! !

!OMeta2RuleParser methodsFor: 'private' stamp: 'pb 6/11/2015 18:57'!
expr4 =
	// Wrap related rule sub-expressions with an 'and'.  If it's not needed, we'll optimize it away later
	expr3*:xs -> [(OrderedCollection with: #And) addAll: xs; yourself]! !

!OMeta2RuleParser methodsFor: 'private' stamp: 'pb 5/22/2015 19:02'!
keyword :xs =

	token(xs) ~letterOrDigit -> [xs]! !

!OMeta2RuleParser methodsFor: 'private' stamp: 'pb 5/22/2015 19:03'!
nameFirst =

	letter! !

!OMeta2RuleParser methodsFor: 'private' stamp: 'pb 5/22/2015 19:03'!
nameRest =

	nameFirst | digit! !

!OMeta2RuleParser methodsFor: 'private' stamp: 'pb 5/2/2020 00:31:49'!
nsName =

	firstAndRest(#nameFirst, #nameRest):xs -> [(String withAll: xs) asSymbol]
|	$_ -> [#anything]
! !

!OMeta2RuleParser methodsFor: 'private' stamp: 'pb 5/22/2015 19:04'!
numberLiteral =

	spaces ($- spaces -> [-1] | empty -> [1]):sign digit+:ds
		-> [{#App. #exactly. (sign * (String withAll: ds) asNumber) storeString}]! !

!OMeta2RuleParser methodsFor: 'private' stamp: 'pb 5/22/2015 19:04'!
optIter :x =

	"*"		-> [{#Many.  x}]
|	"+"		-> [{#Many1. x}]
|	"?" ~$[	-> [{#Opt. x}]
|	empty		-> [x]! !

!OMeta2RuleParser methodsFor: 'private' stamp: 'pb 5/22/2015 19:05'!
rulePart :ruleName =

	name:n ?[n = ruleName] expr4:b1
		(	"=" expr:b2	-> [{#And. b1. b2}]
		|	empty			-> [b1]
		)! !

!OMeta2RuleParser methodsFor: 'private' stamp: 'pb 6/16/2020 10:58:09'!
ruleProduction =

	"->"! !

!OMeta2RuleParser methodsFor: 'private' stamp: 'pb 6/16/2020 10:58:16'!
semanticAction =

	ruleProduction? "[" (squeakExpression:expr | squeakInnerBlock:blk) $]
		-> [expr ifNil: [Array with: #SemBlkAct with: blk] ifNotNil: [Array with: #SemAct with: expr]]! !

!OMeta2RuleParser methodsFor: 'private' stamp: 'pb 4/29/2020 00:31:55'!
semanticPredicate =

	"?[" (squeakExpression:expr | squeakInnerBlock:blk) $]
		-> [expr ifNil: [Array with: #SemBlkPred with: blk] ifNotNil: [Array with: #SemPred with: expr]]! !

!OMeta2RuleParser methodsFor: 'private' stamp: 'pb 5/16/2020 21:36:59'!
space =

	^space | fromTo('/*', '*/') | fromToEndOfLine('//')! !

!OMeta2RuleParser methodsFor: 'private' stamp: 'pb 5/2/2020 19:27:58'!
squeakArgExprOrWrappedInnerBlock =

	[self pvtOMetaGetExternalSmalltalkRecognizerClass]:recog
	recog.squeakArgExprOrWrappedInnerBlock:ans spaces -> [ans]! !

!OMeta2RuleParser methodsFor: 'private' stamp: 'pb 5/2/2020 19:28:13'!
squeakExpression =

	[self pvtOMetaGetExternalSmalltalkRecognizerClass]:recog
	recog.squeakExpr:ans spaces -> [ans]! !

!OMeta2RuleParser methodsFor: 'private' stamp: 'pb 5/2/2020 19:28:24'!
squeakInnerBlock =

	[self pvtOMetaGetExternalSmalltalkRecognizerClass]:recog
	recog.squeakInnerBlock:ans spaces -> [ans]! !

!OMeta2RuleParser methodsFor: 'private' stamp: 'pb 5/22/2015 19:06'!
stringLiteral =

	"'" ($' $' -> [$'] | ~$' char)*:xs $' -> [{#App. #exactly. (String withAll: xs) storeString}]! !

!OMeta2RuleParser methodsFor: 'private' stamp: 'pb 5/22/2015 19:06'!
symbolLiteral =

	// TODO: make this accept, e.g., #foo:bar:
	"#" nsName:s -> [{#App. #exactly. s storeString}]! !

!OMeta2RuleParser methodsFor: 'private' stamp: 'pb 5/22/2015 19:07'!
tokenSugar =

	token('"') (~$" char)*:xs $" -> [{#App. #token. (String withAll: xs) storeString}]! !

!OMeta2RuleParser methodsFor: 'initialization' stamp: 'aw 2/18/2009 15:04'!
initialize

	super initialize.
	temps := IdentitySet new! !

!OMeta2RuleParser methodsFor: 'grammar root' stamp: 'pb 4/27/2020 01:45:58'!
ometaRule =
	&(^space* nsName):n rulePart(n):x ("," rulePart(n))*:xs spaces end
		-> [{#Rule. n. temps asSortedCollection. (OrderedCollection with: #Or with: x) addAll: xs; yourself}]! !

!OMeta2RuleParser methodsFor: 'grammar root' stamp: 'pb 5/2/2020 14:36:30'!
rule =
	squeakRule
|	ometaRule! !

!OMeta2RuleParser methodsFor: 'grammar root' stamp: 'pb 4/27/2020 01:46:09'!
squeakRule =
	// This isn't OMeta code so we'll handoff to Squeak when the time comes
	~(^space* nsName expr4 "=") <char*>:squeakCode -> [{#Squeak. squeakCode}]! !

!OMeta2RuleParser class methodsFor: 'testing' stamp: 'pb 5/17/2020 03:14:16'!
isOMeta2Rule: aString
	^ [
	(self
		matchAll: aString
		with: #rule) first ~= #Squeak ]
		on: OM2Fail
		do: [ :ex |
			ex return: false ].! !

!OMeta2RuleTranslator methodsFor: 'private' stamp: 'pb 4/28/2020 23:53:08'!
and =
	trans*:xs -> [{self delim: xs with: '. '}]! !

!OMeta2RuleTranslator methodsFor: 'private' stamp: 'pb 4/30/2020 23:05:41'!
app =
	[self flag: #privateOMetaApply:;
		flag: #privateOMetaApply:withArgs:]
	symbol:rule
	(	anything+:args
		-> [args size = 1
				ifTrue: [{'(self privateOMetaApply: '. rule storeString. ' withArgument: '. args first. ')'}]
				ifFalse: [{'(self privateOMetaApply: '. rule storeString. ' withArgs: {'. (self delim: args with: '. '). '})'}]
			]
	|	[{'(self privateOMetaApply: '. rule storeString. ')'}]
	)! !

!OMeta2RuleTranslator methodsFor: 'private' stamp: 'pb 4/25/2020 01:00'!
consby =
	[self flag: #pvtOMetaConsumedBy:]
	trans:x -> [{'(self pvtOMetaConsumedBy: ['. x. '])'}]! !

!OMeta2RuleTranslator methodsFor: 'private' stamp: 'aw 2/18/2009 14:43'!
delim: aSequenceableCollection  with: anObject

	| first ans |
	
	first := true.
	ans := OrderedCollection new.
	aSequenceableCollection do: [:x |
		first ifTrue: [first := false] ifFalse: [ans add: anObject].
		ans add: x
	].
	^ ans! !

!OMeta2RuleTranslator methodsFor: 'private' stamp: 'pb 4/15/2020 03:25:24'!
form =
	[self flag: #pvtOMetaForm:]
	trans:x -> [{'(self pvtOMetaForm: ['. x. '])'}]! !

!OMeta2RuleTranslator methodsFor: 'private' stamp: 'pb 4/15/2020 03:23:26'!
idxconsby =
	[self flag: #pvtOMetaIndexConsumedBy:]
	trans:x -> [{'(self pvtOMetaIndexConsumedBy: ['. x. '])'}]! !

!OMeta2RuleTranslator methodsFor: 'private' stamp: 'pb 4/15/2020 03:24:42'!
lookahead =
	[self flag: #pvtOMetaLookahead:]
	trans:x -> [{'(self pvtOMetaLookahead: ['. x. '])'}]! !

!OMeta2RuleTranslator methodsFor: 'private' stamp: 'pb 4/15/2020 03:30:24'!
many =
	[self flag: #pvtOMetaMany:]
	trans:x -> [{'(self pvtOMetaMany: ['. x. '])'}]! !

!OMeta2RuleTranslator methodsFor: 'private' stamp: 'pb 4/15/2020 03:30:33'!
many1 =
	[self flag: #pvtOMetaMany1:]
	trans:x -> [{'(self pvtOMetaMany1: ['. x. '])'}]! !

!OMeta2RuleTranslator methodsFor: 'private' stamp: 'pb 4/15/2020 03:30:45'!
not =
	[self flag: #pvtOMetaNot:]
	trans:x -> [{'(self pvtOMetaNot: ['. x. '])'}]! !

!OMeta2RuleTranslator methodsFor: 'private' stamp: 'pb 4/15/2020 03:30:54'!
opt =
	[self flag: #pvtOMetaOpt:]
	trans:x -> [{'(self pvtOMetaOpt: ['. x. '])'}]! !

!OMeta2RuleTranslator methodsFor: 'private' stamp: 'pb 4/15/2020 03:31:10'!
or =
	[self flag: #pvtOMetaOr:]
	(trans:x -> [{'['. x. ']'}])*:xs -> [{'(self pvtOMetaOr: {'. self delim: xs with: '. '. '})'}]! !

!OMeta2RuleTranslator methodsFor: 'private' stamp: 'pb 4/29/2020 02:50:16'!
rule =
	symbol:name
	anything:temps [temps select: [:t | (grammarClass instVarNames includes: t) not]]:temps
	trans:body
	-> [|oc tift|
		tift := false.
		oc := OrderedCollection new.
		oc
			add: name;
			add: self class constOMetaGeneratorString;
			add: ' |';
			add: (self delim: temps asSortedCollection with: ' ');
			add: ' | ^ '.
		tift ifTrue: [oc add: 'true ifTrue: ["from #rule"'].
		oc add: body.
		tift ifTrue: [oc add: ']'].
		oc]
! !

!OMeta2RuleTranslator methodsFor: 'private' stamp: 'pb 5/22/2015 19:07'!
semact = string:x -> [{'('. x. ')'}]! !

!OMeta2RuleTranslator methodsFor: 'private' stamp: 'pb 4/29/2020 00:07:28'!
semblkact = string:x -> [{'true ifTrue:['. x. ']'}]! !

!OMeta2RuleTranslator methodsFor: 'private' stamp: 'pb 4/29/2020 00:33:01'!
semblkpred =
	[self flag: #pvtOMetaPred:]
	string:x -> [{'(self pvtOMetaPred: (true ifTrue:['. x. ']))'}]! !

!OMeta2RuleTranslator methodsFor: 'private' stamp: 'pb 4/15/2020 03:31:43'!
sempred =
	[self flag: #pvtOMetaPred:]
	string:x -> [{'(self pvtOMetaPred: ('. x. '))'}]! !

!OMeta2RuleTranslator methodsFor: 'private' stamp: 'pb 5/22/2015 19:12'!
set =

	symbol:n trans:v -> [{'('. n asString. ' := '. v. ')'}]! !

!OMeta2RuleTranslator methodsFor: 'private' stamp: 'pb 5/22/2015 19:12'!
squeak = string! !

!OMeta2RuleTranslator methodsFor: 'private' stamp: 'pb 4/30/2020 23:05:50'!
superapp =
	[self flag: #pvtOMetaSuper:apply:withArgs:]
	symbol:rule anything*:args
		-> [args size = 1
				ifTrue: [{'(self pvtOMetaSuper: '. grammarClass superclass name. ' apply: '. rule storeString. ' withArgument: '. args first. ')'}]
				ifFalse: [{'(self pvtOMetaSuper: '. grammarClass superclass name. ' apply: '. rule storeString. ' withArgs: {'. (self delim: args with: '. '). '})'}]]
! !

!OMeta2RuleTranslator methodsFor: 'private' stamp: 'pb 5/5/2020 07:32:46'!
trans = {symbol:type applyRule(type asLowercase asSymbol):ans} -> [ans]! !

!OMeta2RuleTranslator methodsFor: 'private' stamp: 'pb 4/28/2020 23:52:51'!
trueiftrue =
	[self flag: #ifTrue:]
	trans*:xs -> [{'(true ifTrue: ['. xs. '])'}]
! !

!OMeta2RuleTranslator methodsFor: 'grammar root' stamp: 'pb 5/22/2015 19:13'!
translate :grammarClass = trans! !

!OMeta2RuleTranslator class methodsFor: 'constants' stamp: 'pb 5/23/2018 03:01:33'!
constOMetaGeneratorString
	^ '"Generated by OMeta... edit the rule (i.e. show...->source), not this Smalltalk code"'.! !

!OMeta2SqueakSmalltalkRecognizer methodsFor: 'private' stamp: 'aw 2/20/2009 00:43'!
arrayConstr =

	"{" expr ("." expr)* ("." | empty) "}"
|	"{" "}"! !

!OMeta2SqueakSmalltalkRecognizer methodsFor: 'private' stamp: 'pb 5/2/2020 19:56:31'!
arrayLit =

	"#" "(" (literal | arrayLit | arraySubLit | commentAndSpaces tsArraySymbol)* ")"! !

!OMeta2SqueakSmalltalkRecognizer methodsFor: 'private' stamp: 'pb 5/2/2020 19:56:16'!
arraySubLit =

	// A subarray in an array literal doesn't require the leading #
	"(" (literal | arrayLit | arraySubLit | commentAndSpaces tsArraySymbol)* ")"! !

!OMeta2SqueakSmalltalkRecognizer methodsFor: 'private' stamp: 'pb 5/2/2020 19:56:50'!
binary =

	commentAndSpaces tsBinary! !

!OMeta2SqueakSmalltalkRecognizer methodsFor: 'private' stamp: 'aw 2/20/2009 00:58'!
binaryExpr =

	binaryExpr binaryMsg
|	unaryExpr! !

!OMeta2SqueakSmalltalkRecognizer methodsFor: 'private' stamp: 'aw 2/20/2009 00:58'!
binaryMsg =

	binary unaryExpr! !

!OMeta2SqueakSmalltalkRecognizer methodsFor: 'private' stamp: 'pb 5/2/2020 19:58:07'!
block =

	"["
		(	(":" identifier)+ "|"
		|	empty
		)

		(	"|" identifier* "|"
		|	empty
		)

		commentAndSpaces

		(	expr ("." expr)* ("." "^" expr | empty)
		|	"^" expr
		|	empty
		)

		commentAndSpaces

		(	"."
		|	empty
		)

		commentAndSpaces
	"]"! !

!OMeta2SqueakSmalltalkRecognizer methodsFor: 'private' stamp: 'aw 2/20/2009 00:58'!
cascade =

	identifier
|	binaryMsg
|	keywordMsg! !

!OMeta2SqueakSmalltalkRecognizer methodsFor: 'private' stamp: 'pb 5/2/2020 19:42:23'!
commentAndSpaces =

	((spaces comment)+
	| spaces comment?)
	spaces
! !

!OMeta2SqueakSmalltalkRecognizer methodsFor: 'private' stamp: 'aw 2/20/2009 00:59'!
expr =

	identifier (":=" | "_") expr
|	msgExpr! !

!OMeta2SqueakSmalltalkRecognizer methodsFor: 'private' stamp: 'pb 5/2/2020 19:58:21'!
identifier =

	commentAndSpaces tsIdentifier ~$:! !

!OMeta2SqueakSmalltalkRecognizer methodsFor: 'private' stamp: 'pb 5/2/2020 19:58:29'!
keyword =

	commentAndSpaces tsKeyword! !

!OMeta2SqueakSmalltalkRecognizer methodsFor: 'private' stamp: 'aw 2/20/2009 01:19'!
keywordExpr =

	binaryExpr keywordMsg! !

!OMeta2SqueakSmalltalkRecognizer methodsFor: 'private' stamp: 'aw 2/20/2009 01:19'!
keywordMsg =

	keywordMsg keywordMsgPart
|	keywordMsgPart! !

!OMeta2SqueakSmalltalkRecognizer methodsFor: 'private' stamp: 'aw 2/20/2009 01:20'!
keywordMsgPart =

	keyword binaryExpr! !

!OMeta2SqueakSmalltalkRecognizer methodsFor: 'private' stamp: 'pb 5/2/2020 19:58:40'!
literal =

	commentAndSpaces (	tsNumber
			|	tsCharacter
			|	tsString
			|	tsSymbol
			)
! !

!OMeta2SqueakSmalltalkRecognizer methodsFor: 'private' stamp: 'aw 2/20/2009 01:21'!
msgExpr =

	(keywordExpr | binaryExpr) (";" cascade)*! !

!OMeta2SqueakSmalltalkRecognizer methodsFor: 'private' stamp: 'pb 5/2/2020 14:39:05'!
pvtGetTypeTable
	^ useArgTypeTable
		ifTrue: [ ArgTypeTable ]
		ifFalse: [ TypeTable ].! !

!OMeta2SqueakSmalltalkRecognizer methodsFor: 'private' stamp: 'aw 2/20/2009 01:23'!
symbol =

	"#" spaces
		(	tsString
		|	tsKeyword (tsIdentifier | empty)
		)! !

!OMeta2SqueakSmalltalkRecognizer methodsFor: 'private' stamp: 'pb 5/1/2020 23:45:51'!
tcBinaryChar =

	char:x ?[(self pvtGetTypeTable at: x asciiValue) == #xBinary]! !

!OMeta2SqueakSmalltalkRecognizer methodsFor: 'private' stamp: 'aw 2/20/2009 01:25'!
tsArraySymbol =

	tsKeyword+ (tsIdentifier | empty)
|	tsIdentifier! !

!OMeta2SqueakSmalltalkRecognizer methodsFor: 'private' stamp: 'aw 2/20/2009 01:25'!
tsBinary =

	($| | tcBinaryChar) tcBinaryChar*! !

!OMeta2SqueakSmalltalkRecognizer methodsFor: 'private' stamp: 'aw 2/20/2009 01:25'!
tsCharacter =

	$$ char! !

!OMeta2SqueakSmalltalkRecognizer methodsFor: 'private' stamp: 'aw 2/20/2009 01:26'!
tsIdentifier =

	letter (letter | digit)*! !

!OMeta2SqueakSmalltalkRecognizer methodsFor: 'private' stamp: 'aw 2/20/2009 01:31'!
tsKeyword =

	tsIdentifier $:! !

!OMeta2SqueakSmalltalkRecognizer methodsFor: 'private' stamp: 'aw 2/20/2009 01:26'!
tsNatural =

	digit+! !

!OMeta2SqueakSmalltalkRecognizer methodsFor: 'private' stamp: 'aw 2/20/2009 01:27'!
tsNumber =

	($+ | $- | empty) tsNatural! !

!OMeta2SqueakSmalltalkRecognizer methodsFor: 'private' stamp: 'aw 2/20/2009 01:28'!
tsString =

	$' ($' $' | ~$' char)* $'! !

!OMeta2SqueakSmalltalkRecognizer methodsFor: 'private' stamp: 'aw 2/20/2009 01:28'!
tsSymbol =

	$# spaces (tsString | tsArraySymbol)! !

!OMeta2SqueakSmalltalkRecognizer methodsFor: 'private' stamp: 'aw 2/20/2009 01:28'!
unaryExpr =

	unit identifier*! !

!OMeta2SqueakSmalltalkRecognizer methodsFor: 'private' stamp: 'aw 2/20/2009 01:29'!
unit =

	literal
|	identifier
|	arrayLit
|	arrayConstr
|	block
|	"(" expr ")"
! !

!OMeta2SqueakSmalltalkRecognizer methodsFor: 'grammar root' stamp: 'pb 5/31/2020 01:37:18'!
squeakArgExprOrWrappedInnerBlock =

	"[" squeakInnerBlock:inner "]" -> ['(true ifTrue: [', inner, '])']
|	[useArgTypeTable := true] squeakExpr:expr -> [expr]
! !

!OMeta2SqueakSmalltalkRecognizer methodsFor: 'grammar root' stamp: 'aw 2/20/2009 01:30'!
squeakExpr =

	<expr>! !

!OMeta2SqueakSmalltalkRecognizer methodsFor: 'grammar root' stamp: 'pb 5/31/2020 01:37:26'!
squeakInnerBlock =

	// Needed for OMeta semantic actions and predicates
	<(	(":" identifier)+ "|"
		|	empty
		)

		(	"|" identifier* "|"
		|	empty
		)

		(	expr ("." expr)* ("." "^" expr | empty)
		|	"^" expr
		|	empty
		)

		(	"."
		|	empty
	)>:innerBlock -> [innerBlock]! !

!OMeta2SqueakSmalltalkRecognizer methodsFor: 'initialization' stamp: 'pb 5/1/2020 23:44:37'!
initialize
	super initialize.
	useArgTypeTable := false.! !

!OMeta2SqueakSmalltalkRecognizer class methodsFor: 'class initialization' stamp: 'pb 5/2/2020 00:41:27'!
initialize
	TypeTable := #(#xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xDelimiter #xDelimiter #xBinary #xDelimiter #xDelimiter #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #doIt #xBinary #xDelimiter #xBinary #xDoubleQuote #xLitQuote #xDollar #xBinary #xBinary #xSingleQuote #leftParenthesis #rightParenthesis #xBinary #xBinary #xBinary #xBinary #period #xBinary #xDigit #xDigit #xDigit #xDigit #xDigit #xDigit #xDigit #xDigit #xDigit #xDigit #xColon #semicolon #xBinary #xBinary #xBinary #xBinary #xBinary #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #leftBracket #xBinary #rightBracket #upArrow #leftArrow #xBinary #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #leftBrace #verticalBar #rightBrace #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xLetter #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xBinary #xLetter #xBinary #xBinary #xBinary #xBinary #xLetter #xBinary #xBinary #xBinary #xBinary #xBinary #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xBinary #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xBinary #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xLetter #xBinary ).
	ArgTypeTable := TypeTable copy.
	ArgTypeTable
		at: 44
		put: #xLetter.! !

!OMeta2CuisSmalltalkRecognizer methodsFor: 'private' stamp: 'pb 5/2/2020 18:56:23'!
backtickExpr =

	$` (~$` anything)* $`! !

!OMeta2CuisSmalltalkRecognizer methodsFor: 'private' stamp: 'pb 5/2/2020 18:56:28'!
byteArrayLit =

	"#" "[" (literal | commentAndSpaces tsArraySymbol)* "]" ! !

!OMeta2CuisSmalltalkRecognizer methodsFor: 'private' stamp: 'pb 5/2/2020 18:54:28'!
identifier =

	(commentAndSpaces backtickExpr)
|	^ identifier! !

!OMeta2CuisSmalltalkRecognizer methodsFor: 'private' stamp: 'pb 5/2/2020 18:56:36'!
msgExpr =

	(keywordExpr | binaryExpr) (";" cascade)* ("::" cascade)*! !

!OMeta2CuisSmalltalkRecognizer methodsFor: 'private' stamp: 'pb 5/2/2020 18:56:41'!
tsSymbolIdentifier =

	<(letter | $_) (letter | digit | $_ | $:)*>! !

!OMeta2CuisSmalltalkRecognizer methodsFor: 'private' stamp: 'pb 5/2/2020 18:56:45'!
unit =

	byteArrayLit
|	backtickExpr
|	^ unit! !
OMeta2SqueakSmalltalkRecognizer initialize!
OMeta2Package postPackageInstall!
