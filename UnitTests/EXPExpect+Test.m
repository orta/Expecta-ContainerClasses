// Extracted from https://github.com/specta/expecta

#import "EXPExpect+Test.h"
#import "FakeTestCase.h"

@implementation EXPExpect (Test)

- (EXPExpect *)test {
  self.testCase = [FakeTestCase new];
  return self;
}

@end
