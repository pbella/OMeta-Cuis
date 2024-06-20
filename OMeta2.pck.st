'From Cuis7.0 [latest update: #6452] on 20 June 2024 at 3:40:09 pm'!
'Description OMeta2 (often referred to just as ''OMeta'') is a PEG-based (Parsing Expression Grammar) Object Oriented pattern matching language.   More simply put, it''s a parser which you can use to write other parsers.  A few of its unique characteristics:

1) It is a parasitic language which is a hybrid of its own OMeta syntax and the host language, in this case Smalltalk.
2) It is written in itself.  There is a preload file (see below) which provides a minimal Smalltalk implementation of OMeta, and then this package is overlaid on it effectively reimplementing OMeta in OMeta.
3) As you can see from 2, it is a dynamic parser which is very compatible with the Smalltalk ethos.  In many cases, you can modify the definition of an existing parser while it is running.
4) While it was originally written to help prototype new programming languages, it can just as easily parse just about anything you can think of from data files to network packets.

Note: OMeta2Preload.st needs to be filed in before loading this package (handled by OMeta2Package class>>prePackageInstall)

This package is based on the original work by Alessandro Warth http://www.tinlizzie.org/ometa/OMeta.sar with updates from OMeta2-Preload-hmm.14.mcz OMeta2-Postload-hmm.12.mcz and modified and extended by Phil Bellalouna for Cuis.

Since the original implementation of OMeta2 has been abandoned by its author, I''ve decided to not retain absolute compatiblity with it.  Mostly this means that I''ve made a few minor extensions to the core language that are (mostly) backwards compatible and fixed some bugs.'!
!provides: 'OMeta2' 2 20!
SystemOrganization addCategory: #OMeta2!
SystemOrganization addCategory: #'OMeta2-Preload'!
SystemOrganization addCategory: #'OMeta2-Extensions'!
SystemOrganization addCategory: #'OMeta2-Examples'!
SystemOrganization addCategory: #'OMeta2-Tests'!


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

!OMeta2Package class methodsFor: 'private-meta-development' stamp: 'pb 4/27/2019 23:48:34'!
isAbstract
	^ thisContext methodClass == self class.! !

!OMeta2Package class methodsFor: 'private-meta-development' stamp: 'MO 3/26/2024 18:24:40'!
prePackageInstall
	(Smalltalk classNamed: 'OMeta2Base') ifNil: [
		"If warnings are enabled they will currently likely overwhelm the transcript"
		Preferences
			at: #warnAboutNonLocalReturnsInExceptionHandlers
			put: false.
		Transcript
			show: 'Loading OMeta2Preload.st';
			finishEntry.
		ChangeSet fileIn: (self package fullFileName asFileEntry parent concatPathComponentsAsFile: 'OMeta2Preload.st' asPathComponents).
		Transcript
			show: 'Finished loading OMeta2Preload.st';
			finishEntry ].! !
OMeta2Package prePackageInstall!
!classDefinition: #OMeta2DebugError category: #'OMeta2-Extensions'!
Error subclass: #OMeta2DebugError
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2-Extensions'!
!classDefinition: 'OMeta2DebugError class' category: #'OMeta2-Extensions'!
OMeta2DebugError class
	instanceVariableNames: ''!

!classDefinition: #OM2Fail category: #'OMeta2-Preload'!
Exception subclass: #OM2Fail
	instanceVariableNames: 'parserFailedAt'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2-Preload'!
!classDefinition: 'OM2Fail class' category: #'OMeta2-Preload'!
OM2Fail class
	instanceVariableNames: ''!

!classDefinition: #OMeta2Compiler category: #'OMeta2-Preload'!
Compiler subclass: #OMeta2Compiler
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2-Preload'!
!classDefinition: 'OMeta2Compiler class' category: #'OMeta2-Preload'!
OMeta2Compiler class
	instanceVariableNames: ''!

!classDefinition: #OMeta2MethodNode category: #'OMeta2-Preload'!
MethodNode subclass: #OMeta2MethodNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2-Preload'!
!classDefinition: 'OMeta2MethodNode class' category: #'OMeta2-Preload'!
OMeta2MethodNode class
	instanceVariableNames: ''!

!classDefinition: #OMeta2DebugTests category: #'OMeta2-Tests'!
TestCase subclass: #OMeta2DebugTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2-Tests'!
!classDefinition: 'OMeta2DebugTests class' category: #'OMeta2-Tests'!
OMeta2DebugTests class
	instanceVariableNames: ''!

!classDefinition: #OMeta2ExampleTests category: #'OMeta2-Tests'!
TestCase subclass: #OMeta2ExampleTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2-Tests'!
!classDefinition: 'OMeta2ExampleTests class' category: #'OMeta2-Tests'!
OMeta2ExampleTests class
	instanceVariableNames: ''!

!classDefinition: #OMeta2StepByStepTests category: #'OMeta2-Tests'!
TestCase subclass: #OMeta2StepByStepTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2-Tests'!
!classDefinition: 'OMeta2StepByStepTests class' category: #'OMeta2-Tests'!
OMeta2StepByStepTests class
	instanceVariableNames: ''!

!classDefinition: #SHTextStylerOMeta2 category: #'OMeta2-Extensions'!
SHTextStyler subclass: #SHTextStylerOMeta2
	instanceVariableNames: 'smalltalkFallbackStyler useSmalltalkStyler'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2-Extensions'!
!classDefinition: 'SHTextStylerOMeta2 class' category: #'OMeta2-Extensions'!
SHTextStylerOMeta2 class
	instanceVariableNames: 'textAttributes'!

!classDefinition: #SHTextStylerOtherOMeta2 category: #'OMeta2-Extensions'!
SHTextStylerOMeta2 subclass: #SHTextStylerOtherOMeta2
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2-Extensions'!
!classDefinition: 'SHTextStylerOtherOMeta2 class' category: #'OMeta2-Extensions'!
SHTextStylerOtherOMeta2 class
	instanceVariableNames: ''!

!classDefinition: #OM2Failer category: #'OMeta2-Preload'!
Object subclass: #OM2Failer
	instanceVariableNames: 'used'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2-Preload'!
!classDefinition: 'OM2Failer class' category: #'OMeta2-Preload'!
OM2Failer class
	instanceVariableNames: ''!

!classDefinition: #OM2Stream category: #'OMeta2-Preload'!
Object subclass: #OM2Stream
	instanceVariableNames: 'head tail memo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2-Preload'!
!classDefinition: 'OM2Stream class' category: #'OMeta2-Preload'!
OM2Stream class
	instanceVariableNames: ''!

!classDefinition: #OM2EndOfStream category: #'OMeta2-Preload'!
OM2Stream subclass: #OM2EndOfStream
	instanceVariableNames: 'stream pos'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2-Preload'!
!classDefinition: 'OM2EndOfStream class' category: #'OMeta2-Preload'!
OM2EndOfStream class
	instanceVariableNames: ''!

!classDefinition: #OM2LazyStream category: #'OMeta2-Preload'!
OM2Stream subclass: #OM2LazyStream
	instanceVariableNames: 'stream pos blockEvaluated'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2-Preload'!
!classDefinition: 'OM2LazyStream class' category: #'OMeta2-Preload'!
OM2LazyStream class
	instanceVariableNames: ''!

!classDefinition: #OM2StreamDebugger category: #'OMeta2-Preload'!
OM2Stream subclass: #OM2StreamDebugger
	instanceVariableNames: 'om2stream'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2-Preload'!
!classDefinition: 'OM2StreamDebugger class' category: #'OMeta2-Preload'!
OM2StreamDebugger class
	instanceVariableNames: ''!

!classDefinition: #OM2StreamProxy category: #'OMeta2-Preload'!
OM2Stream subclass: #OM2StreamProxy
	instanceVariableNames: 'target'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2-Preload'!
!classDefinition: 'OM2StreamProxy class' category: #'OMeta2-Preload'!
OM2StreamProxy class
	instanceVariableNames: ''!

!classDefinition: #OMeta2Base category: #'OMeta2-Preload'!
Object subclass: #OMeta2Base
	instanceVariableNames: 'input om2streams haltingPoint'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2-Preload'!
!classDefinition: 'OMeta2Base class' category: #'OMeta2-Preload'!
OMeta2Base class
	instanceVariableNames: ''!

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

!classDefinition: #OMeta2DebugRuleTranslator category: #'OMeta2-Extensions'!
OMeta2RuleTranslator subclass: #OMeta2DebugRuleTranslator
	instanceVariableNames: 'transLogId transLog tempSequenceId'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2-Extensions'!
!classDefinition: 'OMeta2DebugRuleTranslator class' category: #'OMeta2-Extensions'!
OMeta2DebugRuleTranslator class
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

!classDefinition: #OMeta2Debug category: #'OMeta2-Extensions'!
OMeta2 subclass: #OMeta2Debug
	instanceVariableNames: 'om2ApplyPc om2ApplyWithArgsPc om2DebugRoot om2Eos om2TraceLog om2Trans om2TransId'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2-Extensions'!
!classDefinition: 'OMeta2Debug class' category: #'OMeta2-Extensions'!
OMeta2Debug class
	instanceVariableNames: 'LastMatcher'!

!classDefinition: #OMeta2DebugExample category: #'OMeta2-Examples'!
OMeta2Debug subclass: #OMeta2DebugExample
	instanceVariableNames: 'delimCol delimRow'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2-Examples'!
!classDefinition: 'OMeta2DebugExample class' category: #'OMeta2-Examples'!
OMeta2DebugExample class
	instanceVariableNames: ''!

!classDefinition: #OMeta2ExtendedRuleParser category: #'OMeta2-Extensions'!
OMeta2 subclass: #OMeta2ExtendedRuleParser
	instanceVariableNames: 'ast curNode temps blockLevel'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2-Extensions'!
!classDefinition: 'OMeta2ExtendedRuleParser class' category: #'OMeta2-Extensions'!
OMeta2ExtendedRuleParser class
	instanceVariableNames: ''!

!classDefinition: #OMeta2RuleIntrospection category: #'OMeta2-Extensions'!
OMeta2 subclass: #OMeta2RuleIntrospection
	instanceVariableNames: 'result'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2-Extensions'!
!classDefinition: 'OMeta2RuleIntrospection class' category: #'OMeta2-Extensions'!
OMeta2RuleIntrospection class
	instanceVariableNames: ''!

!classDefinition: #OMeta2CsvExample category: #'OMeta2-Examples'!
OMeta2 subclass: #OMeta2CsvExample
	instanceVariableNames: 'delimRow delimCol curRow rows'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2-Examples'!
!classDefinition: 'OMeta2CsvExample class' category: #'OMeta2-Examples'!
OMeta2CsvExample class
	instanceVariableNames: ''!

!classDefinition: #OMeta2Examples category: #'OMeta2-Examples'!
OMeta2 subclass: #OMeta2Examples
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2-Examples'!
!classDefinition: 'OMeta2Examples class' category: #'OMeta2-Examples'!
OMeta2Examples class
	instanceVariableNames: ''!

!classDefinition: #OMeta2ExamplesCoverage category: #'OMeta2-Examples'!
OMeta2 subclass: #OMeta2ExamplesCoverage
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2-Examples'!
!classDefinition: 'OMeta2ExamplesCoverage class' category: #'OMeta2-Examples'!
OMeta2ExamplesCoverage class
	instanceVariableNames: ''!

!classDefinition: #OMeta2ExtendedSyntaxExamples category: #'OMeta2-Examples'!
OMeta2 subclass: #OMeta2ExtendedSyntaxExamples
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2-Examples'!
!classDefinition: 'OMeta2ExtendedSyntaxExamples class' category: #'OMeta2-Examples'!
OMeta2ExtendedSyntaxExamples class
	instanceVariableNames: ''!

!classDefinition: #OMeta2LambdaCalculusParserExample category: #'OMeta2-Examples'!
OMeta2 subclass: #OMeta2LambdaCalculusParserExample
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2-Examples'!
!classDefinition: 'OMeta2LambdaCalculusParserExample class' category: #'OMeta2-Examples'!
OMeta2LambdaCalculusParserExample class
	instanceVariableNames: ''!

