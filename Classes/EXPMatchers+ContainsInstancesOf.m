//
//  EXPMatchers+ContainsInstancesOf.m
//  Artsy Folio
//
//  Created by Orta on 3/27/14.
//  Copyright (c) 2014 http://artsy.net. All rights reserved.
//

#import "EXPMatchers+ContainsInstancesOf.h"

EXPMatcherImplementationBegin(containInstancesOfClass, (Class expected)) {
    BOOL actualNotArrayOrSet = ([actual isKindOfClass:NSArray.class] || [actual isKindOfClass:NSSet.class]);
    BOOL expectedIsNil = (expected == nil);

    __block NSArray *filteredResults;
    __block NSMutableString *classesLeftOver;
    
    prerequisite(^BOOL {
        return actualNotArrayOrSet && !expectedIsNil;
    });
    
    match(^BOOL {
        NSPredicate *classPredicate = [NSPredicate predicateWithFormat: @"!(self isKindOfClass: %@)", expected];
        if ([actual isKindOfClass:NSArray.class]) {
            filteredResults = [actual filteredArrayUsingPredicate:classPredicate];

        } else if ([actual isKindOfClass:NSSet.class]) {
            filteredResults = [actual filteredSetUsingPredicate:classPredicate].allObjects;
        }
        
        NSMutableString *classes = [NSMutableString string];
        [filteredResults enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [classes appendFormat:@"%@", obj];
            if (idx != filteredResults.count -1 && filteredResults.count != 1) {
                [classes appendString:@", "];
            }
        }];
        
        return filteredResults.count == 0;
    });
    
    failureMessageForTo(^NSString * {
        if (!actualNotArrayOrSet)
            return [NSString stringWithFormat:@"expected: a set/array, got: an instance of %@.", [actual class]];
        if (expectedIsNil)
            return @"the expected value is nil/null";
        return [NSString stringWithFormat:@"expected: all intances of %@. Found rogue instances of %@.", [expected class], classesLeftOver];
    });
    
    failureMessageForNotTo(^NSString * {
        if (!actualNotArrayOrSet)
            return [NSString stringWithFormat:@"expected: a set/array, got: an instance of %@.", [actual class]];
        if (expectedIsNil)
            return @"the expected value is nil/null";
        
        return [NSString stringWithFormat:@"expected: to not be all intances of %@.", [expected class]];
    });
}
EXPMatcherImplementationEnd
