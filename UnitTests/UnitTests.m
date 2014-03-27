//
//  UnitTests.m
//  UnitTests
//
//  Created by Orta on 3/27/14.
//
//

#define EXP_SHORTHAND

#import <XCTest/XCTest.h>
#import <Expecta/Expecta.h>
#import "EXPExpect+Test.h"
#import <Expecta+ContainerClasses/EXPMatchers+ContainsInstancesOf.h>

#define test_expect(a) [expect(a) test]
#define assertPass(expr) \
XCTAssertNoThrow((expr))

@interface UnitTests : XCTestCase
@end

@implementation UnitTests

- (void)testArraySuccess
{
    NSArray *allStrings = @[@"", @"", @""];
    assertPass( test_expect(allStrings).to.containInstancesOfClass(NSString.class) );
}

- (void)testArrayFail
{
    NSArray *mixedArray = @[@1, @"", @""];
    assertPass( test_expect(mixedArray).toNot.containInstancesOfClass(NSString.class) );
}

- (void)testArrayExtendedWording
{
    NSArray *allStrings = @[@"", @"", @""];
    assertPass( test_expect(allStrings).to.onlyContainInstancesOfClass(NSString.class) );
    
    NSArray *mixedArray = @[@1, @"", @""];
    assertPass( test_expect(mixedArray).toNot.onlyContainInstancesOfClass(NSString.class) );
}

- (void)testSetSuccess
{
    NSSet *allStrings = [NSSet setWithObjects:@"1", @"2", @"3", nil];
    assertPass( test_expect(allStrings).to.containInstancesOfClass(NSString.class) );
}

- (void)testSetFail
{
    NSSet *mixedSet = [NSSet setWithObjects:@"1", @"2", @3, nil];
    assertPass( test_expect(mixedSet).toNot.containInstancesOfClass(NSString.class) );
}

- (void)testSetExtendedWording
{
    NSSet *allStrings = [NSSet setWithObjects:@"1", @"2", @"3", nil];
    assertPass( test_expect(allStrings).to.onlyContainInstancesOfClass(NSString.class) );
    
    NSSet *mixedSet = [NSSet setWithObjects:@"1", @"2", @3, nil];
    assertPass( test_expect(mixedSet).toNot.onlyContainInstancesOfClass(NSString.class) );
}

- (void)testFailingGivesTheClassNameInError
{
    NSSet *mixedSet = [NSSet setWithObjects:@"1", @"2", @3, nil];
    @try {
        test_expect(mixedSet).to.onlyContainInstancesOfClass(NSString.class);
    }
    @catch (NSException *exception) {
        assertPass([exception.description rangeOfString:@"NSNumber"].location != NSNotFound );
    }
}

@end
