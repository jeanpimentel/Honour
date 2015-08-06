# Changelog

## 1.1.1 (2015/08/06)
- Refactor Validator class
- Added new rules:
	- AllOf, NoneOf, OneOf
	- Even, Odd
- Refactored rules: 
	- Length - now supports Length(equal:)

## 1.0.0 (2015/08/04)
- Change library to validate not only String :exclamation:
- Added new rules:
	- HexRGBColor
	- Min, Max, Between
	- Positive, Negative

## 0.1.1 (2015/05/21)
- Added CocoaPods support
- Added new rules:
	- NotEmpty
	- NoWhitespace
	- Email
	- Regex, Roman, Version
	- Locale/Brazil/CPF
	- AlwaysValid, AlwaysInvalid
- Refactored rules: 
	- StartsWith, EndsWith

## 0.1.0 (2015/05/07)
- Initial version
- Rules: 
	- StartsWith, EndsWith, Contains
	- Length
	- Lowercase, Uppercase