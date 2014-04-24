//
//  ViewController.h
//  RatingTest
//
//  Created by cyh on 14-4-24.
//  Copyright (c) 2014年 cyh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RatingView.h"

@interface ViewController : UIViewController <RatingViewDelegate>
{
    IBOutlet RatingView *_ratingView;
    IBOutlet UILabel *_label;
}
@end
