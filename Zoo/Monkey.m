//
//  Monkey.m
//  Zoo
//
//  Created by Josh Hinman on 11/13/13.
//  Copyright (c) 2013 Brightly, LLC. All rights reserved.
//

#import "Banana.h"
#import "Monkey.h"

@implementation Monkey

- (void)eat:(Banana *)banana
{
    self.hungry = NO;
    banana.eaten = YES;
}

@end
