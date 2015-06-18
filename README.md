OMeta/Cuis
==========

# Overview

OMeta/Cuis started as a port of OMeta/Squeak to Cuis but is quickly turning into a bit more so naming it OMeta/Cuis and moving it to its own repository reflects that.  It is intended to be compatible with OMeta/Squeak where possible so most existing grammars should work without changes.  One additional benefit to having its own repository is that it is now possible to include add-on parsers without cluttering up my Cuis-Ports repository.

# Installation

A. Download Cuis4.2-2337 or later

B. Pull down the OMeta*.st files from https://github.com/pbella/OMeta-Cuis

C. File in in the following sequence

	1. OMeta2Preload.st
	2. OMeta2.pck.st
	3. OMeta2Extensions.pck.st (optional)
	4. OMeta2Examples.pck.st (optional)
	5. OMeta2Tests.pck.st (optional)

	(Items 2-5 can be loaded automatically via dependencies by loading OMeta2Tests)

D. Check examples in the OMeta2Examples class (for more examples, see class comments in OMeta2Examples category, for a more detailed look at OMeta syntax see OMeta2StepByStepTests)

	- OMeta2Examples match: 5 with: #fact.
	- OMeta2Examples matchAll: '1234' with: #number.
	- OMeta2Examples matchAll: 'abc123' with: #identifier.
	- OMeta2Examples matchAll: #($a $b $c 1 2 3 #(4 5)) with: #structure.
	- OMeta2Examples matchAll: 'howdy' with: #greeting.

The general idea is that the examples progress in complexity: OMeta2Examples (trivial) -> OMeta2StepByStepTests (test cases more thoroughly describing OMeta syntax) -> OMeta2TreeExample (simple but actually does something useful) -> OMeta2LamdaCalculusParserExample (parses a simple language but doesn't do anything with it) -> OMeta2LispExample (parses a minimal subset of a real language and executes it.)  Also, for more usage examples, see the tests which are currently all using the example parsers.

# Notes
- OMeta2Preload.st was previously named OMeta2-stage1.st in the Cuis-Ports repository
- OMeta2.pck.st overrides some of the methods in OMeta2Preload.st that are needed to load the package.  This is why *Preload has not been moved into a package (i.e. to not give the illusion that its contents can be changed and saved out once the full OMeta2 package has been loaded)
- Debugging support is weak (a known issue with OMeta in general... let's work to improve it)
- More test cases and examples are need.

# Syntax highlighting WIP notes
- Install OMeta with optional packages as described above
- Install 2359-CuisCore-PhilBellalouna-2015Jun09-23h06m-pb.1.cs.st
- Open a workspace and execute (when prompted, declare global): DefaultStyler:= SHTextStylerST80.
- Open a code browser and navigate to any Smalltalk method to confirm functional
- Go back to the workspace and execute: DefaultStyler:= SHTextStylerOMeta2.
- Open a new code browser and navigate to any OMeta method to confirm functionality (in the category OMeta2Extensions, class OMeta2ExtendedParser any method source that starts with '<methodName> =' should now be styled)
- Easy way to tell which styler is in use: with the stock styler, OMeta methods are in red from = on while Smalltalk methods are styled.  With the OMeta styler, Smalltalk methods are entirely black text while OMeta methods are styled.
