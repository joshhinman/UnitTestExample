//
//  Monkey.h
//  Zoo
//
//  Created by Josh Hinman on 11/13/13.
//  Copyright (c) 2013 Brightly, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Banana;

@interface Monkey : NSObject

@property (nonatomic, getter=isHungry) BOOL hungry;

- (void)eat:(Banana *)banana;

@end