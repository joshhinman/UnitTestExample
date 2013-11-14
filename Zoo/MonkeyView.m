//
//  MonkeyView.m
//  Zoo
//
//  Created by Josh Hinman on 11/13/13.
//  Copyright (c) 2013 Brightly, LLC. All rights reserved.
//

#import "Monkey.h"
#import "MonkeyView.h"

@implementation MonkeyView
{
    UIImageView *_imageView;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"monkey-hungry"]];
        _imageView.frame = self.bounds;
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:_imageView];
    }
    return self;
}

- (void)dealloc
{
    [_monkey removeObserver:self forKeyPath:@"hungry"];
}

- (void)setMonkey:(Monkey *)monkey
{
    [_monkey removeObserver:self forKeyPath:@"hungry"];
    _monkey = monkey;
    [monkey addObserver:self forKeyPath:@"hungry" options:NSKeyValueObservingOptionInitial context:NULL];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (object == _monkey && [keyPath isEqualToString:@"hungry"])
    {
        _imageView.image = _monkey.hungry ? [UIImage imageNamed:@"monkey-hungry"] : [UIImage imageNamed:@"monkey-full"];
    }
}

@end
