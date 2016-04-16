# Honour

[![Language](https://img.shields.io/badge/lang-Swift-orange.svg)](https://developer.apple.com/swift/)
[![License](https://img.shields.io/cocoapods/l/Honour.svg)](https://cocoapods.org/pods/Honour)
[![Version](https://img.shields.io/cocoapods/v/Honour.svg)](https://cocoapods.org/pods/Honour)

Validation library for iOS inspired by [Respect/Validation](https://github.com/respect/validation).

```swift
Validator.mustBe(Uppercase()).andMust(StartsWith("F")).validate("FOOBAR")
```

# Usage

## Single Validation

```swift
let username = "jeanpimentel"
Lowercase().validate(username) // true
```

## Chained Validation

It is possible to use validators in a chain. 

```swift
let v = Validator.add(rule: Lowercase()).add(rule: NoWhitespace()).add(rule: Length(min: 3, max: 60))
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
func validate(value: AnyObject) -> Bool
```

```swift
let validator = Validator().add(rule: Uppercase()).add(rule: StartsWith("J"))
validator.validate("JEAN") // true
validator.validate("PIMENTEL") // false
```

### Assert 
```swift
func assert(value: AnyObject) -> (isValid: Bool, invalidRules: Array<Rule>)
```

```swift
let validator = Validator().add(rule: Uppercase()).add(rule: StartsWith("J"))

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
func check(value: AnyObject) -> (isValid: Bool, invalidRule: Rule?)
```

```swift
let validator = Validator().add(rule: Uppercase()).add(rule: StartsWith("J"))

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

Package is available on [CocoaPods](https://cocoapods.org/pods/Honour). See the ["Using CocoaPods" guide for more information](https://guides.cocoapods.org/using/using-cocoapods.html).

```ruby
use_frameworks!
platform :ios, '7.0'
pod 'Honour', '~> 1.1.1'
```

## Requirements

|                       Honour Version                       | Minimum iOS Target |               Notes                |
|:----------------------------------------------------------:|:------------------:|:----------------------------------:|
| [1.1.1](https://github.com/jeanpimentel/Honour/tree/1.1.1) |       iOS 7        | Swift 1.2 (Xcode 6.3) is required. |


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

- [AllOf](HonourTests/Library/Rules/AllOfTest.swift)
- [AlwaysInvalid](HonourTests/Library/Rules/AlwaysInvalidTest.swift)
- [AlwaysValid](HonourTests/Library/Rules/AlwaysValidTest.swift)
- [Between](HonourTests/Library/Rules/BetweenTest.swift)
- [Composite](HonourTests/Library/Rules/CompositeTest.swift)
- [Contains](HonourTests/Library/Rules/ContainsTest.swift)
- [CountryCode](HonourTests/Library/Rules/CountryCodeTest.swift)
- [Email](HonourTests/Library/Rules/EmailTest.swift)
- [EndsWith](HonourTests/Library/Rules/EndsWithTest.swift)
- [Even](HonourTests/Library/Rules/EvenTest.swift)
- [HexRGBColor](HonourTests/Library/Rules/HexRGBColorTest.swift)
- [Length](HonourTests/Library/Rules/LengthTest.swift)
- [Lowercase](HonourTests/Library/Rules/LowercaseTest.swift)
- [Max](HonourTests/Library/Rules/MaxTest.swift)
- [Min](HonourTests/Library/Rules/MinTest.swift)
- [Negative](HonourTests/Library/Rules/NegativeTest.swift)
- [NoWhitespace](HonourTests/Library/Rules/NoWhitespaceTest.swift)
- [NoneOf](HonourTests/Library/Rules/NoneOfTest.swift)
- [NotEmpty](HonourTests/Library/Rules/NotEmptyTest.swift)
- [Odd](HonourTests/Library/Rules/OddTest.swift)
- [OneOf](HonourTests/Library/Rules/OneOfTest.swift)
- [Positive](HonourTests/Library/Rules/PositiveTest.swift)
- [Regex](HonourTests/Library/Rules/RegexTest.swift)
- [Roman](HonourTests/Library/Rules/RomanTest.swift)
- [StartsWith](HonourTests/Library/Rules/StartsWithTest.swift)
- [Uppercase](HonourTests/Library/Rules/UppercaseTest.swift)
- [Version](HonourTests/Library/Rules/VersionTest.swift)


**Localized validators**

- Brazil (BR)
	- [CPF](HonourTests/Library/Rules/Locale/BR/CPFTest.swift)

# License

Honour is released under the MIT license. See [LICENSE](LICENSE) for details.
