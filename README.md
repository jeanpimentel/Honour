# Honour

[![Language](https://img.shields.io/badge/lang-Swift-orange.svg)](https://developer.apple.com/swift/)
[![License](https://img.shields.io/cocoapods/l/Honour.svg)](https://cocoapods.org/pods/Honour)
[![Version](https://img.shields.io/cocoapods/v/Honour.svg)](https://cocoapods.org/pods/Honour)

Validation library for iOS inspired by Respect/Validation.

```swift
Validator.mustBe(Uppercase()).andMust(StartsWith("F")).validate("FOOBAR")
```

:exclamation: If you want to use this library in Objective-C classes, check [HonourBridge](https://github.com/jeanpimentel/HonourBridge) repo.

# Usage

## Single Validation

```swift
let username = "jeanpimentel"
Lowercase().validate(username) // true
```

## Chained Validation

It is possible to use validators in a chain. 

```swift
let v = Validator.addRule(Lowercase()).addRule(NoWhitespace()).addRule(Length(min: 3, max: 60))
v.validate("jeanpimentel") // true
```

## Syntax sugar

It is possible to use some syntax tricks to be highly expressive.

```swift
let v = Validator.mustHave(Length(min: 3, max: 60)).and(NoWhitespace()).andMustBe(Lowercase())
v.validate("jeanpimentel") // true
```

## Granularity control

We have 3 validation methods

- `validate()` - returns true or false
- `assert()` - returns a tuple with true/false and all errors, if any.
- `check()` - returns a tuple with true/false and the first error, if any.

### Validate
```swift
func validate(value: String) -> Bool
```

```swift
let validator = Validator().addRule(Uppercase()).addRule(StartsWith("J"))
validator.validate("JEAN") // true
validator.validate("PIMENTEL") // false
```

### Assert 
```swift
func assert(value: String) -> (isValid: Bool, invalidRules: Array<Rule>)
```

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
func check(value: String) -> (isValid: Bool, invalidRule: Rule?)
```

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


# Installation

Package is available on [Cocoapods](https://cocoapods.org/pods/Honour). See the ["Using CocoaPods" guide for more information](https://guides.cocoapods.org/using/using-cocoapods.html).

```ruby
use_frameworks!
platform :ios, '7.0'
pod 'Honour', '~> 0.1.1'
```

## Requirements

|                       Honour Version                       | Minimum iOS Target |               Notes                |
|:----------------------------------------------------------:|:------------------:|:----------------------------------:|
| [0.1.1](https://github.com/jeanpimentel/Honour/tree/0.1.1) |       iOS 7        | Swift 1.2 (Xcode 6.3) is required. |


# Contributing

- If you **found a bug**, _and can provide steps to reliably reproduce it_, open an issue.

- If you **have a feature request**, open an issue.

- If you **want to contribute**, submit a pull request.
	1. Fork it!
	2. Create your feature branch: `git checkout -b my-new-feature`
	3. Commit your changes: `git commit -am 'Add some feature'`
	4. Push to the branch: `git push origin my-new-feature`
	5. Submit a pull request

# Validators

Always a working in progress...

**Available now:**

- AlwaysInvalid
- AlwaysValid
- Contains
- Email
- EndsWith
- Length
- Lowercase
- NoWhitespace
- NotEmpty
- Regex
- Roman
- StartsWith
- Uppercase
- Version


**Localized validators**

- Brazil (BR)
	- CPF

# License

Honour is released under the MIT license. See [LICENSE](LICENSE) for details.
