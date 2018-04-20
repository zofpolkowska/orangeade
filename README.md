[![Build Status](https://travis-ci.org/lambdaacademy/orangeade.svg?branch=master)](https://travis-ci.org/lambdaacademy/orangeade)

# Orangeade

A collection of data generators like those seen in property-based testing.
This is where the name came from (https://new.wordsmith.org/anagram/anagram.cgi?anagram=data+generators&t=500&a=n).

The test module `OrangeadeTest` declares the **public API** which should change as we introduce generators.
If we intend a module and function to be part of our public API (i.e. one that a user will use) then we list it in the "API" test case.
This way we have it _documented_ in one place.
It's listed under this particular test module because the API is all in the `Orangeade` name-space.
