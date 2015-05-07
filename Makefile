all: test

test:
	xcodebuild -project Honour.xcodeproj -scheme Honour -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 4s,OS=7.1' -configuration Release ONLY_ACTIVE_ARCH=NO clean test | xcpretty -c