!classDefinition: #OMeta2LispExample category: #'OMeta2-Examples'!
OMeta2 subclass: #OMeta2LispExample
	instanceVariableNames: 'env envStack envStackPointer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2-Examples'!
!classDefinition: 'OMeta2LispExample class' category: #'OMeta2-Examples'!
OMeta2LispExample class
	instanceVariableNames: ''!

!classDefinition: #OMeta2StepByStepExample category: #'OMeta2-Examples'!
OMeta2 subclass: #OMeta2StepByStepExample
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2-Examples'!
!classDefinition: 'OMeta2StepByStepExample class' category: #'OMeta2-Examples'!
OMeta2StepByStepExample class
	instanceVariableNames: ''!

!classDefinition: #OMeta2TreeWalkerExample category: #'OMeta2-Examples'!
OMeta2 subclass: #OMeta2TreeWalkerExample
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2-Examples'!
!classDefinition: 'OMeta2TreeWalkerExample class' category: #'OMeta2-Examples'!
OMeta2TreeWalkerExample class
	instanceVariableNames: ''!

!classDefinition: #SyntaxTreeNode category: #'OMeta2-Extensions'!
Object subclass: #SyntaxTreeNode
	instanceVariableNames: 'node properties children'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2-Extensions'!
!classDefinition: 'SyntaxTreeNode class' category: #'OMeta2-Extensions'!
SyntaxTreeNode class
	instanceVariableNames: ''!

!classDefinition: #OMeta2TreeExample category: #'OMeta2-Examples'!
Object subclass: #OMeta2TreeExample
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2-Examples'!
!classDefinition: 'OMeta2TreeExample class' category: #'OMeta2-Examples'!
OMeta2TreeExample class
	instanceVariableNames: ''!

!classDefinition: #OMeta2TreeEmptyExample category: #'OMeta2-Examples'!
OMeta2TreeExample subclass: #OMeta2TreeEmptyExample
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2-Examples'!
!classDefinition: 'OMeta2TreeEmptyExample class' category: #'OMeta2-Examples'!
OMeta2TreeEmptyExample class
	instanceVariableNames: ''!

!classDefinition: #OMeta2TreeLeafExample category: #'OMeta2-Examples'!
OMeta2TreeExample subclass: #OMeta2TreeLeafExample
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2-Examples'!
!classDefinition: 'OMeta2TreeLeafExample class' category: #'OMeta2-Examples'!
OMeta2TreeLeafExample class
	instanceVariableNames: ''!

!classDefinition: #OMeta2TreeNodeExample category: #'OMeta2-Examples'!
OMeta2TreeExample subclass: #OMeta2TreeNodeExample
	instanceVariableNames: 'leftTree rightTree'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2-Examples'!
!classDefinition: 'OMeta2TreeNodeExample class' category: #'OMeta2-Examples'!
OMeta2TreeNodeExample class
	instanceVariableNames: ''!


!OMeta2DebugError commentStamp: '<historical>' prior: 0!
This is so we can determine debug vs. regular OMeta runtime errors!

!OM2Fail commentStamp: '<historical>' prior: 0!
I represent a match failure.  Try using #matchAll:with:ifFail: rather than handling me directly.!

!OMeta2Compiler commentStamp: '<historical>' prior: 0!
I provide the interface that the Smalltalk environment expects.  In turn, I call out to various OMeta parsers that actually perform the compilation.

I use the indirection provided by OMeta2 class methods to allow for overriding of various functionality and make things a bit easier when trying out new extensions and optimization ideas for OMeta.!

!OMeta2MethodNode commentStamp: '<historical>' prior: 0!
I exist so that OMeta methods can be viewed in the code browsers.!

!OMeta2StepByStepTests commentStamp: '<historical>' prior: 0!
This class is intended both to be a test of core OMeta functionality as well as a step by step tutorial of sorts demonstrating every aspect of OMeta that you can use in your grammars.  If you go through the tests in sequence, it should all make sense when you are done.

Everything used in these tests should be considered part of the supported language/API.!

!SHTextStylerOMeta2 commentStamp: '<historical>' prior: 0!
Styler for OMeta2-based code (which can include Smalltalk)!

