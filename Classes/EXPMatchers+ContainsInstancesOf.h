//
//  EXPMatchers+ContainsInstancesOf.h
//  Artsy Folio
//
//  Created by Orta on 3/27/14.
//  Copyright (c) 2014 http://artsy.net. All rights reserved.
//

#import <Expecta/Expecta.h>

EXPMatcherInterface(containInstancesOfClass, (Class expected));

#define onlyContainInstancesOfClass containInstancesOfClass
