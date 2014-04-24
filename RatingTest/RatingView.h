//
//  RateView.h
//  Tmart
//
//  Created by zongteng on 11-6-29.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RatingViewDelegate
@optional
-(void)ratingChanged:(float)newRating;
@end

@interface RatingView : UIView
{
}
@property (nonatomic, assign) BOOL isEnable;

-(void)setImagesDeselected:(NSString *)unselectedImage partlySelected:(NSString *)partlySelectedImage 
			  fullSelected:(NSString *)fullSelectedImage andDelegate:(id<RatingViewDelegate>)delegate;

-(void)displayRating:(float)rating;
-(float)rating;

@end
