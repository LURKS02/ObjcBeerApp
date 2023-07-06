//
//  LinePageControl.m
//  BeerApp
//
//  Created by 지혜 on 2023/06/27.
//

#import "LinePageControl.h"

@implementation LinePageControl

- (instancetype)initWithNumberOfItems:(NSInteger) numberOfItems
{
    self = [super init];
    if (self)
    {
        self.numberOfPages = numberOfItems;
        
        self.line = [[UIView alloc] init];
        self.line.backgroundColor = [UIColor colorWithWhite:1.0
                                                      alpha:0.5];
        
        self.activeLine = [[UIView alloc] init];
        self.activeLine.backgroundColor = [UIColor whiteColor];
        
        self.extraLine = [[UIView alloc] init];
        self.extraLine.backgroundColor = [UIColor whiteColor];
        
        [self addSubview: self.line];
        [self addSubview: self.activeLine];
        [self addSubview: self.extraLine];
        
        [self setupConstraints];
        
    }
    return self;
}

- (void)setupConstraints
{
    self.line.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:@[
        [self.line.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
        [self.line.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
        [self.line.topAnchor
         constraintEqualToAnchor:self.topAnchor],
        [self.line.bottomAnchor constraintEqualToAnchor:self.bottomAnchor]
    ]];
}

- (void)lineAnimationWithCurrentPage:(CGFloat)currentPage
{
    NSInteger numberOfPages = self.numberOfPages;
    CGFloat singleLineWidth = self.frame.size.width / self.numberOfPages;
    
    if (currentPage > numberOfPages)
    {
        if (currentPage == numberOfPages + 1)
        {
            self.activeLine.frame = self.extraLine.frame;
            self.extraLine.frame = CGRectZero;
        }
        else
        {
            CGFloat maxActiveLineWidth = self.bounds.size.width / self.numberOfPages;
            CGFloat overflow = (currentPage - numberOfPages) * maxActiveLineWidth;
            
            CGFloat newActiveLineWidth = maxActiveLineWidth - overflow;
            
            float activeX = (currentPage - 1) * maxActiveLineWidth;
            
            [UIView animateWithDuration:0.1 animations:^{
                self.activeLine.frame = CGRectMake(activeX,
                                                   0,
                                                   newActiveLineWidth,
                                                   self.frame.size.height);
                self.extraLine.frame = CGRectMake(0,
                                                  0,
                                                  overflow,
                                                  self.frame.size.height);
            }];
        }
    }
    
    else if (currentPage < 1)
    {
        if (currentPage == 0)
        {
            self.activeLine.frame = self.extraLine.frame;
            self.extraLine.frame = CGRectZero;
        }
        else
        {
            CGFloat maxActiveLineWidth = self.frame.size.width / self.numberOfPages;
            
            CGFloat overflow = (1 - currentPage) * maxActiveLineWidth;
            
            CGFloat newActiveLineWidth = maxActiveLineWidth - overflow;
            
            [UIView animateWithDuration:0.1 animations:^{
                self.activeLine.frame = CGRectMake(0,
                                                   0,
                                                   newActiveLineWidth,
                                                   self.frame.size.height);
                self.extraLine.frame = CGRectMake((self.frame.size.width - overflow),
                                                  0,
                                                  overflow,
                                                  self.frame.size.height);
            }];
        }
    }
    
    else {
        CGFloat activeX = (singleLineWidth)* currentPage;
        
        [UIView animateWithDuration:0.3 animations:^{
            self.activeLine.frame = CGRectMake(activeX - singleLineWidth, 0, singleLineWidth, self.bounds.size.height);
        }];
    }
}

@end
