//
//  MonkeyTests.m
//  Zoo
//
//  Created by Josh Hinman on 11/14/13.
//  Copyright (c) 2013 Brightly, LLC. All rights reserved.
//

#import "Banana.h"
#import "OCMock.h"
#import "Monkey.h"

#import <XCTest/XCTest.h>

@interface MonkeyTests : XCTestCase

@end

@implementation MonkeyTests

- (void)testMonkeyEatsBanana
{
    // preconditions
    id b = [OCMockObject niceMockForClass:[Banana class]];
    Monkey *monkey = [[Monkey alloc] init];
    monkey.hungry = YES;
    
    // test
    [monkey eat:b];
    
    // postconditions
    XCTAssertFalse(monkey.hungry);
}

- (void)testBananaIsEaten
{
    id b = [OCMockObject mockForClass:[Banana class]];
    Monkey *monkey = [[Monkey alloc] init];

    [[b expect] setEaten:YES];
    
    [monkey eat:b];

    [b verify];
}

@end
