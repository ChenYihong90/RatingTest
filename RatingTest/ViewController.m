//
//  ViewController.m
//  RatingTest
//
//  Created by cyh on 14-4-24.
//  Copyright (c) 2014年 cyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [_ratingView setImagesDeselected:@"rate_0.png" partlySelected:@"rate_1.png" fullSelected:@"rate_2.png" andDelegate:self];
    [_ratingView displayRating:0.6];
    _ratingView.isEnable = YES;
    
    _label.text = [[NSString alloc] initWithFormat:@"评分：%.1f",[_ratingView rating]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark RatingViewDelegate
-(void)ratingChanged:(float)newRating
{
    _label.text = [[NSString alloc] initWithFormat:@"评分：%.1f",newRating];
}

@end
