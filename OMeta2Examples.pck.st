'From Cuis 4.2 of 25 July 2013 [latest update: #2343] on 10 June 2015 at 12:46:08.792221 am'!
'Description Example parsers for OMeta2'!
!provides: 'OMeta2Examples' 2 0!
!requires: 'OMeta2' 2 0 nil!
!classDefinition: #OMeta2Examples category: #OMeta2Examples!
OMeta2 subclass: #OMeta2Examples
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2Examples'!
!classDefinition: 'OMeta2Examples class' category: #OMeta2Examples!
OMeta2Examples class
	instanceVariableNames: ''!

!classDefinition: #OMeta2LambdaCalculusParserExample category: #OMeta2Examples!
OMeta2 subclass: #OMeta2LambdaCalculusParserExample
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2Examples'!
!classDefinition: 'OMeta2LambdaCalculusParserExample class' category: #OMeta2Examples!
OMeta2LambdaCalculusParserExample class
	instanceVariableNames: ''!

!classDefinition: #OMeta2LispExample category: #OMeta2Examples!
OMeta2 subclass: #OMeta2LispExample
	instanceVariableNames: 'env envStack envStackPointer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2Examples'!
!classDefinition: 'OMeta2LispExample class' category: #OMeta2Examples!
OMeta2LispExample class
	instanceVariableNames: ''!

!classDefinition: #OMeta2StepByStepExample category: #OMeta2Examples!
OMeta2 subclass: #OMeta2StepByStepExample
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2Examples'!
!classDefinition: 'OMeta2StepByStepExample class' category: #OMeta2Examples!
OMeta2StepByStepExample class
	instanceVariableNames: ''!

!classDefinition: #OMeta2TreeWalkerExample category: #OMeta2Examples!
OMeta2 subclass: #OMeta2TreeWalkerExample
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2Examples'!
!classDefinition: 'OMeta2TreeWalkerExample class' category: #OMeta2Examples!
OMeta2TreeWalkerExample class
	instanceVariableNames: ''!

!classDefinition: #OMeta2TreeExample category: #OMeta2Examples!
Object subclass: #OMeta2TreeExample
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2Examples'!
!classDefinition: 'OMeta2TreeExample class' category: #OMeta2Examples!
OMeta2TreeExample class
	instanceVariableNames: ''!

!classDefinition: #OMeta2TreeEmptyExample category: #OMeta2Examples!
OMeta2TreeExample subclass: #OMeta2TreeEmptyExample
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2Examples'!
!classDefinition: 'OMeta2TreeEmptyExample class' category: #OMeta2Examples!
OMeta2TreeEmptyExample class
	instanceVariableNames: ''!

!classDefinition: #OMeta2TreeLeafExample category: #OMeta2Examples!
OMeta2TreeExample subclass: #OMeta2TreeLeafExample
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2Examples'!
!classDefinition: 'OMeta2TreeLeafExample class' category: #OMeta2Examples!
OMeta2TreeLeafExample class
	instanceVariableNames: ''!

!classDefinition: #OMeta2TreeNodeExample category: #OMeta2Examples!
OMeta2TreeExample subclass: #OMeta2TreeNodeExample
	instanceVariableNames: 'leftTree rightTree'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2Examples'!
!classDefinition: 'OMeta2TreeNodeExample class' category: #OMeta2Examples!
OMeta2TreeNodeExample class
	instanceVariableNames: ''!


!OMeta2Examples commentStamp: '<historical>' prior: 0!
Here's how to run these examples:

	OMeta2Examples match: 5 with: #fact.
	OMeta2Examples matchAll: '1234' with: #number.
	OMeta2Examples matchAll: 'abc123' with: #identifier.
	OMeta2Examples matchAll: #($a $b $c 1 2 3 #(4 5)) with: #structure.
	OMeta2Examples matchAll: 'howdy' with: #greeting.!

!OMeta2LambdaCalculusParserExample commentStamp: '<historical>' prior: 0!
A port of the Lambda Calculus parser from: http://www.tinlizzie.org/ometa-js/#Lambda_Calculus

There are several other OMeta examples at this site.  Unfortunately for Smalltalk users, they're all in OMeta/JS which has a slightly different syntax.  Hopefully having this example to compare to will help you to translate the syntax.

To run this example:

OMeta2LambdaCalculusParserExample demo!

!OMeta2LispExample commentStamp: '<historical>' prior: 0!
Implementation of http://www.tinlizzie.org/ometa-js/#Lisp

