//
//  BananaView.m
//  Zoo
//
//  Created by Josh Hinman on 11/14/13.
//  Copyright (c) 2013 Brightly, LLC. All rights reserved.
//

#import "Banana.h"
#import "BananaView.h"

@implementation BananaView
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

- (void)setBanana:(Banana *)banana
{
    [_banana removeObserver:self forKeyPath:@"eaten"];
    _banana = banana;
    [banana addObserver:self forKeyPath:@"eaten" options:NSKeyValueObservingOptionInitial context:NULL];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (object == _banana && [keyPath isEqualToString:@"eaten"])
    {
        _imageView.image = _banana.eaten ? [UIImage imageNamed:@"banana-peel"] : [UIImage imageNamed:@"banana"];
    }
}

@end
