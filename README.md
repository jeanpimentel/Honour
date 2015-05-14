# Honour

[![License](https://img.shields.io/cocoapods/l/Honour.svg)](https://cocoapods.org/pods/Honour)
[![Version](https://img.shields.io/cocoapods/v/Honour.svg)](https://cocoapods.org/pods/Honour)

Validation library for iOS inspired by Respect/Validation.

```swift
Validator.mustBe(Uppercase()).andMust(StartsWith("F")).validate("FOOBAR")
```


# Features

## Single Validation

```swift
let username = "jeanpimentel"
Lowercase().validate(username) // true
```

## Chained Validation

It is possible to use validators in a chain. 

```swift
let v = Validator.addRule(Lowercase()).addRule(NoWhitespace()).addRule(Length(min: 3, max: 60))
v.validate("jeanpimentel")
```

## Syntax sugar

It is possible to use some syntax tricks to be highly expressive.

```swift
let v = Validator.mustHave(Length(min: 3, max: 60)).and(NoWhitespace()).andMustHave(Length(min: 3, max: 60))
v.validate("jeanpimentel")
```

## Granularity control

We have 3 validation methods

- `validate()` - returns true or false
- `assert()` - returns a tuple with true/false and all errors, if any.
- `check()` - returns a tuple with true/false and the first error, if any.

### Validate

```swift
let validator = Validator().addRule(Uppercase()).addRule(StartsWith("J"))
validator.validate("JEAN") // true
validator.validate("PIMENTEL") // false
```

### Assert

```swift
let validator = Validator().addRule(Uppercase()).addRule(StartsWith("J"))

let result = validator.assert("JEAN")
result.isValid      // true
result.invalidRules // [] (empty)

let result = validator.assert("Jean")
result.isValid      // false
result.invalidRules // [Uppercase()]

let result = validator.assert("Felipe")
result.isValid      // false
result.invalidRules // [Uppercase(), StartsWith("J")]
```

### Check

```swift
let validator = Validator().addRule(Uppercase()).addRule(StartsWith("J"))

let result = validator.check("JEAN")
result.isValid     // true
result.invalidRule // nil

let result = validator.check("Felipe")
result.isValid     // false
result.invalidRule // Uppercase()

let result = validator.check("FELIPE")
result.isValid     // false
result.invalidRule // StartsWith("J")
```




# License

The MIT License (MIT)

Copyright (c) 2015 Jean Pimentel

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