!SHTextStylerOtherOMeta2 commentStamp: '<historical>' prior: 0!
Styler for 'other' OMeta2-based code (which doesn't necessarily use OMeta or Smalltalk syntax).  Since this can be arbitrary code, it doesn't attempt to parse it: it bolds the first line and displays the rest as normal text.

FIXME - when in prettyPrint mode should use a fallback Smalltalk styler (so actually we want to use the fallback parser as the primary (can't it doesn't error... so we use the OMeta parser which also handles Smalltalk... FIXME: hack) and if it fails, do it another way)!

!OM2Failer commentStamp: '<historical>' prior: 0!
I am used to capture left recursion failures.  Do not use me directly, I am an implementation detail.!

!OM2Stream commentStamp: '<historical>' prior: 0!
I, and my subclasses, are specialized pseudo-streams used by OMeta parsers.  We are implementation details... do not instantiate us.!

!OMeta2Base commentStamp: '<historical>' prior: 0!
I provide the core language/library runtime support for OMeta that cannot be rewritten as OMeta code.!

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

!OMeta2Debug commentStamp: '<historical>' prior: 0!
This is a debugging and profiling version of OMeta2.  It trades quite a bit of performance to try to detect and report known runtime errors and collect detailed statistics.  This is often worthwhile when initially designing and debugging a parser.

To use, simply set this class as your parser's parent class.  Once you're happy with how the parser is operating, feel free to change your parser's parent class back to OMeta2 to eliminate the runtime overhead.

todo: infinite recursion detection

FIXME - due to inlining, need to move apply overrides to a subclass of OMeta2Translator!

!OMeta2DebugExample commentStamp: '<historical>' prior: 0!
Examples of the kinds of issues OMeta2Debug should catch!

!OMeta2ExtendedRuleParser commentStamp: '<historical>' prior: 0!
This is a more full-featured OMeta parser that renders to a labelled syntax tree.  While significantly larger than the default parser, it will allow for much more flexibility.

Open issues:
- should I even be trying to re-use Smalltalk themes?  There is no clean mapping so even if we do it, using other themes may look unacceptably bad.
- need to finalize approach: extend existing ast or go with a more annotated version?!

!OMeta2RuleIntrospection commentStamp: '<historical>' prior: 0!
Utility rules to ask questions about rules.  While these rules aren't directly used compiling OMeta2 code into Smalltalk, they help with some core functionality.  All of these rules expect to match a parsed rule AST.

Note: these rules all assume that you are using OMeta in the 'normal' way via OMeta source code.  If you are directly invoking rules via Smalltalk blocks etc., these rules will not see that.!

!OMeta2CsvExample commentStamp: '<historical>' prior: 0!
This is a trivial CSV importer.  Just to make it a bit more interesting, the column and row delimiters are variables so this could easily be adapted to other delimiters either by subclassing or by parameterizing the csv rule.

To run this example:

OMeta2CsvExample demo!

!OMeta2Examples commentStamp: '<historical>' prior: 0!
Here's how to run these examples:

	OMeta2Examples match: 5 with: #fact.
	OMeta2Examples matchAll: '1234' with: #number.
	OMeta2Examples matchAll: 'abc123' with: #identifier.
	OMeta2Examples matchAll: #($a $b $c 1 2 3 #(4 5)) with: #structure.
	OMeta2Examples matchAll: 'howdy' with: #greeting.!

!OMeta2ExamplesCoverage commentStamp: '<historical>' prior: 0!
Needed for test coverage!

!OMeta2ExtendedSyntaxExamples commentStamp: '<historical>' prior: 0!
Several enhancements have been made to OMeta syntax.  These rules provide a quick comparison of the old (legacy*) and the new (extended*) ways of doing things.  For functionality that is additive (i.e. has no corresponding legacy implementation), the rule names will be in the form of new*.!

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
This grammar will be the kitchen sink: exercise every aspect of OMeta syntax.  In addition, it should also be a good starting point to learn all about OMeta syntax.  After you've played around with some of the other examples, look at OMeta2StepByStepTests tests for usage examples.

WIP / todo core syntax including: lookahead, grouping, form, foreign rules.  Also many remaining predefined rules (i.e. listOf, range, etc.)!

!OMeta2TreeWalkerExample commentStamp: '<historical>' prior: 0!
See OMeta2TreeExample!

!SyntaxTreeNode commentStamp: '<historical>' prior: 0!
A simple, generic syntax tree node which can be used for both concrete and abstract trees.!

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

!OM2Fail methodsFor: 'exceptionDescription' stamp: 'aw 2/26/2009 11:03'!
defaultAction

	self error: 'match failed'! !

!OM2Fail methodsFor: 'accessing' stamp: 'pb 9/5/2017 13:01'!
parserFailedAt
	^ parserFailedAt.! !

!OM2Fail methodsFor: 'private' stamp: 'pb 9/5/2017 13:01'!
privateParserFailedAt: pos
	parserFailedAt := pos.! !

!OM2Fail class methodsFor: 'exceptionInstantiator' stamp: 'pb 9/5/2017 13:01'!
parserFailedAt: positionInStream
	^ self new
		privateParserFailedAt: positionInStream;
		signal.! !

!OMeta2Compiler methodsFor: 'private-ometa2preload' stamp: 'aw 2/18/2009 16:30'!
compile: origCode in: cls classified: aCategory notifying: notify ifFail: failBlock

	^ self compile: origCode in: cls notifying: notify ifFail: failBlock! !

!OMeta2Compiler methodsFor: 'private-ometa2preload' stamp: 'MO 3/26/2024 18:12:06'!
compile: origCode in: cls classified: aCategory notifying: notify ifFail: failBlock optimizeSpecialSends: doOptimizeSpecialSends

	| origCodeStream parseTree structuredCode translatedCode compilerStage|
	origCodeStream := origCode asString readStream.
	self from: origCodeStream class: cls context: nil notifying: notify.
	[
		compilerStage := 'Parsing'.
		parseTree := cls ometa2RuleParserClass matchStream: origCodeStream with: #rule withArgs: #() withPlaybackDebugging: false.
		compilerStage := 'Optimizing'.
		parseTree := cls ometa2OptimizerClass optimizeOMetaAst: parseTree.
		compilerStage := 'Translating'.
		structuredCode := cls ometa2RuleTranslatorClass match: parseTree with: #translate withArgs: {cls}.
		compilerStage := 'Flattening'.
		translatedCode := cls ometa2FlattenerClass match: structuredCode with: #flatten
	] on: OM2Fail do: [
		self notify: '<-- parse error around here -->' at: origCodeStream position.
		^ failBlock value
	].
	^ Compiler new
		compile: translatedCode readStream
		in: cls
		classified: aCategory
		notifying: notify
		ifFail: failBlock
		optimizeSpecialSends: doOptimizeSpecialSends! !

!OMeta2Compiler methodsFor: 'private-ometa2preload' stamp: 'pb 4/27/2020 22:00'!
compile: origCode in: cls notifying: notify ifFail: failBlock

	| origCodeStream parseTree structuredCode translatedCode compilerStage|
	origCodeStream := origCode asString readStream.
	self from: origCodeStream class: cls context: nil notifying: notify.
	[
		compilerStage := 'Parsing'.
		parseTree := cls ometa2RuleParserClass matchStream: origCodeStream with: #rule withArgs: #() withPlaybackDebugging: false.
		compilerStage := 'Optimizing'.
		parseTree := cls ometa2OptimizerClass optimizeOMetaAst: parseTree.
		compilerStage := 'Translating'.
		structuredCode := cls ometa2RuleTranslatorClass match: parseTree with: #translate withArgs: {cls}.
		compilerStage := 'Flattening'.
		translatedCode := cls ometa2FlattenerClass match: structuredCode with: #flatten
	] on: OM2Fail do: [
		self notify: '<-- parse error around here -->' at: origCodeStream position.
		^ failBlock value
	].
	^ Compiler new
		compile: translatedCode readStream
		in: cls
		notifying: notify
		ifFail: failBlock! !

!OMeta2Compiler methodsFor: 'private-ometa2preload' stamp: 'MO 3/26/2024 18:11:21'!
parse: aStream class: aClass category: aCategory noPattern: noPattern doIt: doIt context: ctxt notifying: req ifFail: aBlock

	^ [
		| parseTree structuredCode code node compilerStage|
		compilerStage := 'Parsing'.
		parseTree := aClass ometa2RuleParserClass matchAll: aStream contents with: #rule.
		compilerStage := 'Optimizing'.
		parseTree := aClass ometa2OptimizerClass optimizeOMetaAst: parseTree.
		compilerStage := 'Translating'.
		structuredCode := aClass ometa2RuleTranslatorClass match: parseTree with: #translate withArgs: {aClass}.
		compilerStage := 'Flattening'.
		code := aClass ometa2FlattenerClass match: structuredCode with: #flatten.
		node := Parser new 
		parse: code readStream 
		class: aClass 
		category: aCategory
		noPattern: noPattern 
		doIt: doIt
		context: ctxt 
		notifying: req 
		ifFail: aBlock.
		OMeta2MethodNode adoptInstance: node.
		node
	] on: OM2Fail do: [aBlock value]! !

!OMeta2Compiler methodsFor: 'private-ometa2preload' stamp: 'pb 4/27/2020 22:00'!
parse: aStream class: aClass noPattern: noPattern context: ctxt notifying: req ifFail: aBlock

	^ [
		| parseTree structuredCode code node compilerStage|
		compilerStage := 'Parsing'.
		parseTree := aClass ometa2RuleParserClass matchAll: aStream contents with: #rule.
		compilerStage := 'Optimizing'.
		parseTree := aClass ometa2OptimizerClass optimizeOMetaAst: parseTree.
		compilerStage := 'Translating'.
		structuredCode := aClass ometa2RuleTranslatorClass match: parseTree with: #translate withArgs: {aClass}.
		compilerStage := 'Flattening'.
		code := aClass ometa2FlattenerClass match: structuredCode with: #flatten.
		node := Parser new parse: code readStream class: aClass noPattern: noPattern context: ctxt notifying: req ifFail: aBlock.
		OMeta2MethodNode adoptInstance: node.
		node
	] on: OM2Fail do: [aBlock value]! !

!OMeta2Compiler methodsFor: 'private-ometa2preload' stamp: 'hmm 5/24/2010 10:51'!
parser
        ^ self parserClass new! !

!OMeta2Compiler methodsFor: 'private-ometa2preload' stamp: 'aw 2/27/2009 13:10'!
parserClass

	^ self class! !

!OMeta2MethodNode methodsFor: 'debugger support' stamp: 'hmm 8/25/2012 14:28'!
schematicTempNamesString
        "The decompiler wants a list of temp names. However, this mechanism depends on a number of assumptions that do not hold with OMeta2 generated methods. Therefore we simply skip the temp names, letting the decompiler build generic ones.

This fixes an error when attempting to prettyPrint OMeta source code. (prettyPrint reveals the actual Smalltalk code generated by OMeta)"
        ^nil! !

!OMeta2DebugTests methodsFor: 'test case' stamp: 'pb 6/20/2016 22:23'!
testForm
	"Verify that debug tracing logic doesn't interfere with form operation"
	self should: (OMeta2DebugExample debugMatch: #('testing') with: #debugForm) = #('testing')
! !

!OMeta2DebugTests methodsFor: 'test case' stamp: 'pb 5/2/2020 14:30:20'!
testInfiniteRecursion
	self flag: #FIXME. "Also need to handle case where not eos but input not advancing"
	self should: [OMeta2DebugExample match: 'does not matter what goes here' with: #infiniteRecursion] raise: OMeta2DebugError "Infinite recursion detected".
! !

!OMeta2DebugTests methodsFor: 'test case' stamp: 'pb 6/12/2015 14:59'!
testNotASequence
	self should: [OMeta2DebugExample match: 'does not matter what goes here' with: #notASequence] raise: OMeta2DebugError "Not a sequence: a".
! !

!OMeta2ExampleTests methodsFor: 'test case' stamp: 'pb 5/20/2020 00:08:12'!
testAllLowercase
	self should:
		(OMeta2ExamplesCoverage
			matchAll: 'lower'
			with: #allLowercase).
	self shouldFail: [
		OMeta2ExamplesCoverage
			matchAll: 'Lower'
			with: #allLowercase ].! !

!OMeta2ExampleTests methodsFor: 'test case' stamp: 'pb 5/20/2020 00:08:12'!
testAllUppercase
	self should:
		(OMeta2ExamplesCoverage
			matchAll: 'UPPER'
			with: #allUppercase).
	self shouldFail: [
		OMeta2ExamplesCoverage
			matchAll: 'Upper'
			with: #allUppercase ].! !

!OMeta2ExampleTests methodsFor: 'test case' stamp: 'pb 5/26/2015 03:43'!
testFactorial
	self should: (OMeta2Examples match: 0 with: #fact) = 1.
	self should: (OMeta2Examples match: 5 with: #fact) = 120.
	self should: (OMeta2Examples match: 10 with: #fact) = 3628800.! !

!OMeta2ExampleTests methodsFor: 'test case' stamp: 'pb 5/22/2015 16:54'!
testGreeting
	self should: (OMeta2Examples matchAll: 'howdy' with: #greeting) = 'howdy'! !

!OMeta2ExampleTests methodsFor: 'test case' stamp: 'pb 5/9/2020 04:40:53'!
testIdentifierIndex
	"rangeAssoc"
	self
		assert: 1 -> 9
		equals:
			(OMeta2Examples
				matchAll: 'abc123sd'
				with: #identifierIdx).! !

!OMeta2ExampleTests methodsFor: 'test case' stamp: 'pb 5/23/2015 22:01'!
testLambdaCalculus
	self should: (OMeta2LambdaCalculusParserExample matchAll: '4' with: #digit) = 4.
	self should: (OMeta2LambdaCalculusParserExample matchAll: 'x and y' with: #root) =   #(#('and' #('name' #x) #('name' #y))).
	self should: (OMeta2LambdaCalculusParserExample matchAll: 'x and y;x*y' with: #root) =   #(#('and' #('name' #x) #('name' #y)) #('mul' #('name' #x) #('name' #y)))! !

!OMeta2ExampleTests methodsFor: 'test case' stamp: 'pb 5/24/2019 19:12:10'!
testLisp
	| lispClass |
	lispClass := OMeta2LispExample.
	"*** ev rule tests..."
	"string"
	self should: (lispClass eval: #t).
	self should: (lispClass eval: #z) = nil.
	"lambda... under app rule tests"
	"quote"
	self should: (lispClass eval: #(#quote 1 )) = 1.
	self should: (lispClass eval: #(
				#quote
				#(1 2 3 )
			)) = #(1 2 3 ).
	"cond"
	self should: (lispClass eval: #(#cond nil )) = nil.
	self should: (lispClass eval: #(
				#cond
				#(#(#eq #(#quote #a) #(#quote #b)) #(#quote #optiona) )
				#(#(#eq #(#quote #b) #(#quote #b)) #(#quote #optionb) )
				#(#t #(#quote #invalid) )
			)) = #optionb.
	self should: (lispClass eval: #(
				#cond
				#(#(#eq #(#quote #a) #(#quote #b)) #(#quote #optiona) )
				#(#(#eq #(#quote #b) #(#quote 3)) #(#quote #optionb) )
				#(#t #(#quote #invalid) )
			)) = #invalid.
	"*** app rule tests..."
	"car"
	self should: (lispClass eval: #(
				#car
				#(#quote #(1 2 3) )
			)) = 1.
	"cdr"
	self flag: #fixTest.
	"Should this be an OC?"
	"self should: (lispClass eval: #(cdr (quote (1 2 3)))) = #(2 3)."
	self should:
		(lispClass eval: #(
				#cdr
				#(#quote #(1 2 3) )
			)) =
			(OrderedCollection new
				add: 2;
				add: 3;
				yourself).
	"cons"
	self should: (lispClass eval: #(
				#cons
				#(#quote #a )
				#(#quote #b )
			)) = #(#a #b ).
	"atom"
	self should: (lispClass eval: #(
				#atom
				#(#quote #a )
			)).
	self should: (lispClass eval: #(
				#atom
				#(#cons #(#quote #a) #(#quote #b) )
			)) not.
	"eq"
	"a and b are both nil so eq should always return true (in a real Lisp environment, this would result in an error)"
	self should: (lispClass eval: #(#eq #a #a )).
	self should: (lispClass eval: #(#eq #a #b )).
	"when quoted, you get the results you were probably expecting"
	self should: (lispClass eval: #(
				#eq
				#(#quote #a )
				#(#quote #a )
			)).
	self should: (lispClass eval: #(
				#eq
				#(#quote #a )
				#(#quote #b )
			)) not.
	"lambda"
	self should: (lispClass eval: #(
				#(#lambda #(#x) #(#cons #x #x) )
				#(#quote #boo )
			)) = #(#boo #boo ).
	"*** more complex and multiple expressions"
	self should: (lispClass evalAll: #(
				#(#eq #(#quote #a) #(#quote #b) )
				#(#cons #(#quote #x) #(#quote #y) )
			)) = #(#x #y ).
	self should: (lispClass evalAll: #(
				#(#cons #(#eq #(#quote #a) #(#quote #b)) #(#cons #(#quote #x) #(#quote #y)) )
			)) = #(
				false
				#(#x #y )
			).
	self should: (lispClass evalAll: #(
				#(#(#lambda #(#x) #(#cons #x #x)) #(#quote #boo) )
				#(#eq #a #b )
			)).
	self should: (lispClass evalAll: #(
				#(#cons #(#(#lambda #(#x) #(#cons #x #x)) #(#quote #boo)) #(#eq #x #(#quote #boo)) )
			)) = #(
				#(#boo #boo )
				false
			).
	self should: (lispClass eval: #(
				#(#lambda #(#x) #(#cond #(#(#eq #(#quote #a) #x) #(#quote #optiona)) #(#(#eq #(#quote #b) #x) #(#quote #optionb)) #(#t #(#quote #invalid))) )
				#(#quote #a )
			)) = #optiona.
	self should: (lispClass eval: #(
				#(#lambda #(#x) #(#cond #(#(#eq #(#quote #a) #x) #(#quote #optiona)) #(#(#eq #(#quote #b) #x) #(#quote #optionb)) #(#t #(#quote #invalid))) )
				#(#quote #b )
			)) = #optionb.
	self should: (lispClass eval: #(
				#(#lambda #(#x) #(#cond #(#(#eq #(#quote #a) #x) #(#quote #optiona)) #(#(#eq #(#quote #b) #x) #(#quote #optionb)) #(#t #(#quote #invalid))) )
				#(#quote #c )
			)) = #invalid.! !

!OMeta2ExampleTests methodsFor: 'test case' stamp: 'pb 5/20/2020 00:30:59'!
testNotLastNumber
	self should:
		(OMeta2ExamplesCoverage
			matchAll:
				{1. 1. 'ok'}
			with: #notLastNumber).
	self shouldFail: [
		OMeta2ExamplesCoverage
			matchAll:
				{1. 'bad'. 'ok'}
			with: #notLastNumber ].! !

!OMeta2ExampleTests methodsFor: 'test case' stamp: 'pb 5/20/2020 00:35:52'!
testNotLastUppercase
	self should:
		(OMeta2ExamplesCoverage
			matchAll: 'CAps'
			with: #notLastUppercase).
	self shouldFail: [
		OMeta2ExamplesCoverage
			matchAll: 'Caps'
			with: #notLastUppercase ].! !

!OMeta2ExampleTests methodsFor: 'test case' stamp: 'pb 5/26/2015 03:34'!
testNumber
	self should: (OMeta2Examples matchAll: '1234' with: #number) = 1234.
	self should: [OMeta2Examples match: '1234' with: #number] raise: OM2Fail.
! !

!OMeta2ExampleTests methodsFor: 'test case' stamp: 'pb 5/22/2015 16:53'!
testObjectStructure
	self should: (OMeta2Examples matchAll: #($a $b $c 1 2 3 #(4 5)) with: #structure) = #(4 5)
! !

!OMeta2ExampleTests methodsFor: 'test case' stamp: 'pb 5/20/2020 00:08:12'!
testRangeFromTo
	self should:
		(OMeta2ExamplesCoverage
			match: $c
			with: #rangeFromTo
			withArgs:
				{$a. $f}) = $c.
	self shouldFail: [
		OMeta2ExamplesCoverage
			match: $g
			with: #rangeFromTo
			withArgs:
				{$a. $f} ].
	self should:
		(OMeta2ExamplesCoverage
			match: 20
			with: #rangeFromTo
			withArgs:
				{10. 100}) = 20.! !

!OMeta2ExampleTests methodsFor: 'test case' stamp: 'pb 5/22/2015 16:52'!
testStringMatch
	self should: (OMeta2Examples matchAll: 'abc123' with: #identifier) = 'abc123'
! !

!OMeta2ExampleTests methodsFor: 'test case' stamp: 'pb 5/23/2015 16:22'!
testTree
	| tree |
	tree := OMeta2TreeExample demoTree.
	self should:  tree unapply = #(#Node #(#Node #(#Leaf 3) #(#Node #(#Leaf 1) #(#Node #(#Leaf 1) #(#Leaf 1)))) #(#Node #(#Leaf 5) #(#Empty))).
	self should: tree depth = 5.
	self should: tree sum = 11.! !

!OMeta2StepByStepTests methodsFor: 'test case' stamp: 'pb 6/9/2015 22:36'!
test00Anything
	"Understanding how OMeta views input is critical.  To OMeta, the input stream is just one or more objects."

	"Will literally match anything (i.e. an identity match)"
	self should: (OMeta2StepByStepExample match: nil with: #testAnything) = nil.
	self should: (OMeta2StepByStepExample match: $a with: #testAnything) = $a.
	self should: (OMeta2StepByStepExample match: '' with: #testAnything) = ''.
	self should: (OMeta2StepByStepExample match: 'aaa' with: #testAnything) = 'aaa'.
	self should: (OMeta2StepByStepExample match: 3 with: #testAnything) = 3.
	self should: (OMeta2StepByStepExample match: Dictionary with: #testAnything) = Dictionary. "you can pass in objects of any type, including classes"
	self should: (OMeta2StepByStepExample match: #($a 'b' (1 2 3) nil) with: #testAnything) = #($a 'b' (1 2 3) nil). "in this case, the array is treated as a single object to be matched"

	"If you have many anythings, we can match those too"
	self should: (OMeta2StepByStepExample matchAll: #($a 'b' (1 2 3) nil) with: #testManyAnything) = (OrderedCollection new add: $a; add: 'b'; add: #(1 2 3); add: nil; yourself). "in this case, the array is treated as a collection of objects to be matched"
	self should: (OMeta2StepByStepExample matchAll: 'aaa' with: #testManyAnything) = (OrderedCollection new add: $a; add: $a; add: $a; yourself) "a string is just a collection of characters.  this will be hit on a couple of more times... it's important!!"! !

!OMeta2StepByStepTests methodsFor: 'test case' stamp: 'pb 5/2/2020 14:30:39'!
test01Character
	| emptyOC aOC aaaaaOC |
	"FIXME - need to cover letter, digit, etc."
	"covers the use of literals as well as * and + operators with character matches"
	emptyOC := OrderedCollection new.
	aOC := (OrderedCollection new add: $a; yourself).
	aaaaaOC := OrderedCollection new add: $a; add: $a; add: $a; add: $a; add: $a; yourself.

	"Note that #matchAll: expects strings for arity matches since 'string' is just a sequence of characters while #match: expects a single character"
	self should: (OMeta2StepByStepExample match: $a with: #testLiteralChar) = $a.
	self should: (OMeta2StepByStepExample matchAll: 'a' with: #testLiteralChar) = $a.
	self should: (OMeta2StepByStepExample matchAll: '' with: #testManyChar) = emptyOC. "Note that this works since * allows 0 matches"
	self should: (OMeta2StepByStepExample matchAll: 'aaaaa' with: #testManyChar) = aaaaaOC.
	self should: (OMeta2StepByStepExample matchAll: 'aaaaa' with: #testMany1Char) = aaaaaOC.
	self should: (OMeta2StepByStepExample matchAll: 'a' with: #testMany1Char) = aOC. "#test04ConsumedBy  shows you one way to get strings back"! !

!OMeta2StepByStepTests methodsFor: 'test case' stamp: 'pb 6/9/2015 22:37'!
test02String
	| abcOC abcabcOC |
	"covers the use of literals, *, +, ? and tokens with string matches"
	abcOC := (OrderedCollection new add: 'abc'; yourself).
	abcabcOC := OrderedCollection new add: 'abc'; add: 'abc'; yourself.

	"Note that #matchAll: expects collections of strings for arity matches since 'string' is a single string object while #match: expects a single string"
	self should: (OMeta2StepByStepExample match: 'abc' with: #testLiteralString) = 'abc'.
	self should: (OMeta2StepByStepExample matchAll: #('abc' ) with: #testLiteralString) = 'abc'.
	self should: (OMeta2StepByStepExample matchAll: #('abc' 'abc' ) with: #testManyString) = abcabcOC.
	self should: (OMeta2StepByStepExample matchAll: #('abc' 'abc' ) with: #testMany1String) = abcabcOC.
	self should: (OMeta2StepByStepExample matchAll: #('abc' ) with: #testMany1String) = abcOC.
	self should: (OMeta2StepByStepExample matchAll: 'abc' with: #testOpt) = 'abc'.
	self should: (OMeta2StepByStepExample matchAll: '' with: #testOpt) = nil.

	"Tokens are strings that ignore leading spaces.  You could override the definition of #spaces to include other types of whitespace if you want for your grammar."
	self should: (OMeta2StepByStepExample matchAll: '   item      item' with: #testToken) = 'item'.! !

!OMeta2StepByStepTests methodsFor: 'test case' stamp: 'pb 6/9/2015 22:37'!
test03Sequence
	"Sequences (i.e. ordered collections) of objects"
	self should: (OMeta2StepByStepExample matchAll: 'itemitem' with: #testSeqString) = 'item'.
	self should: (OMeta2StepByStepExample matchAll: #($i $t $e $m $i $t $e $m) with: #testSeqString) = 'item'. "sequences of characters are strings as far as seq is concerned"
	self should: (OMeta2StepByStepExample matchAll: #(1 2 3) with: #testSeqObject) = #(1 2 3). "not just for strings though"! !

!OMeta2StepByStepTests methodsFor: 'test case' stamp: 'pb 5/9/2020 04:41:21'!
test04ConsumedBy
	"rangeAssoc"
	"pvtOMetaConsumedBy <> and pvtOMetaIndexConsumedBy @<>"
	"Returns the input 'consumed' by the rule.  Now we don't have to deal with a collection of characters"
	self
		assert: 'feed me'
		equals:
			(OMeta2StepByStepExample
				matchAll: 'feed me'
				with: #testConsumedBy).
	"this returns the positional index range of the beginning and end of the match"
	self
		assert: 1 -> 8
		equals:
			(OMeta2StepByStepExample
				matchAll: 'feed me'
				with: #testConsumedByIndex).! !

!OMeta2StepByStepTests methodsFor: 'test case' stamp: 'pb 5/9/2019 23:22:07'!
test05PredicateAction
	self should:
		(OMeta2StepByStepExample
			matchAll: 'testing'
			with: #testSemanticPredicate).
	"notice that the predicate, being the last expression in the rule, again overrides the default return value.  This rule also introduces the assignment operator."
	self should:
		(OMeta2StepByStepExample
			matchAll: 'testing'
			with: #testSemanticAction) = 'got it!!'.! !

!OMeta2StepByStepTests methodsFor: 'test case' stamp: 'pb 6/9/2015 22:58'!
test06PrioritizedChoice
	self should: (OMeta2StepByStepExample matchAll: 'testing' with: #testPrioritizedChoice) = 'got it!!'. "prioritized choice to the rescue!!"
	self should: (OMeta2StepByStepExample matchAll: 'not' with: #testPrioritizedChoice) = 'not'.
! !

!OMeta2StepByStepTests methodsFor: 'test case' stamp: 'pb 5/2/2020 14:30:49'!
test07Lookahead
	"FIXME - todo & operator"
	self should: (OMeta2StepByStepExample matchAll: '''not a double quote''' with: #testLookaheadNot) = #($' $n $o $t $  $a $  $d $o $u $b $l $e $  $q $u $o $t $e $') asOrderedCollection. "we get a sequence of characters back because this rule matches character by character."! !

!OMeta2StepByStepTests methodsFor: 'test case' stamp: 'pb 6/10/2015 14:36'!
test08RuleParameters
	self should: (OMeta2StepByStepExample matchAll: 'looking for test text' with: #testRuleParameters) = 'looking for test text'! !

!OMeta2StepByStepTests methodsFor: 'test case' stamp: 'pb 6/10/2015 15:00'!
test10FromTo
	self should: (OMeta2StepByStepExample matchAll: '/* finding */ the test text...' with: #testFromTo) = #($f $i $n $d $i $n $g $  $t $e $x $t $. $. $.) asOrderedCollection! !

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

!SHTextStylerOMeta2 methodsFor: 'private' stamp: 'MO 3/26/2024 18:31:14'!
privateAutoHighlight! !

!SHTextStylerOMeta2 methodsFor: 'private' stamp: 'MO 3/26/2024 18:31:40'!
privateConvertAssignmentsOffset: delta! !

!SHTextStylerOMeta2 methodsFor: 'private' stamp: 'pb 6/17/2015 00:31'!
privateFormatAndConvert! !

!SHTextStylerOMeta2 methodsFor: 'private' stamp: 'MO 3/27/2024 20:50:37'!
privateStyle
	| ranges |
	ranges := self pvtExtractRangesFromSource.
	ranges ifNil: [
		ranges := SHParserST80 new
		classOrMetaClass: Object;
		source: (textModel actualContents asString);
		parse;
		ranges
				].
	ranges ifNotNil: [
		[
		self
			setAttributesIn: formattedText
			fromRanges: ranges
			in: nil
		] on: Error do: []. 
			].! !

!SHTextStylerOMeta2 methodsFor: 'private' stamp: 'MO 3/26/2024 18:44:54'!
pvtExtractRangesFromSource
	useSmalltalkStyler := true.
	"self halt."
	^ formattedText ifNotNil: [
		(self class rangeParserClass extractRangesFromSmalltalkSourceCode: formattedText) ifNotNil: [ :useRanges |
			useSmalltalkStyler := false.
			useRanges ]] ifNil: [nil].! !

!SHTextStylerOMeta2 methodsFor: 'private' stamp: 'MO 3/26/2024 18:32:31'!
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
	newRuns := OrderedCollection new.
	newValues := OrderedCollection new.
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

!SHTextStylerOMeta2 methodsFor: 'styling' stamp: 'MO 3/26/2024 18:30:37'!
getReady! !

!SHTextStylerOMeta2 methodsFor: 'styling' stamp: 'MO 3/26/2024 18:30:56'!
parseText! !

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

!OM2Failer methodsFor: 'initialization' stamp: 'aw 2/16/2009 14:23'!
initialize

	used := false! !

!OM2Failer methodsFor: 'initialization' stamp: 'aw 2/27/2009 13:44'!
used

	^ used! !

!OM2Failer methodsFor: 'evaluating' stamp: 'aw 2/27/2009 13:42'!
value

	used := true.
	OM2Fail signal! !

!OM2Stream methodsFor: 'private-ometa2preload' stamp: 'aw 2/26/2009 11:04'!
basicTail

	^ tail! !

!OM2Stream methodsFor: 'private-ometa2preload' stamp: 'aw 2/16/2009 11:35'!
head

	^ head! !

!OM2Stream methodsFor: 'private-ometa2preload' stamp: 'aw 2/16/2009 13:38'!
initHead: h tail: t

	head := h.
	tail := t! !

!OM2Stream methodsFor: 'private-ometa2preload' stamp: 'aw 2/19/2009 23:13'!
inputSpecies

	^ Array! !

!OM2Stream methodsFor: 'private-ometa2preload' stamp: 'aw 2/16/2009 14:13'!
memo

	^ memo! !

!OM2Stream methodsFor: 'private-ometa2preload' stamp: 'pb 4/25/2020 01:00'!
ometaForgetEverything

	memo := IdentityDictionary new! !

!OM2Stream methodsFor: 'private-ometa2preload' stamp: 'pb 4/25/2020 01:00'!
ometaPositionInStream

	^ -1! !

!OM2Stream methodsFor: 'private-ometa2preload' stamp: 'aw 2/16/2009 11:35'!
tail

	^ tail! !

!OM2Stream methodsFor: 'private-ometa2preload' stamp: 'aw 2/26/2009 11:40'!
transitiveForgetEverything

	| curr |
	curr := self.
	[curr notNil] whileTrue: [
		curr ometaForgetEverything.
		curr := curr basicTail
	]! !

!OM2Stream methodsFor: 'initialization' stamp: 'aw 2/16/2009 11:34'!
initialize

	memo := IdentityDictionary new! !

!OM2Stream methodsFor: 'printing' stamp: 'aw 2/26/2009 11:05'!
printOn: aStream

	| inputIsString curr |
	inputIsString := (self inputSpecies inheritsFrom: String) and: [(self inputSpecies inheritsFrom: Symbol) not].
	curr := self.
	aStream
		nextPutAll: 'an ';
		nextPutAll: self class name;
		nextPut: $(.
	[curr notNil] whileTrue: [
		(curr isKindOf: OM2EndOfStream) ifTrue: [
			aStream nextPut: $).
			^ self
		].
		inputIsString
			ifTrue: [aStream nextPut: curr head]
			ifFalse: [
				curr head printOn: aStream.
				aStream space
			].
		curr := curr basicTail.
	].
	aStream nextPutAll: '...)'! !

!OM2EndOfStream methodsFor: 'private-ometa2preload' stamp: 'aw 2/25/2009 11:29'!
head

	OM2Fail signal! !

!OM2EndOfStream methodsFor: 'private-ometa2preload' stamp: 'aw 2/20/2009 14:50'!
initStream: s pos: p

	stream := s.
	pos := p! !

!OM2EndOfStream methodsFor: 'private-ometa2preload' stamp: 'aw 2/19/2009 23:14'!
inputSpecies

	^ stream originalContents species! !

!OM2EndOfStream methodsFor: 'private-ometa2preload' stamp: 'pb 4/25/2020 01:00'!
ometaPositionInStream

	^ pos! !

!OM2EndOfStream methodsFor: 'private-ometa2preload' stamp: 'aw 2/25/2009 11:29'!
tail

	OM2Fail signal! !

!OM2LazyStream methodsFor: 'private-ometa2preload' stamp: 'MO 6/20/2024 15:30:03'!
initHead: h stream: s pos: p

	head := h.
	stream := s.
	pos := p.
	
	blockEvaluated := false! !

!OM2LazyStream methodsFor: 'private-ometa2preload' stamp: 'aw 2/19/2009 23:15'!
inputSpecies

	^ stream originalContents species! !

!OM2LazyStream methodsFor: 'private-ometa2preload' stamp: 'pb 4/25/2020 01:00'!
ometaPositionInStream

	^ pos! !

!OM2LazyStream methodsFor: 'private-ometa2preload' stamp: 'aw 2/20/2009 14:42'!
tail

	tail ifNil: [tail := OM2LazyStream for: stream withPos: pos + 1].
	^ tail! !

!OM2LazyStream methodsFor: 'as yet unclassified' stamp: 'MO 6/20/2024 15:27:44'!
head
	"Lazy block evaluation (must be done only once!!!!!!) to enable infinite streams (e.g. Network)"
	blockEvaluated ifFalse: [head := head valueWithArguments: {}. blockEvaluated := true].
	^head! !

!OM2LazyStream class methodsFor: 'private-ometa2preload' stamp: 'MO 6/20/2024 15:28:23'!
for: aReadStream withPos: pos

	^ aReadStream atEnd
		ifTrue: [OM2EndOfStream new initStream: aReadStream pos: pos]
		ifFalse: [self new initHead: [aReadStream next] stream: aReadStream pos: pos]! !

!OM2StreamDebugger methodsFor: 'private-ometa2preload' stamp: 'aw 2/26/2009 13:40'!
head

	^ om2stream head! !

!OM2StreamDebugger methodsFor: 'private-ometa2preload' stamp: 'aw 2/26/2009 15:26'!
initOm2stream: anOM2Stream

	om2stream := anOM2Stream! !

!OM2StreamDebugger methodsFor: 'private-ometa2preload' stamp: 'aw 2/27/2009 13:27'!
memo

	^ om2stream memo! !

!OM2StreamDebugger methodsFor: 'private-ometa2preload' stamp: 'pb 4/25/2020 01:00'!
ometaForgetEverything

	om2stream ometaForgetEverything! !

!OM2StreamDebugger methodsFor: 'private-ometa2preload' stamp: 'aw 2/26/2009 13:40'!
tail

	^ om2stream tail! !

!OM2StreamDebugger methodsFor: 'private-ometa2preload' stamp: 'aw 2/27/2009 13:29'!
transitiveForgetEverything

	om2stream transitiveForgetEverything! !

!OM2StreamDebugger methodsFor: 'printing' stamp: 'aw 2/26/2009 15:57'!
printOn: aStream

	aStream nextPutAll: 'an OM2StreamDebugger('.
	om2stream printOn: aStream.
	aStream nextPut: $)! !

!OM2StreamDebugger class methodsFor: 'private-ometa2preload' stamp: 'aw 2/26/2009 15:28'!
for: anOM2Stream

	^ self new initOm2stream: anOM2Stream! !

!OM2StreamProxy methodsFor: 'private-ometa2preload' stamp: 'aw 2/26/2009 11:05'!
basicTail

	^ target basicTail! !

!OM2StreamProxy methodsFor: 'private-ometa2preload' stamp: 'pb 2/21/2018 2:29'!
head

	^ head ifNil: [head := target head].
! !

!OM2StreamProxy methodsFor: 'private-ometa2preload' stamp: 'aw 2/19/2009 23:45'!
initTarget: anOM2Stream

	target := anOM2Stream! !

!OM2StreamProxy methodsFor: 'private-ometa2preload' stamp: 'aw 2/19/2009 23:13'!
inputSpecies

	^ target inputSpecies! !

!OM2StreamProxy methodsFor: 'private-ometa2preload' stamp: 'pb 4/25/2020 01:00'!
ometaPositionInStream

	^ target ometaPositionInStream! !

!OM2StreamProxy methodsFor: 'private-ometa2preload' stamp: 'pb 2/21/2018 2:29'!
tail

	^ tail ifNil: [tail := OM2StreamProxy for: target tail].
! !

!OM2StreamProxy methodsFor: 'private-ometa2preload' stamp: 'aw 2/16/2009 14:10'!
target

	^ target! !

!OM2StreamProxy class methodsFor: 'private-ometa2preload' stamp: 'aw 2/19/2009 23:44'!
for: anOM2Stream

	^ self new initTarget: anOM2Stream! !

!OMeta2Base methodsFor: 'ometa grammar' stamp: 'aw 2/16/2009 15:13'!
anything

	| ans |
	ans := input head.
	input := input tail.
	^ ans! !

!OMeta2Base methodsFor: 'ometa grammar' stamp: 'pb 5/5/2020 19:00'!
applyRule
	"Entry point to enable other rules to apply an arbitrary rule parametrically.  Used primarily by higher order rules (i.e. listOf etc.)"
	| aRule |
	aRule := self privateOMetaApply: #anything.
	^ self privateOMetaApply: aRule! !

!OMeta2Base methodsFor: 'ometa grammar' stamp: 'aw 2/16/2009 16:16'!
seq

	| xs |
	xs := self privateOMetaApply: #anything.
	xs do: [:x |
		" may want to inline #privateOMetaApply:withArgs: below as an
		  optimization, since this rule gets used a lot "
		self privateOMetaApply: #exactly withArgument: x
	].
	^ xs
	! !

!OMeta2Base methodsFor: 'external access' stamp: 'pb 5/5/2020 19:00'!
applyRule: aRule
	"Entry point for external (i.e. non-rule) code to apply an arbitrary rule."
	^ self privateOMetaApply: aRule! !

!OMeta2Base methodsFor: 'external access' stamp: 'pb 5/5/2020 19:00'!
applyRule: aRule withArgs: args
	"Entry point for external (i.e. non-rule) code to apply an arbitrary rule with arguments."
	^ self privateOMetaApply: aRule withArgs: args! !

!OMeta2Base methodsFor: 'private' stamp: 'pb 4/25/2020 01:00'!
initOMetaInputStream: i

	input := i! !

!OMeta2Base methodsFor: 'private' stamp: 'pb 4/25/2020 01:00'!
ometaForgetEverything

	input transitiveForgetEverything.
	om2streams valuesDo: [:s | s transitiveForgetEverything]! !

!OMeta2Base methodsFor: 'private' stamp: 'pb 4/25/2020 01:00'!
ometaHaltingPoint: anOM2Stream

	haltingPoint := anOM2Stream! !

!OMeta2Base methodsFor: 'private' stamp: 'aw 2/16/2009 14:10'!
ometaInputStream

	^ input! !

!OMeta2Base methodsFor: 'private' stamp: 'pb 4/25/2020 01:00'!
ometaPositionInStream
	"FIXME - called by examples.  Replace calls with @<>?"
	^ input ometaPositionInStream! !

!OMeta2Base methodsFor: 'private' stamp: 'pb 5/5/2020 19:00'!
privateOMetaApply: aRule
	"Apply taking no arguments.  Non-rule code should not send directly as I am an implementation detail and subject to change.

	A memoRec is an association whose key is the answer, and whose value is the next input. Failers pretend to be memoRecs, but throw a fail in response to #value."
	| memo memoRec |
	input == haltingPoint ifTrue: [self halt].
	memo := input memo.
	memoRec := memo at: aRule ifAbsent: [nil].
	memoRec ifNil: [
		| origInput failer ans |
		origInput := input.
		failer := OM2Failer new.
		memo at: aRule put: failer.
		ans := self perform: aRule.
		memoRec := ans -> input.
		memo at: aRule put: memoRec.
		failer used ifTrue: [
			" left recursion detected "
			| sentinel keepGoing |
			sentinel := input.
			keepGoing := true.
			[keepGoing] whileTrue: [
				[
					input := origInput.
					ans := self perform: aRule.
					input == sentinel ifTrue: [OM2Fail parserFailedAt: input ometaPositionInStream].
					memoRec key: ans value: input.
				] on: OM2Fail do: [keepGoing := false]
			]
		]		
	].
	input := memoRec value.
	^ memoRec key! !

!OMeta2Base methodsFor: 'private' stamp: 'pb 5/5/2020 19:00'!
privateOMetaApply: aRule withArgs: args
	"Apply taking an argument array, args. Non-rule code should not send directly as I am an implementation detail and subject to change."
	args reverseDo: [:a | input := OM2Stream new initHead: a tail: input].
	^ self perform: aRule! !

!OMeta2Base methodsFor: 'private' stamp: 'pb 5/5/2020 19:00'!
privateOMetaApply: aRule withArgument: arg
	"Apply taking a single argument, arg. Non-rule code should not send directly as I am an implementation detail and subject to change."
	input := OM2Stream new
		initHead: arg
		tail: input.
	^ self perform: aRule.! !

!OMeta2Base methodsFor: 'private' stamp: 'pb 4/25/2020 01:00'!
pvtOMetaConsumedBy: aBlock

	| origInput i ws |
	origInput := input.
	aBlock value.
	ws := WriteStream on: origInput inputSpecies new.
	i := origInput.
	[i == input] whileFalse: [
		ws nextPut: i head.
		i := i tail
	].
	^ ws contents! !

!OMeta2Base methodsFor: 'private' stamp: 'pb 4/25/2020 01:00'!
pvtOMetaForeignParser

	| aGrammar aRule g ans |
	aGrammar := self privateOMetaApply: #anything.
	aRule := self privateOMetaApply: #anything.
	g := aGrammar new initOMetaInputStream: (OM2StreamProxy for: input).
	ans := g privateOMetaApply: aRule.
	input := g ometaInputStream target.
	^ ans! !

!OMeta2Base methodsFor: 'private' stamp: 'pb 5/24/2019 21:00'!
pvtOMetaForm: aBlock

	| v origInput |
	v := self privateOMetaApply: #anything.
	self pvtOMetaPred: (self pvtOMetaIsForm: v).
	origInput := input.
	input := om2streams at: v ifAbsentPut: [OM2LazyStream for: v readStream withPos: 1].
	aBlock value.
	self privateOMetaApply: #end.
	input := origInput.
	^ v! !

!OMeta2Base methodsFor: 'private' stamp: 'pb 4/25/2020 01:00'!
pvtOMetaGenericMany: aBlock into: anOrderedCollection

	[
		| origInput |
		origInput := input.
		[anOrderedCollection addLast: aBlock value] on: OM2Fail do: [
			input := origInput.
			^ anOrderedCollection
		].
		true
	] whileTrue! !

!OMeta2Base methodsFor: 'private' stamp: 'pb 5/2/2020 19:00'!
pvtOMetaGetExternalSmalltalkRecognizerClass
	"Use indirection to avoid hard-coding the parser name"
	^ OMeta2CuisSmalltalkRecognizer.! !

!OMeta2Base methodsFor: 'private' stamp: 'pb 4/25/2020 01:00'!
pvtOMetaIndexConsumedBy: aBlock
	"rangeAssoc"
	| from to |
	from := self ometaPositionInStream.
	aBlock value.
	to := self ometaPositionInStream.
	^ from -> to! !

!OMeta2Base methodsFor: 'private' stamp: 'pb 5/24/2019 21:00'!
pvtOMetaIsForm: obj
	^ (obj isCollection and: [obj isSequenceable and: [obj isSymbol not]])! !

!OMeta2Base methodsFor: 'private' stamp: 'pb 4/25/2020 01:00'!
pvtOMetaLookahead: aBlock

	| origInput ans |
	origInput := input.
	ans := aBlock value.
	input := origInput.
	^ ans! !

!OMeta2Base methodsFor: 'private' stamp: 'pb 4/25/2020 01:00'!
pvtOMetaMany1: aBlock
	"1 or more matches (i.e. +)"
	^ self pvtOMetaGenericMany: aBlock into: (OrderedCollection with: aBlock value)! !

!OMeta2Base methodsFor: 'private' stamp: 'pb 4/25/2020 01:00'!
pvtOMetaMany: aBlock
	"0 or more matches (i.e. *)"
	^ self pvtOMetaGenericMany: aBlock into: OrderedCollection new! !

!OMeta2Base methodsFor: 'private' stamp: 'pb 4/25/2020 01:00'!
pvtOMetaNot: aBlock

	| origInput |
	origInput := input.
	[aBlock value] on: OM2Fail do: [
		input := origInput.
		^ true
	].
	OM2Fail parserFailedAt: input ometaPositionInStream! !

!OMeta2Base methodsFor: 'private' stamp: 'pb 4/25/2020 01:00'!
pvtOMetaOpt: aBlock

	^ self pvtOMetaOr: {
		[aBlock value].
		[nil]
	}! !

!OMeta2Base methodsFor: 'private' stamp: 'pb 5/24/2019 21:00'!
pvtOMetaOr: choices

	| origInput |
	origInput := input.
	choices do: [:choice |
		input := origInput.
		[^ choice value] on: OM2Fail do: []
	].
	OM2Fail parserFailedAt: input ometaPositionInStream! !

!OMeta2Base methodsFor: 'private' stamp: 'pb 4/25/2020 01:00'!
pvtOMetaPred: aBooleanValue

	" may want to have the compiler inline this automatically, for performance "
	aBooleanValue ifTrue: [^ true].
	OM2Fail parserFailedAt: input ometaPositionInStream! !

!OMeta2Base methodsFor: 'private' stamp: 'aw 2/16/2009 15:03'!
pvtOMetaSuper: superclass apply: aRule withArgs: args

	args reverseDo: [:a | input := OM2Stream new initHead: a tail: input].
	^ self perform: aRule withArguments: #() inSuperclass: superclass! !

!OMeta2Base methodsFor: 'private' stamp: 'pb 4/30/2020 20:00'!
pvtOMetaSuper: superclass apply: aRule withArgument: argument

	input := OM2Stream new initHead: argument tail: input.
	^ self perform: aRule withArguments: #() inSuperclass: superclass! !

!OMeta2Base methodsFor: 'initialization' stamp: 'aw 2/26/2009 11:16'!
initialize

	super initialize.
	om2streams := IdentityDictionary new! !

!OMeta2Base class methodsFor: 'matching' stamp: 'aw 2/26/2009 12:52'!
debugMatch: anObject with: aRule

	^ self debugMatch: anObject with: aRule withArgs: #()! !

!OMeta2Base class methodsFor: 'matching' stamp: 'aw 2/26/2009 12:58'!
debugMatch: anObject with: aRule withArgs: args

	^ self debugMatchAll: {anObject} readStream with: aRule withArgs: args! !

!OMeta2Base class methodsFor: 'matching' stamp: 'aw 2/26/2009 12:35'!
debugMatchAll: aSequenceableCollection with: aRule

	^ self debugMatchAll: aSequenceableCollection with: aRule withArgs: #()! !

!OMeta2Base class methodsFor: 'matching' stamp: 'aw 2/26/2009 12:53'!
debugMatchAll: aSequenceableCollection with: aRule withArgs: args

	^ self matchStream: aSequenceableCollection readStream with: aRule withArgs: args withPlaybackDebugging: true! !

!OMeta2Base class methodsFor: 'matching' stamp: 'pb 3/14/2016 02:39'!
match: anObject with: aRule
	"Recommended for use with structured data (i.e. arrays of arrays etc)"

	^ self match: anObject with: aRule withArgs: #()! !

!OMeta2Base class methodsFor: 'matching' stamp: 'aw 2/26/2009 12:55'!
match: anObject with: aRule withArgs: args

	^ self matchAll: {anObject} readStream with: aRule withArgs: args! !

!OMeta2Base class methodsFor: 'matching' stamp: 'aw 2/18/2009 15:39'!
matchAll: aSequenceableCollection with: aRule

	^ self matchAll: aSequenceableCollection with: aRule withArgs: #()! !

!OMeta2Base class methodsFor: 'matching' stamp: 'pb 3/14/2016 02:39'!
matchAll: aSequenceableCollection with: aRule withArgs: args
	"Recommended for use with unstructured data (i.e. strings and simple arrays)"
	^ self matchStream: aSequenceableCollection readStream with: aRule withArgs: args withPlaybackDebugging: false! !

!OMeta2Base class methodsFor: 'matching' stamp: 'pb 4/25/2020 01:00'!
matcherOn: aReadStream

	| input matcher |
	input := OM2LazyStream for: aReadStream withPos: 1.
	matcher := self new initOMetaInputStream: input.
	^ matcher! !

!OMeta2Base class methodsFor: 'private-ometa2preload' stamp: 'pb 4/25/2020 01:00'!
matchStream: aReadStream with: aRule withArgs: args withPlaybackDebugging: debugging
	| input matcher |
	input := OM2LazyStream
		for: aReadStream
		withPos: 1.
	matcher := self new initOMetaInputStream: input.
	^ self
		pvtMatchOMetaStream: input
		matcher: matcher
		with: aRule
		withArgs: args
		withPlaybackDebugging: debugging! !

!OMeta2Base class methodsFor: 'private-ometa2preload' stamp: 'pb 6/08/2015 15:45'!
ometa2FlattenerClass
	^ OMeta2Flattener! !

!OMeta2Base class methodsFor: 'private-ometa2preload' stamp: 'pb 6/08/2015 15:45'!
ometa2OptimizerClass
	^ OMeta2Optimizer! !

!OMeta2Base class methodsFor: 'private-ometa2preload' stamp: 'pb 6/08/2015 15:45'!
ometa2RuleParserClass
	^ OMeta2RuleParser! !

!OMeta2Base class methodsFor: 'private-ometa2preload' stamp: 'pb 6/08/2015 15:45'!
ometa2RuleTranslatorClass
	^ OMeta2RuleTranslator! !

!OMeta2Base class methodsFor: 'private-ometa2preload' stamp: 'pb 4/25/2020 01:00'!
pvtMatchOMetaStream: input matcher: matcher with: aRule withArgs: args withPlaybackDebugging: debugging
	| ans |
	[
	matcher
		applyRule: #empty
		withArgs: args.
	ans := matcher applyRule: aRule.
	matcher applyRule: #end ]
		on: OM2Fail
		do: [ :e | | curr prev prevPrev |
			debugging ifFalse: [ e pass ].
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
			"FIXME - does this add any value?
		self inform: 'will halt each time matcher reaches ', curr printString.
		"
			matcher
				initOMetaInputStream: input;
				ometaForgetEverything.
			curr ifNil: [ self error: 'you''ve found a bug -- please report it' ].
			curr become: (OM2StreamDebugger for: curr copy).
			matcher ometaHaltingPoint: curr.
			matcher
				applyRule: #empty
				withArgs: args.
			ans := matcher applyRule: aRule.
			matcher applyRule: #end ].
	^ ans! !

!OMeta2Base class methodsFor: 'accessing' stamp: 'aw 2/20/2009 14:52'!
compilerClass
        ^ OMeta2Compiler! !

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

!OMeta2 methodsFor: 'ometa grammar - character' stamp: 'MO 3/26/2024 18:22:57'!
space =

// Inlined for performance
//	char:x ?[x codePoint <= 32] -> [x]
	anything:x ?[x class == Character and: [x codePoint <= 32]] -> [x]! !

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

!OMeta2 class methodsFor: 'methods' stamp: 'pb 5/22/2020 03:09:24'!
methodNodeFor: sourceCode noPattern: aBoolean
	(self ometa2RuleParserClass isOMeta2Rule: sourceCode) ifTrue: [ ^ nil ].
	^ super
		methodNodeFor: sourceCode
		noPattern: aBoolean.! !

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

!OMeta2RuleParser methodsFor: 'private' stamp: 'pb 5/22/2015 19:02'!
name =

	spaces nsName! !

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

!OMeta2SqueakSmalltalkRecognizer methodsFor: 'private' stamp: 'pb 5/2/2020 19:42:37'!
comment =

	$" <(~$" anything)*> $" $.?! !

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

!OMeta2DebugExample methodsFor: 'as yet unclassified' stamp: 'pb 6/20/2016 22:18'!
debugForm =
	{ 'testing' }! !

!OMeta2DebugExample methodsFor: 'as yet unclassified' stamp: 'pb 6/12/2015 14:44'!
infiniteRecursion  = irRule*! !

!OMeta2DebugExample methodsFor: 'as yet unclassified' stamp: 'pb 6/12/2015 14:46'!
initialize
	super initialize.
	delimRow := Character lf.
	delimCol := $,.! !

!OMeta2DebugExample methodsFor: 'as yet unclassified' stamp: 'pb 6/12/2015 14:46'!
irField = <(~(exactly(delimCol) | exactly(delimRow)) anything)*>:field! !

!OMeta2DebugExample methodsFor: 'as yet unclassified' stamp: 'pb 6/12/2015 14:46'!
irRule = irField (exactly(delimCol) irField)* exactly(delimRow)?! !

!OMeta2DebugExample methodsFor: 'as yet unclassified' stamp: 'pb 6/12/2015 14:31'!
notASequence =
	seq($a)! !

!OMeta2DebugExample methodsFor: 'as yet unclassified' stamp: 'pb 5/1/2020 00:02:56'!
pvtOMetaDebugShouldTrace
	^ true.! !

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
name =
	spaces nsName! !

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

!OMeta2CsvExample methodsFor: 'ometa grammar' stamp: 'pb 5/23/2018 04:11:48'!
csv =
	row* -> [rows]! !

!OMeta2CsvExample methodsFor: 'private' stamp: 'pb 4/29/2020 02:50:56'!
field =
	<(~(exactly(delimCol) | exactly(delimRow)) anything)*>:field
		-> [|| curRow add: field.
			Transcript show: 'field'; finishEntry]! !

!OMeta2CsvExample methodsFor: 'private' stamp: 'pb 4/29/2020 02:50:49'!
row =
	~end field (exactly(delimCol) field)* (exactly(delimRow) | end)
		-> [|| rows add: curRow.
			curRow := OrderedCollection new]! !

!OMeta2CsvExample methodsFor: 'initialization' stamp: 'pb 6/12/2015 04:21'!
initialize
	super initialize.
	curRow := OrderedCollection new.
	rows := OrderedCollection new.
	delimRow := Character lf.
	delimCol := $,.! !

!OMeta2CsvExample class methodsFor: 'as yet unclassified' stamp: 'pb 6/12/2015 04:07'!
demo
	^ self matchAll: 'abc,123,xyz
	def,456,test' with: #csv.! !

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

!OMeta2Examples methodsFor: 'as yet unclassified' stamp: 'pb 4/25/2020 01:00'!
identifiers =

	([self inform: self ometaPositionInStream printString] identifier)*! !

!OMeta2Examples methodsFor: 'as yet unclassified' stamp: 'aw 2/27/2009 15:46'!
number =

	// this is an example of left recursion support

	number:n digit:d -> [n * 10 + d]
|	digit! !

!OMeta2Examples methodsFor: 'as yet unclassified' stamp: 'aw 2/27/2009 15:46'!
structure =

	// this example shows how the {}s are used for matching sequenceable collections

	$a $b $c 1 2 3 {anything*}! !

!OMeta2ExamplesCoverage methodsFor: 'as yet unclassified' stamp: 'pb 5/20/2020 00:04:33'!
allLowercase =
	// Not currently used by OMeta... added to ensure test coverage
	lower+ -> [true]! !

!OMeta2ExamplesCoverage methodsFor: 'as yet unclassified' stamp: 'pb 5/20/2020 00:04:44'!
allUppercase =
	// Not currently used by OMeta... added to ensure test coverage
	upper+ -> [true]! !

!OMeta2ExamplesCoverage methodsFor: 'as yet unclassified' stamp: 'pb 5/20/2020 00:33:42'!
notLastNumber =
	// Not currently used by OMeta... added to ensure test coverage
	notLast(#number) anything+ -> [true]! !

!OMeta2ExamplesCoverage methodsFor: 'as yet unclassified' stamp: 'pb 5/20/2020 00:33:36'!
notLastUppercase =
	// Not currently used by OMeta... added to ensure test coverage
	notLast(#upper) char+-> [true]! !

!OMeta2ExamplesCoverage methodsFor: 'as yet unclassified' stamp: 'pb 5/20/2020 00:05:08'!
rangeFromTo :from :to =
	// Not currently used by OMeta... added to ensure test coverage
	range(from, to)! !

!OMeta2ExtendedSyntaxExamples methodsFor: 'as yet unclassified' stamp: 'pb 5/3/2020 01:12:00'!
extendedParameterSyntax =
	// This rule describes how things *now* work in current versions of OMeta

	// A comma ($,) delimits multiple parameters
	fromTo('/*', '*/')

	// To treat the following as a single expression, wrap in a block
	seq([Date today asString, ' ', Time now asString])

	// Note: legacy ($.) parameter syntax, while deprecated, still works.  Please update your code!! To see if/where you're using it,  uncomment the 'Transcript show:...' code in OMeta2RuleParser>>args! !

!OMeta2ExtendedSyntaxExamples methodsFor: 'as yet unclassified' stamp: 'pb 5/3/2020 00:59:49'!
extendedSemanticSyntax =
	// This rule describes how things *now* work in current versions of OMeta

	// Compound semantic predicates / actions
	anything:any ?[|result|
							result := any notNil.
							Transcript show: result asString.
							result]
		-> [|| Transcript show: 'got something'.
			"the || is to work around a parsing bug... yes, you can embed comments now!!"
			any]! !

!OMeta2ExtendedSyntaxExamples methodsFor: 'as yet unclassified' stamp: 'pb 5/3/2020 01:09:32'!
legacyParameterSyntax =
	// This rule describes how things *used* to work in older versions of OMeta

	// A period ($.) delimits multiple parameters
	fromTo('/*'. '*/')

	// A *single* param (i.e. one expression)
	seq(Date today asString, ' ', Time now asString)
! !

!OMeta2ExtendedSyntaxExamples methodsFor: 'as yet unclassified' stamp: 'pb 5/3/2020 00:58:23'!
legacySemanticSyntax =
	// This rule describes how things *used* to work in older versions of OMeta

	// Compound semantic predicates / actions
	anything:any ?[[|result|
							result := any notNil.
							Transcript show: result asString.
							result] value]
		-> [[Transcript show: 'got something'.
			any] value]! !

!OMeta2ExtendedSyntaxExamples methodsFor: 'as yet unclassified' stamp: 'pb 5/3/2020 18:55:18'!
newThisRule =
	// New functionality for self-referencing rules (esp. left-recursion).  You can optionally use thisRule rather than newThisRule to reference the current rule in the same way self references the current object in Smalltalk code
	// FIXME - TODO

	thisRule 'ok'
	| 'ok'! !

!OMeta2LambdaCalculusParserExample methodsFor: 'private' stamp: 'pb 5/23/2015 18:06'!
addExpr  = addExpr:x "+" mulExpr:y  -> [{'add'. x. y}]
         | addExpr:x "-" mulExpr:y             -> [{'sub'. x. y}]         
         | mulExpr! !

!OMeta2LambdaCalculusParserExample methodsFor: 'private' stamp: 'pb 5/23/2015 17:17'!
digit    = ^digit:d                 -> [d digitValue]! !

!OMeta2LambdaCalculusParserExample methodsFor: 'private' stamp: 'pb 5/23/2015 05:07'!
expr = addExpr:e -> [{e}]! !

!OMeta2LambdaCalculusParserExample methodsFor: 'private' stamp: 'pb 5/2/2020 01:25:12'!
iName        = firstAndRest(#nameFirst, #nameRest):r -> [(String withAll: r) asSymbol]! !

!OMeta2LambdaCalculusParserExample methodsFor: 'private' stamp: 'pb 5/23/2015 18:06'!
logExpr  = logExpr:x "and" primExpr:y -> [{'and'. x. y}]
         | logExpr:x "or" primExpr:y           -> [{'or'. x. y}]
         | logExpr:x "xor" primExpr:y          -> [{'xor'. x. y}]
         | "not" logExpr:x                           -> [{'not'. x}]
         | primExpr! !

!OMeta2LambdaCalculusParserExample methodsFor: 'private' stamp: 'pb 5/23/2015 18:07'!
mulExpr  = mulExpr:x "*" powExpr:y                  -> [{'mul'. x. y}]
         | mulExpr:x "/" powExpr:y                           -> [{'div'. x. y}]
         | powExpr! !

!OMeta2LambdaCalculusParserExample methodsFor: 'private' stamp: 'pb 5/23/2015 05:06'!
nameFirst    = letter! !

!OMeta2LambdaCalculusParserExample methodsFor: 'private' stamp: 'pb 5/23/2015 05:06'!
nameRest     = nameFirst | digit! !

!OMeta2LambdaCalculusParserExample methodsFor: 'private' stamp: 'pb 5/23/2015 05:01'!
number   = number:n digit:d         -> [n * 10 + d]
         | digit! !

!OMeta2LambdaCalculusParserExample methodsFor: 'private' stamp: 'pb 5/23/2015 18:07'!
powExpr  = powExpr:x "^" relExpr:y  -> [{'pow'. x. y}]
         | relExpr! !

!OMeta2LambdaCalculusParserExample methodsFor: 'private' stamp: 'pb 5/23/2015 22:08'!
primExpr = "(" expr:x ")"               -> [x]
         | spaces iName:nn spaces   -> [{'name'. nn}]
         | spaces number:n spaces   -> [{'num'. n}]! !

!OMeta2LambdaCalculusParserExample methodsFor: 'private' stamp: 'pb 5/23/2015 18:07'!
relExpr  = relExpr:x ">" logExpr:y   -> [{'gt'. x. y}]
         | relExpr:x "<" logExpr:y          -> [{'lt'. x. y}]
         | relExpr:x ">=" logExpr:y       -> [{'gte'. x. y}]
         | relExpr:x "<=" logExpr:y       -> [{'lte'. x. y}]
         | relExpr:x "=" logExpr:y          -> [{'eq'. x. y}]
         | relExpr:x "!!=" logExpr:y         -> [{'neq'. x. y}]
         | logExpr! !

!OMeta2LambdaCalculusParserExample methodsFor: 'ometa grammar' stamp: 'pb 5/23/2015 19:09'!
root = root:r  ";" expr:ef -> [r, ef]
         | expr:e                  -> [e]! !

!OMeta2LambdaCalculusParserExample class methodsFor: 'as yet unclassified' stamp: 'pb 5/23/2015 19:22'!
demo
	^ self matchAll: 'x and y;x*y' with: #root.! !

!OMeta2LispExample methodsFor: 'private' stamp: 'pb 5/2/2020 01:32:19'!
app = #car                {{:hd anything*}}                -> [hd]
         | #cdr                {{:hd anything*:tl}}             -> [tl]
         | #cons               {:hd :tl}                              -> [{hd. tl}]
         | #atom               {:x}                                   -> [(x class = Array) not]
         | #eq                 {:x :y}                                 -> [(x == y)]
         | {#lambda :fs :body} :args
             enter bind(fs, args) ev(body):ans leave     -> [ans]
! !

!OMeta2LispExample methodsFor: 'private' stamp: 'pb 5/2/2020 01:32:34'!
bind   = {}                {}
         | {:f anything*:fs} {:a anything*:as} bind(fs, as) -> [self envAt: f put: a]! !

!OMeta2LispExample methodsFor: 'private' stamp: 'pb 5/23/2015 04:07'!
condF  = ~condT anything! !

!OMeta2LispExample methodsFor: 'private' stamp: 'pb 5/23/2018 04:16:49'!
condT  = {ev:x ?[x] ev:ans} -> [ans]! !

!OMeta2LispExample methodsFor: 'private' stamp: 'pb 5/29/2015 18:08'!
enter = -> [self push]
! !

!OMeta2LispExample methodsFor: 'private' stamp: 'pb 5/29/2015 22:34'!
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

!OMeta2LispExample methodsFor: 'private' stamp: 'pb 5/29/2015 22:35'!
envAt: key put: value
	"
	Transcript
		show: 'set ' , key asString , ' := ' , value asString;
		finishEntry.
		"
	env
		at: key
		put: value.! !

!OMeta2LispExample methodsFor: 'private' stamp: 'pb 5/2/2020 01:32:59'!
ev    = string:a                                                    -> [self envAt: a]
         | {#lambda :fs :body}                                 -> [{#lambda. fs. body}]
         | {#quote   :ans}                                        -> [ans]
         | {#cond    evCond:ans}                             -> [ans]
         | {ev:f        ev*:xs}     app(f, xs):ans            -> [ans]! !

!OMeta2LispExample methodsFor: 'private' stamp: 'pb 5/23/2018 04:17:44'!
evCond = 
	condF* condT:ans anything* -> [ans]
	| condF* anything*	-> [nil]
! !

!OMeta2LispExample methodsFor: 'private' stamp: 'pb 5/7/2020 03:11:10'!
initialize
	super initialize.
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

!OMeta2LispExample methodsFor: 'private' stamp: 'pb 5/29/2015 18:25'!
leave = -> [self pop]
! !

!OMeta2LispExample methodsFor: 'private' stamp: 'pb 5/29/2015 18:10'!
pop
	env := envStack at: envStackPointer.
	envStack removeAt: envStackPointer.
	envStackPointer := envStackPointer - 1.
! !

!OMeta2LispExample methodsFor: 'private' stamp: 'pb 5/29/2015 20:55'!
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

!OMeta2LispExample methodsFor: 'ometa grammar' stamp: 'pb 5/29/2015 17:28'!
sexp = sexp:s ev:e -> [e]
	| ev:e                 -> [e]
! !

!OMeta2LispExample class methodsFor: 'as yet unclassified' stamp: 'pb 5/4/2016 15:11'!
demo
	^ self evalDebugAll: #(
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

!OMeta2StepByStepExample methodsFor: 'test case support' stamp: 'pb 6/9/2015 22:08'!
testAnything =
	anything! !

!OMeta2StepByStepExample methodsFor: 'test case support' stamp: 'pb 6/9/2015 22:07'!
testConsumedBy =
	// Sometimes you'll want everything consumed by (i.e. matched) by an expression or a rule.  For sequences of characters, this has the useful side-effect of converting the consumed input to strings
	<testManyAnything>! !

!OMeta2StepByStepExample methodsFor: 'test case support' stamp: 'pb 6/9/2015 22:44'!
testConsumedByIndex =
	// Sometimes you may only care about the positional indexes of the consumed range
	@<testManyAnything>! !

!OMeta2StepByStepExample methodsFor: 'test case support' stamp: 'pb 5/16/2020 21:37:20'!
testFromTo =
	// fromTo will find items between the from and to parameters
	// by default, the fromTo* rules will return the a result exclusive of the match criteria.
	fromTo('/* ', ' */'):first spaces (~``tex'' anything)+
	// fromToEndOfLine only takes a from parameter and continues until either a linefeed or end of stream is reached
	// Wrap in consumed by to get the entire text.
	<fromToEndOfLine('tex')>:last -> [first, ' ', last]
	
	// Note: because fromToEndOfLine is searching for a particular character value, it is generally limited to searching strings
	// FIXME - can the 2nd param be optional and use lf only if not specified?! !

!OMeta2StepByStepExample methodsFor: 'test case support' stamp: 'pb 5/2/2020 14:27:47'!
testFromToObject =
	/* FIXME - wip.  trying to get this to work:
	OMeta2StepByStepExample
			matchAll: #((1 1) (2 2) (3 3) (4 4) (5 5) ($a 1) ($b 2) ($c 3) 'text' (123 456)) 
			with: #testFromToObject.
			*/
	// fromTo will find items between (spatially) the from and to parameters
	// by default, the fromTo* rules will return the a result exclusive of the match criteria.
	[#(3 3)]:fromSeq (~seq(fromSeq) anything)* fromTo(fromSeq, #($b 2)):first  anything* //(~``text'' anything)+
	-> [first]
	// fromToEnd only takes a from parameter and continues until either a linefeed or end of stream is reached
	// Wrap in consumed by to get the entire text.
	//<fromToOrEnd('text'. nil)>:last -> [{first. last}]
	
	// Note: because fromToEnd is searching for a particular character value, it is generally limited to searching strings
	// FIXME - can the 2nd param be optional and use lf only if not specified?! !

!OMeta2StepByStepExample methodsFor: 'test case support' stamp: 'pb 5/2/2020 14:28:10'!
testFromToOrEnd =
	// FIXME - broken.  the following should work when called from workspace:
	//OMeta2StepByStepExample matchAll: '/* finding */ the test text...' with: #testFromToOrEnd.
	// my best guess is that the issue is attempting to pass the variable rather than its value?

	// fromTo will find items between the from and to parameters
	// by default, the fromTo* rules will return the a result exclusive of the match criteria.
	fromTo('/* ', ' */'):first spaces (~``tex'' anything)+
	// fromToEnd only takes a from parameter and continues until either a linefeed or end of stream is reached
	// Wrap in consumed by to get the entire text.
	[Character newLineCharacter asString]:nl
	<fromToOrEnd('tex', nl)>:last -> [first, ' ', last]
	
	// Note: because fromToEnd is searching for a particular character value, it is generally limited to searching strings
	// FIXME - can the 2nd param be optional and use lf only if not specified?! !

!OMeta2StepByStepExample methodsFor: 'test case support' stamp: 'pb 5/16/2020 21:37:30'!
testFromToString =
	// fromTo will find items between (spatially) the from and to parameters
	// by default, the fromTo* rules will return the a result exclusive of the match criteria.
	// spaces is a built in rule which consumes any whitespace
	fromTo('/* ', ' */'):first spaces (~``tex'' anything)+
	// fromToEndOfLine only takes a from parameter and continues until either a linefeed or end of stream is reached
	// Wrap in consumed by to get the entire text.
	<fromToEndOfLine('tex')>:last -> [first, ' ', last]
	
	// Note: because fromToEndOfLine is searching for a particular character value, it is generally limited to searching strings
	// FIXME - can the 2nd param be optional and use lf only if not specified?! !

!OMeta2StepByStepExample methodsFor: 'test case support' stamp: 'pb 5/2/2020 01:36:56'!
testLegacyParameterSyntax =
	fromTo('/* '. ' */'):first spaces (~``tex'' anything)+ // legacy syntax - the only thing different is that instead of using $, as parameter separators we use $.
! !

!OMeta2StepByStepExample methodsFor: 'test case support' stamp: 'pb 6/9/2015 23:58'!
testLiteralChar =
	$a! !

!OMeta2StepByStepExample methodsFor: 'test case support' stamp: 'pb 6/9/2015 05:34'!
testLiteralString =
	'abc'! !

!OMeta2StepByStepExample methodsFor: 'test case support' stamp: 'pb 6/10/2015 00:44'!
testLookaheadNot =
	// Anything but a "
	(~$" char)*! !

!OMeta2StepByStepExample methodsFor: 'test case support' stamp: 'pb 6/9/2015 05:30'!
testMany1Char =
	// + matches 1 or more occurrences
	$a+! !

!OMeta2StepByStepExample methodsFor: 'test case support' stamp: 'pb 6/9/2015 05:30'!
testMany1String =
	// + matches 1 or more occurrences
	'abc'+! !

!OMeta2StepByStepExample methodsFor: 'test case support' stamp: 'pb 6/9/2015 22:07'!
testManyAnything =
	// * matches 0 or more occurrences
	anything*! !

!OMeta2StepByStepExample methodsFor: 'test case support' stamp: 'pb 6/9/2015 05:27'!
testManyChar =
	// * matches 0 or more occurrences
	$a*! !

!OMeta2StepByStepExample methodsFor: 'test case support' stamp: 'pb 6/9/2015 05:27'!
testManyString =
	// * matches 0 or more occurrences
	'abc'*! !

!OMeta2StepByStepExample methodsFor: 'test case support' stamp: 'pb 6/9/2015 19:40'!
testOpt =
	// expr? tests for 0 or 1 occurrence, returns nil if 0.
	"abc"?! !

!OMeta2StepByStepExample methodsFor: 'test case support' stamp: 'pb 6/9/2015 20:49'!
testPrioritizedChoice =
	// | is the prioritized choice operator and behaves like a switch statement.  When the first test fails, it moves on to the second one.  Had the first test succeeded, the second one would be ignored.
	testSemanticAction
	| testConsumedBy! !

!OMeta2StepByStepExample methodsFor: 'test case support' stamp: 'pb 6/10/2015 14:37'!
testRuleParameters =
	// rule parameters use a function call syntax
	<wordParam('test')>! !

!OMeta2StepByStepExample methodsFor: 'test case support' stamp: 'pb 6/9/2015 19:19'!
testSemanticAction =
	// -> is the action to perform if the predicate succeeds
	testConsumedBy:x ?[x='testing'] -> ['got it!!']! !

!OMeta2StepByStepExample methodsFor: 'test case support' stamp: 'pb 4/29/2020 00:48:12'!
testSemanticActionBlock =
	// An action can be a zero-argument block
	testConsumedBy:x ?[x='testing']
		-> [|tmpStr|
			tmpStr := 'got it: '.
			tmpStr, x]! !

!OMeta2StepByStepExample methodsFor: 'test case support' stamp: 'pb 6/9/2015 19:32'!
testSemanticPredicate =
	// ?expr is the semantic predicate, if it succeeds the match continues.  We're also assigning the match to x so that we can use it in the predicate.
	testConsumedBy:x ?[x='testing']! !

!OMeta2StepByStepExample methodsFor: 'test case support' stamp: 'pb 4/29/2020 00:48:18'!
testSemanticPredicateBlock =
	// A predicate can be a zero-argument block
	testConsumedBy:x ?[|other|
		other := 4.
		x='testing' and: [other = 4]]! !

!OMeta2StepByStepExample methodsFor: 'test case support' stamp: 'pb 6/9/2015 18:30'!
testSeqObject =
	// Sequences aren't limited to strings...
	seq(#(1 2 3))! !

!OMeta2StepByStepExample methodsFor: 'test case support' stamp: 'pb 6/9/2015 20:38'!
testSeqString =
	// ``item'' is syntactic sugar for a sequence of characters i.e. seq('item')
	// While this rule expects two 'item' sequences, OMeta only returns the last match from the rule by default
	``item'' seq('item')! !

!OMeta2StepByStepExample methodsFor: 'test case support' stamp: 'pb 6/9/2015 18:08'!
testToken =
	// "item" syntactic sugar for token('item') - be careful to use the correct quotes!!
	// While this rule expects two 'item' tokens, OMeta only returns the last match from the rule by default
	"item" token('item')! !

!OMeta2StepByStepExample methodsFor: 'as yet unclassified' stamp: 'pb 6/11/2015 03:25'!
testZZZ =
	// OMeta2StepByStepExample matchAll: 'test' with: #testZZZ.
	seq($a)! !

!OMeta2StepByStepExample methodsFor: 'support rules and methods' stamp: 'pb 6/10/2015 14:39'!
wordParam :useWord =
	// :var before the = is used as a method parameter as opposed to after the = where it is used to bind a match result to a local variable
	"looking" "for" token(useWord) "text"! !

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

!OMeta2TreeExample methodsFor: 'as yet unclassified' stamp: 'pb 5/23/2015 16:18'!
depth
	^ OMeta2TreeWalkerExample match: self with: #depth! !

!OMeta2TreeExample methodsFor: 'as yet unclassified' stamp: 'pb 5/23/2015 16:18'!
readStream
	^ self unapply readStream! !

!OMeta2TreeExample methodsFor: 'as yet unclassified' stamp: 'pb 5/23/2015 16:18'!
sum
	^ OMeta2TreeWalkerExample match: self with: #sum! !

!OMeta2TreeExample methodsFor: 'testing' stamp: 'pb 5/23/2015 14:55'!
isCollection
	^ true! !

!OMeta2TreeExample methodsFor: 'testing' stamp: 'pb 5/23/2015 14:55'!
isSequenceable
	^ true! !

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

!OMeta2TreeLeafExample methodsFor: 'as yet unclassified' stamp: 'pb 5/23/2015 16:24'!
unapply
	^ {#Leaf. value.}! !

!OMeta2TreeLeafExample methodsFor: 'as yet unclassified' stamp: 'pb 5/23/2015 15:31'!
value: aNumber
	value := aNumber! !

!OMeta2TreeLeafExample methodsFor: 'initialization' stamp: 'pb 5/23/2015 15:44'!
initialize
	value := 1! !

!OMeta2TreeNodeExample methodsFor: 'as yet unclassified' stamp: 'pb 5/23/2015 15:25'!
left: anObject
	leftTree := anObject! !

!OMeta2TreeNodeExample methodsFor: 'as yet unclassified' stamp: 'pb 5/23/2015 15:25'!
right: anObject
	rightTree := anObject! !

!OMeta2TreeNodeExample methodsFor: 'as yet unclassified' stamp: 'pb 5/23/2015 16:24'!
unapply
	^ {#Node. leftTree unapply. rightTree unapply.}! !
OMeta2SqueakSmalltalkRecognizer initialize!
OMeta2Package postPackageInstall!