There are several examples at this site.  Unfortunately for Smalltalk users, they're all in Javascript.  Hopefully this example will help you to translate the syntax.

To run this example:

OMeta2LispExample demo!

!OMeta2StepByStepExample commentStamp: '<historical>' prior: 0!
This grammar will be the kitchen sink: exercise every aspect of OMeta syntax.  In addition, it should also be a good starting point to learn all about OMeta syntax.  After you've played around with some of the other examples, look at QOMeta2StepByStepTests tests for usage examples.

WIP / todo core syntax including: lookahead, grouping, form, parameterized rules, index consumed by, foreign rules.  Also many remaining predefined rules (i.e. listOf, fromTo, fromToEnd, range, etc.)!

!OMeta2TreeWalkerExample commentStamp: '<historical>' prior: 0!
See OMeta2TreeExample!

!OMeta2TreeExample commentStamp: '<historical>' prior: 0!
Based on Frank Shearar's post http://www.lshift.net/blog/2011/05/15/algebraic-data-types-and-ometa2/

This example demonstrates using OMeta to parse a tree structure.  The parser is in OMeta2TreeWalkerExample.

To run this example:

OMeta2TreeExample demo
!

!OMeta2TreeEmptyExample commentStamp: '<historical>' prior: 0!
See OMeta2TreeExample!

!OMeta2TreeLeafExample commentStamp: '<historical>' prior: 0!
See OMeta2TreeExample!

!OMeta2TreeNodeExample commentStamp: '<historical>' prior: 0!
See OMeta2TreeExample!

!OMeta2Examples methodsFor: 'as yet unclassified' stamp: 'aw 2/20/2009 02:35'!
aSqueakMethod

	self inform: 'hello world'! !

!OMeta2Examples methodsFor: 'as yet unclassified' stamp: 'aw 2/20/2009 02:36'!
anotherSqueakMethod

	self inform: 'good-bye world'! !

!OMeta2Examples methodsFor: 'as yet unclassified' stamp: 'aw 2/27/2009 15:58'!
digit =

	// this example shows the new syntax for super rule applications
	// think of the ^ as an arrow that's pointing up to the parent grammar

	^digit:d -> [d digitValue]! !

!OMeta2Examples methodsFor: 'as yet unclassified' stamp: 'aw 5/20/2009 12:58'!
fact 0 = [1],
fact _:n = fact(n - 1):m -> [n * m]

// this example shows that rules can have multiple definitions (they are tried in order)
! !

