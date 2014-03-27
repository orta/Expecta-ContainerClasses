# Expecta+ContainerClasses

[![Version](http://cocoapod-badges.herokuapp.com/v/Expecta+ContainerClasses/badge.png)](http://cocoadocs.org/docsets/Expecta+ContainerClasses)
[![Platform](http://cocoapod-badges.herokuapp.com/p/Expecta+ContainerClasses/badge.png)](http://cocoadocs.org/docsets/Expecta+ContainerClasses)
[![Build Status](https://travis-ci.org/orta/Expecta-ContainerClasses.svg)](https://travis-ci.org/orta/Expecta-ContainerClasses)

## What it does

The best example is testing API callbacks for types:

	it(@"does something from an API", ^AsyncBlock {
	
		ARImageDownloader *downloader = [[ARImageDownloader alloc] init];
			[downloader downloadImages:^(NSArray *objects) {
			...
			expect(objects).to.containInstancesOfClass(ARImageFormat.class);
			...
			done();
		}];
	});


if you prefer you can also use `onlyContainInstancesOfClass`. Also gives back a useful fail message telling you what other classes have sneaked into your set or an array.

## Installation

Expecta+ContainerClasses is available through [CocoaPods](http://cocoapods.org), to install it simply add the following line to your Podfile:

    pod "Expecta+ContainerClasses"

It's likely that you'll want this in a testing subset, this usually looks like:


    target 'MyApp Tests', :exclusive => true do
        pod 'Specta',      '~> 0.3'
        pod 'Expecta',     '~> 0.3'
        pod 'Expecta+ContainerClasses', '~> 1.0'
    end


## Author

[@Orta](http://twitter.com/orta), orta.therox@gmail.com

[http://orta.github.io](http://orta.github.io)

## License

Expecta+ContainerClasses is available under the MIT license. See the LICENSE file for more info.

