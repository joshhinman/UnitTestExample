//
//  ZooViewController.m
//  Zoo
//
//  Created by Josh Hinman on 11/13/13.
//  Copyright (c) 2013 Brightly, LLC. All rights reserved.
//

#import "BananaView.h"
#import "Banana.h"
#import "MonkeyView.h"
#import "Monkey.h"
#import "ZooViewController.h"

@implementation ZooViewController
{
    MonkeyView *_monkeyView;
    BananaView *_bananaView;
    
    CGPoint _panPoint;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
    }
    return self;
}

- (void)loadView
{
    UIView *rootView = [[UIView alloc] init];
    self.view = rootView;
    
    _monkeyView = [[MonkeyView alloc] init];
    _monkeyView.translatesAutoresizingMaskIntoConstraints = NO;
    _monkeyView.monkey = [[Monkey alloc] init];
    _monkeyView.monkey.hungry = YES;
    [rootView addSubview:_monkeyView];
    
    [rootView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_monkeyView]"
                                                                     options:0
                                                                     metrics:nil
                                                                       views:NSDictionaryOfVariableBindings(_monkeyView)]];
    [rootView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_monkeyView]|"
                                                                     options:0
                                                                     metrics:nil
                                                                       views:NSDictionaryOfVariableBindings(_monkeyView)]];
    [rootView addConstraint:[NSLayoutConstraint constraintWithItem:_monkeyView
                                                         attribute:NSLayoutAttributeHeight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_monkeyView
                                                         attribute:NSLayoutAttributeWidth
                                                        multiplier:1.0f
                                                          constant:0.0f]];
    _bananaView = [[BananaView alloc] init];
    _bananaView.translatesAutoresizingMaskIntoConstraints = NO;
    _bananaView.banana = [[Banana alloc] init];
    [rootView addSubview:_bananaView];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureDetected:)];
    [_bananaView addGestureRecognizer:pan];
    
    [rootView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_bananaView(==200)]|"
                                                                     options:0
                                                                     metrics:nil
                                                                       views:NSDictionaryOfVariableBindings(_bananaView)]];
    [rootView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_bananaView(==200)]"
                                                                     options:0
                                                                     metrics:nil
                                                                       views:NSDictionaryOfVariableBindings(_bananaView)]];
    [rootView addConstraint:[NSLayoutConstraint constraintWithItem:_bananaView
                                                         attribute:NSLayoutAttributeCenterX
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:rootView
                                                         attribute:NSLayoutAttributeCenterX
                                                        multiplier:1.0f
                                                          constant:0.0f]];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)panGestureDetected:(UIPanGestureRecognizer *)pan
{
    switch (pan.state)
    {
        case UIGestureRecognizerStateBegan:

            break;
            
        case UIGestureRecognizerStateChanged:
        {
            CGPoint p = [pan translationInView:self.view];
            pan.view.transform = CGAffineTransformMakeTranslation(p.x * 2, p.y * 2);
        }
            break;
            
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateFailed:
        {
            [_monkeyView.monkey eat:_bananaView.banana];
            pan.view.transform = CGAffineTransformIdentity;
        }
            
        default:
            break;
    }
}

@end