!OMeta2Examples methodsFor: 'as yet unclassified' stamp: 'aw 2/26/2009 12:04'!
formTest =

	{[self inform: input hash printString] #foo #bar}
|	{[self inform: input hash printString] #bar}! !

!OMeta2Examples methodsFor: 'as yet unclassified' stamp: 'aw 2/20/2009 14:36'!
greeting = <``howdy'' ``-ho''?>! !

!OMeta2Examples methodsFor: 'as yet unclassified' stamp: 'aw 2/27/2009 15:45'!
identifier =

	// this is an example of the new <> operator

	spaces <letter (letter | digit)*>! !

!OMeta2Examples methodsFor: 'as yet unclassified' stamp: 'aw 2/27/2009 15:48'!
identifierIdx =

	// this is an example of the new @<> operator

	spaces @<letter (letter | digit)*>! !

!OMeta2Examples methodsFor: 'as yet unclassified' stamp: 'aw 2/20/2009 14:54'!
identifiers =

	([self inform: self pos printString] identifier)*! !

!OMeta2Examples methodsFor: 'as yet unclassified' stamp: 'aw 2/27/2009 15:46'!
number =

	// this is an example of left recursion support

	number:n digit:d -> [n * 10 + d]
|	digit! !

!OMeta2Examples methodsFor: 'as yet unclassified' stamp: 'aw 2/27/2009 15:46'!
structure =

	// this example shows how the {}s are used for matching sequenceable collections

	$a $b $c 1 2 3 {anything*}! !

!OMeta2LambdaCalculusParserExample methodsFor: 'as yet unclassified' stamp: 'pb 5/23/2015 18:06'!
addExpr  = addExpr:x "+" mulExpr:y  -> [{'add'. x. y}]
         | addExpr:x "-" mulExpr:y             -> [{'sub'. x. y}]         
         | mulExpr! !

!OMeta2LambdaCalculusParserExample methodsFor: 'as yet unclassified' stamp: 'pb 5/23/2015 17:17'!
digit    = ^digit:d                 -> [d digitValue]! !

!OMeta2LambdaCalculusParserExample methodsFor: 'as yet unclassified' stamp: 'pb 5/23/2015 05:07'!
expr = addExpr:e -> [{e}]! !

!OMeta2LambdaCalculusParserExample methodsFor: 'as yet unclassified' stamp: 'pb 5/23/2015 17:57'!
iName        = firstAndRest(#nameFirst. #nameRest):r -> [(String withAll: r) asSymbol]! !

!OMeta2LambdaCalculusParserExample methodsFor: 'as yet unclassified' stamp: 'pb 5/23/2015 18:06'!
logExpr  = logExpr:x "and" primExpr:y -> [{'and'. x. y}]
         | logExpr:x "or" primExpr:y           -> [{'or'. x. y}]
         | logExpr:x "xor" primExpr:y          -> [{'xor'. x. y}]
         | "not" logExpr:x                           -> [{'not'. x}]
         | primExpr! !

!OMeta2LambdaCalculusParserExample methodsFor: 'as yet unclassified' stamp: 'pb 5/23/2015 18:07'!
mulExpr  = mulExpr:x "*" powExpr:y                  -> [{'mul'. x. y}]
         | mulExpr:x "/" powExpr:y                           -> [{'div'. x. y}]
         | powExpr! !

!OMeta2LambdaCalculusParserExample methodsFor: 'as yet unclassified' stamp: 'pb 5/23/2015 05:06'!
nameFirst    = letter! !

!OMeta2LambdaCalculusParserExample methodsFor: 'as yet unclassified' stamp: 'pb 5/23/2015 05:06'!
nameRest     = nameFirst | digit! !

!OMeta2LambdaCalculusParserExample methodsFor: 'as yet unclassified' stamp: 'pb 5/23/2015 05:01'!
number   = number:n digit:d         -> [n * 10 + d]
         | digit! !

!OMeta2LambdaCalculusParserExample methodsFor: 'as yet unclassified' stamp: 'pb 5/23/2015 18:07'!
powExpr  = powExpr:x "^" relExpr:y  -> [{'pow'. x. y}]
         | relExpr! !

!OMeta2LambdaCalculusParserExample methodsFor: 'as yet unclassified' stamp: 'pb 5/23/2015 22:08'!
primExpr = "(" expr:x ")"               -> [x]
         | spaces iName:nn spaces   -> [{'name'. nn}]
         | spaces number:n spaces   -> [{'num'. n}]! !

!OMeta2LambdaCalculusParserExample methodsFor: 'as yet unclassified' stamp: 'pb 5/23/2015 18:07'!
relExpr  = relExpr:x ">" logExpr:y   -> [{'gt'. x. y}]
         | relExpr:x "<" logExpr:y          -> [{'lt'. x. y}]
         | relExpr:x ">=" logExpr:y       -> [{'gte'. x. y}]
         | relExpr:x "<=" logExpr:y       -> [{'lte'. x. y}]
         | relExpr:x "=" logExpr:y          -> [{'eq'. x. y}]
         | relExpr:x "!!=" logExpr:y         -> [{'neq'. x. y}]
         | logExpr! !

!OMeta2LambdaCalculusParserExample methodsFor: 'as yet unclassified' stamp: 'pb 5/23/2015 19:09'!
root = root:r  ";" expr:ef -> [r, ef]
         | expr:e                  -> [e]! !

!OMeta2LambdaCalculusParserExample methodsFor: 'as yet unclassified' stamp: 'pb 5/23/2015 19:24'!
rootHang = root:r  ';' expr:ef -> [{r. ef}]
	// FIXME - Added an error above.. why do we go into an infinite loop attempting when calling via debugMatchAll:?
         | expr:e                  -> [e]! !

!OMeta2LambdaCalculusParserExample class methodsFor: 'as yet unclassified' stamp: 'pb 5/23/2015 19:22'!
demo
	^ self matchAll: 'x and y;x*y' with: #root.! !

!OMeta2LispExample methodsFor: 'as yet unclassified' stamp: 'pb 5/29/2015 21:43'!
app = #car                {{:hd anything*}}                -> [hd]
         | #cdr                {{:hd anything*:tl}}             -> [tl]
         | #cons               {:hd :tl}                              -> [{hd. tl}]
         | #atom               {:x}                                   -> [(x class = Array) not]
         | #eq                 {:x :y}                                 -> [(x == y)]
         | {#lambda :fs :body} :args
             enter bind(fs. args) ev(body):ans leave     -> [ans]
! !

!OMeta2LispExample methodsFor: 'as yet unclassified' stamp: 'pb 5/29/2015 19:00'!
bind   = {}                {}
         | {:f anything*:fs} {:a anything*:as} bind(fs. as) -> [self envAt: f put: a]! !

!OMeta2LispExample methodsFor: 'as yet unclassified' stamp: 'pb 5/23/2015 04:07'!
condF  = ~condT anything! !

!OMeta2LispExample methodsFor: 'as yet unclassified' stamp: 'pb 5/29/2015 21:32'!
condT  = {ev:x ?[x] ev:ans}                                 -> [ans]! !

!OMeta2LispExample methodsFor: 'as yet unclassified' stamp: 'pb 5/29/2015 18:08'!
enter = -> [self push]
! !

!OMeta2LispExample methodsFor: 'as yet unclassified' stamp: 'pb 5/29/2015 22:34'!
envAt: key
	| value |
	value := env
		at: key
		ifAbsent: [ ].
		"
	Transcript
		show: 'get ' , key asString , ' = ' , value asString;
		finishEntry.
		"
	^ value.! !

!OMeta2LispExample methodsFor: 'as yet unclassified' stamp: 'pb 5/29/2015 22:35'!
envAt: key put: value
	"
	Transcript
		show: 'set ' , key asString , ' := ' , value asString;
		finishEntry.
		"
	env
		at: key
		put: value.! !

!OMeta2LispExample methodsFor: 'as yet unclassified' stamp: 'pb 5/26/2015 18:09'!
ev    = string:a                                                    -> [self envAt: a]
         | {#lambda :fs :body}                                 -> [{#lambda. fs. body}]
         | {#quote   :ans}                                        -> [ans]
         | {#cond    evCond:ans}                             -> [ans]
         | {ev:f        ev*:xs}     app(f. xs):ans            -> [ans]! !

!OMeta2LispExample methodsFor: 'as yet unclassified' stamp: 'pb 5/29/2015 21:35'!
evCond = 
//	condF* condT:ans anything*                       -> [x]
//	| condF* anything*	-> [nil]
	condF* condT:ans anything*                       -> [ans]
	| condF* anything*	-> [nil]
! !

!OMeta2LispExample methodsFor: 'as yet unclassified' stamp: 'pb 5/29/2015 18:13'!
initialize
	envStack := OrderedCollection new.
	envStackPointer := 0.
	env := Dictionary new
			at: #car
			put: 'car';
		
			at: #cdr
			put: 'cdr';
		
			at: #cons
			put: 'cons';
		
			at: #atom
			put: 'atom';
		
			at: #eq
			put: 'eq';
			
			at: #lambda
			put: 'lambda';
		
			at: #nil
			put: nil;
		
			at: #t
			put: true;
		yourself.! !

!OMeta2LispExample methodsFor: 'as yet unclassified' stamp: 'pb 5/29/2015 18:25'!
leave = -> [self pop]
! !

!OMeta2LispExample methodsFor: 'as yet unclassified' stamp: 'pb 5/29/2015 18:10'!
pop
	env := envStack at: envStackPointer.
	envStack removeAt: envStackPointer.
	envStackPointer := envStackPointer - 1.
! !

!OMeta2LispExample methodsFor: 'as yet unclassified' stamp: 'pb 5/29/2015 20:55'!
push
	| savedEnv |
	envStackPointer := envStackPointer + 1.
	savedEnv := env copy.
	envStack size < envStackPointer
		ifTrue: [ envStack add: savedEnv ]
		ifFalse: [
			envStack
				at: envStackPointer
				put: savedEnv ].! !

!OMeta2LispExample methodsFor: 'as yet unclassified' stamp: 'pb 5/29/2015 17:28'!
sexp = sexp:s ev:e -> [e]
	| ev:e                 -> [e]
! !

!OMeta2LispExample class methodsFor: 'as yet unclassified' stamp: 'pb 5/29/2015 19:12'!
demo
	^ OMeta2LispExample evalDebugAll: #(
		(cons
			((lambda (x) (cons x x)) (quote boo))
			(eq x (quote boo)))).! !

!OMeta2LispExample class methodsFor: 'as yet unclassified' stamp: 'pb 5/29/2015 17:10'!
eval: x
	^ self match: x with: #ev! !

!OMeta2LispExample class methodsFor: 'as yet unclassified' stamp: 'pb 5/29/2015 17:30'!
evalAll: x
	^ self matchAll: x with: #sexp! !

!OMeta2LispExample class methodsFor: 'as yet unclassified' stamp: 'pb 5/29/2015 17:31'!
evalDebug: x
	^ self debugMatch: x with: #ev! !

!OMeta2LispExample class methodsFor: 'as yet unclassified' stamp: 'pb 5/29/2015 17:31'!
evalDebugAll: x
	^ self debugMatchAll: x with: #sexp! !

!OMeta2StepByStepExample methodsFor: 'test cases' stamp: 'pb 6/9/2015 22:08'!
testAnything =
	anything! !

!OMeta2StepByStepExample methodsFor: 'test cases' stamp: 'pb 6/9/2015 22:07'!
testConsumedBy =
	// Sometimes you'll want everything consumed by (i.e. matched) by an expression or a rule.  For sequences of characters, this has the useful side-effect of converting the consumed input to strings
	<testManyAnything>! !

!OMeta2StepByStepExample methodsFor: 'test cases' stamp: 'pb 6/9/2015 22:44'!
testConsumedByIndex =
	// Sometimes you may only care about the positional indexes of the consumed range
	@<testManyAnything>! !

!OMeta2StepByStepExample methodsFor: 'test cases' stamp: 'pb 6/9/2015 23:58'!
testLiteralChar =
	$a! !

!OMeta2StepByStepExample methodsFor: 'test cases' stamp: 'pb 6/9/2015 05:34'!
testLiteralString =
	'abc'! !

!OMeta2StepByStepExample methodsFor: 'test cases' stamp: 'pb 6/10/2015 00:44'!
testLookaheadNot =
	// Anything but a "
	(~$" char)*! !

!OMeta2StepByStepExample methodsFor: 'test cases' stamp: 'pb 6/9/2015 05:30'!
testMany1Char =
	// + matches 1 or more occurrences
	$a+! !

!OMeta2StepByStepExample methodsFor: 'test cases' stamp: 'pb 6/9/2015 05:30'!
testMany1String =
	// + matches 1 or more occurrences
	'abc'+! !

!OMeta2StepByStepExample methodsFor: 'test cases' stamp: 'pb 6/9/2015 22:07'!
testManyAnything =
	// * matches 0 or more occurrences
	anything*! !

!OMeta2StepByStepExample methodsFor: 'test cases' stamp: 'pb 6/9/2015 05:27'!
testManyChar =
	// * matches 0 or more occurrences
	$a*! !

!OMeta2StepByStepExample methodsFor: 'test cases' stamp: 'pb 6/9/2015 05:27'!
testManyString =
	// * matches 0 or more occurrences
	'abc'*! !

!OMeta2StepByStepExample methodsFor: 'test cases' stamp: 'pb 6/9/2015 19:40'!
testOpt =
	// expr? tests for 0 or 1 occurrence, returns nil if 0.
	"abc"?! !

!OMeta2StepByStepExample methodsFor: 'test cases' stamp: 'pb 6/9/2015 20:49'!
testPrioritizedChoice =
	// | is the prioritized choice operator and behaves like a switch statement.  When the first test fails, it moves on to the second one.  Had the first test succeeded, the second one would be ignored.
	testSemanticAction
	| testConsumedBy! !

!OMeta2StepByStepExample methodsFor: 'test cases' stamp: 'pb 6/9/2015 19:19'!
testSemanticAction =
	// -> is the action to perform if the predicate succeeds
	testConsumedBy:x ?[x='testing'] -> ['got it!!']! !

!OMeta2StepByStepExample methodsFor: 'test cases' stamp: 'pb 6/9/2015 19:32'!
testSemanticPredicate =
	// ?expr is the semantic predicate, if it succeeds the match continues.  We're also assigning the match to x so that we can use it in the predicate.
	testConsumedBy:x ?[x='testing']! !

!OMeta2StepByStepExample methodsFor: 'test cases' stamp: 'pb 6/9/2015 18:30'!
testSeqObject =
	// Sequences aren't limited to strings...
	seq(#(1 2 3))! !

!OMeta2StepByStepExample methodsFor: 'test cases' stamp: 'pb 6/9/2015 20:38'!
testSeqString =
	// ``item'' is syntactic sugar for a sequence of characters i.e. seq('item')
	// While this rule expects two 'item' sequences, OMeta only returns the last match from the rule by default
	``item'' seq('item')! !

!OMeta2StepByStepExample methodsFor: 'test cases' stamp: 'pb 6/9/2015 18:08'!
testToken =
	// "item" syntactic sugar for token('item') - be careful to use the correct quotes!!
	// While this rule expects two 'item' tokens, OMeta only returns the last match from the rule by default
	"item" token('item')! !

!OMeta2TreeWalkerExample methodsFor: 'as yet unclassified' stamp: 'pb 5/23/2015 14:49'!
depth =
        {#Empty} -> [0]
        | {#Leaf anything} -> [1]
        | {#Node depth:l depth:r} -> [(l max: r) + 1]
! !

!OMeta2TreeWalkerExample methodsFor: 'as yet unclassified' stamp: 'pb 5/23/2015 14:38'!
sum =
        {#Empty} -> [0]
        | {#Leaf anything:v} -> [v]
        | {#Node sum:l sum:r} -> [l + r]! !

!OMeta2TreeExample methodsFor: 'as yet unclassified' stamp: 'pb 5/23/2015 16:18'!
depth
	^ OMeta2TreeWalkerExample match: self with: #depth! !

!OMeta2TreeExample methodsFor: 'as yet unclassified' stamp: 'pb 5/23/2015 14:55'!
isCollection
	^ true! !

!OMeta2TreeExample methodsFor: 'as yet unclassified' stamp: 'pb 5/23/2015 14:55'!
isSequenceable
	^ true! !

!OMeta2TreeExample methodsFor: 'as yet unclassified' stamp: 'pb 5/23/2015 16:18'!
readStream
	^ self unapply readStream! !

!OMeta2TreeExample methodsFor: 'as yet unclassified' stamp: 'pb 5/23/2015 16:18'!
sum
	^ OMeta2TreeWalkerExample match: self with: #sum! !

!OMeta2TreeExample class methodsFor: 'as yet unclassified' stamp: 'pb 5/23/2015 17:01'!
demo
	| tree |
	tree := self demoTree.
	^ Dictionary new
		
			at: #depth
			put: tree depth;
		
			at: #sum:
			put: tree sum;
		yourself.! !

!OMeta2TreeExample class methodsFor: 'as yet unclassified' stamp: 'pb 5/23/2015 16:12'!
demoTree
	^ OMeta2TreeNodeExample new
		left:
			(OMeta2TreeNodeExample new
				left:
					(OMeta2TreeLeafExample new
						value: 3;
						yourself);
				right:
					(OMeta2TreeNodeExample new
						left: OMeta2TreeLeafExample new;
						right:
							(OMeta2TreeNodeExample new
								left: OMeta2TreeLeafExample new;
								right: OMeta2TreeLeafExample new;
								yourself);
						yourself);
				yourself);
		right:
			(OMeta2TreeNodeExample new
				left:
					(OMeta2TreeLeafExample new
						value: 5;
						yourself);
				right: OMeta2TreeEmptyExample new yourself;
				yourself);
		yourself.! !

!OMeta2TreeEmptyExample methodsFor: 'as yet unclassified' stamp: 'pb 5/23/2015 16:25'!
unapply
	^ #(#Empty ).! !

!OMeta2TreeLeafExample methodsFor: 'as yet unclassified' stamp: 'pb 5/23/2015 15:44'!
initialize
	value := 1! !

!OMeta2TreeLeafExample methodsFor: 'as yet unclassified' stamp: 'pb 5/23/2015 16:24'!
unapply
	^ {#Leaf. value.}! !

!OMeta2TreeLeafExample methodsFor: 'as yet unclassified' stamp: 'pb 5/23/2015 15:31'!
value: aNumber
	value := aNumber! !

!OMeta2TreeNodeExample methodsFor: 'as yet unclassified' stamp: 'pb 5/23/2015 15:25'!
left: anObject
	leftTree := anObject! !

!OMeta2TreeNodeExample methodsFor: 'as yet unclassified' stamp: 'pb 5/23/2015 15:25'!
right: anObject
	rightTree := anObject! !

!OMeta2TreeNodeExample methodsFor: 'as yet unclassified' stamp: 'pb 5/23/2015 16:24'!
unapply
	^ {#Node. leftTree unapply. rightTree unapply.}! !
