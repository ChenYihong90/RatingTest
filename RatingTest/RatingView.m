//
//  RateView.m
//  Tmart
//
//  Created by zongteng on 11-6-29.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "RatingView.h"

@interface RatingView()
{
    UIImageView *s1;
    UIImageView *s2;
    UIImageView *s3;
    UIImageView *s4;
    UIImageView *s5;
    
    UIImage *_unselectedImage;
    UIImage *_partlySelectedImage;
    UIImage *_fullySelectedImage;
    
	id<RatingViewDelegate> viewDelegate;
    
	float viewRating;
	float height, width;
}
@end


@implementation RatingView
@synthesize isEnable;

-(void)setImagesDeselected:(NSString *)deselectedImage
			partlySelected:(NSString *)halfSelectedImage
			  fullSelected:(NSString *)fullSelectedImage
			   andDelegate:(id<RatingViewDelegate>)delegate
{
    self.backgroundColor = [UIColor clearColor];
    self.isEnable = NO;
    
	_unselectedImage = [UIImage imageNamed:deselectedImage];
	_partlySelectedImage = [UIImage imageNamed:halfSelectedImage];
	_fullySelectedImage = [UIImage imageNamed:fullSelectedImage];
	viewDelegate = delegate;
	
	height=0.0; width=0.0;
	if (height < [_fullySelectedImage size].height) {
		height = [_fullySelectedImage size].height;
	}
	if (height < [_partlySelectedImage size].height) {
		height = [_partlySelectedImage size].height;
	}
	if (height < [_unselectedImage size].height) {
		height = [_unselectedImage size].height;
	}
    
	if (width < [_fullySelectedImage size].width) {
		width = [_fullySelectedImage size].width;
	}
	if (width < [_partlySelectedImage size].width) {
		width = [_partlySelectedImage size].width;
	}
	if (width < [_unselectedImage size].width) {
		width = [_unselectedImage size].width;
	}
    
    viewRating = 0;
	s1 = [[UIImageView alloc] initWithImage:_unselectedImage];
	s2 = [[UIImageView alloc] initWithImage:_unselectedImage];
	s3 = [[UIImageView alloc] initWithImage:_unselectedImage];
	s4 = [[UIImageView alloc] initWithImage:_unselectedImage];
	s5 = [[UIImageView alloc] initWithImage:_unselectedImage];
    
    [s1 setFrame:CGRectMake(0,         0, width, height)];
	[s2 setFrame:CGRectMake(width,     0, width, height)];
	[s3 setFrame:CGRectMake(2 * width, 0, width, height)];
	[s4 setFrame:CGRectMake(3 * width, 0, width, height)];
	[s5 setFrame:CGRectMake(4 * width, 0, width, height)];
	
	[s1 setUserInteractionEnabled:NO];
	[s2 setUserInteractionEnabled:NO];
	[s3 setUserInteractionEnabled:NO];
	[s4 setUserInteractionEnabled:NO];
	[s5 setUserInteractionEnabled:NO];
	
	[self addSubview:s1];
	[self addSubview:s2];
	[self addSubview:s3];
	[self addSubview:s4];
	[self addSubview:s5];
	
	CGRect frame = [self frame];
	frame.size.width = width * 5;
	frame.size.height = height;
	[self setFrame:frame];
}

-(void)displayRating:(float)rating
{
	[s1 setImage:_unselectedImage];
	[s2 setImage:_unselectedImage];
	[s3 setImage:_unselectedImage];
	[s4 setImage:_unselectedImage];
	[s5 setImage:_unselectedImage];
    
    //0-0.5
    if (rating >= 0 && rating < 0.5) {
        [s1 setImage:_unselectedImage];
    }
    
    //0.5-1
    if (rating >= 0.5 && rating < 1) {
        [s1 setImage:_partlySelectedImage];
    }
    
    //1-1.5
    if (rating >= 1 && rating < 1.5) {
        [s1 setImage:_fullySelectedImage];
        [s2 setImage:_unselectedImage];
    }
    
    //1.5-2.0
    if (rating >= 1.5 && rating < 2.0) {
        [s1 setImage:_fullySelectedImage];
   		[s2 setImage:_partlySelectedImage];
    }
    
    //2.0-2.5
   	if (rating >= 2 && rating < 2.5) {
        [s1 setImage:_fullySelectedImage];
        [s2 setImage:_fullySelectedImage];
        [s3 setImage:_unselectedImage];
    }
    
    //2.5-3.0
   	if (rating >= 2.5 && rating < 3.0) {
        [s1 setImage:_fullySelectedImage];
        [s2 setImage:_fullySelectedImage];
        [s3 setImage:_partlySelectedImage];
    }
    
    //3.0-3.5
    if (rating >= 3 && rating < 3.5) {
        [s1 setImage:_fullySelectedImage];
        [s2 setImage:_fullySelectedImage];
        [s3 setImage:_fullySelectedImage];
        [s4 setImage:_unselectedImage];
    }
    
    //3.5-4.0
    if (rating >= 3.5 && rating < 4.0) {
        [s1 setImage:_fullySelectedImage];
        [s2 setImage:_fullySelectedImage];
        [s3 setImage:_fullySelectedImage];
        [s4 setImage:_partlySelectedImage];
    }
    
    //4.0-4.5
    if (rating >= 4 && rating <= 4.5) {
        [s1 setImage:_fullySelectedImage];
        [s2 setImage:_fullySelectedImage];
        [s3 setImage:_fullySelectedImage];
        [s4 setImage:_fullySelectedImage];
        [s5 setImage:_unselectedImage];
    }
    
    //4.5-5.0
    if (rating > 4 && rating <= 4.5) {
        [s1 setImage:_fullySelectedImage];
        [s2 setImage:_fullySelectedImage];
        [s3 setImage:_fullySelectedImage];
        [s4 setImage:_fullySelectedImage];
        [s5 setImage:_partlySelectedImage];
   	}
    
    //5.0
   	if (rating == 5.0) {
        [s1 setImage:_fullySelectedImage];
        [s2 setImage:_fullySelectedImage];
        [s3 setImage:_fullySelectedImage];
        [s4 setImage:_fullySelectedImage];
        [s5 setImage:_fullySelectedImage];
    }
    
    
    //    if (rating > 0 && rating <= 0.5) {
    //        [s1 setImage:_partlySelectedImage];
    //    }
    //	if (rating > 0.5) {
    //		[s1 setImage:_fullySelectedImage];
    //	}
    //	if (rating > 1 && rating <= 1.5) {
    //        [s2 setImage:_partlySelectedImage];
    //    }
    //	if (rating > 1.5) {
    //		[s2 setImage:_fullySelectedImage];
    //	}
    //	if (rating > 2 && rating <= 2.5) {
    //        [s3 setImage:_partlySelectedImage];
    //    }
    //	if (rating > 2.5) {
    //		[s3 setImage:_fullySelectedImage];
    //	}
    //	if (rating > 3 && rating <= 3.5) {
    //        [s4 setImage:_partlySelectedImage];
    //    }
    //	if (rating > 3.5) {
    //		[s4 setImage:_fullySelectedImage];
    //	}
    //	if (rating > 4 && rating <= 4.5) {
    //        [s5 setImage:_partlySelectedImage];
    //    }
    //	if (rating == 5) {
    //		[s5 setImage:_fullySelectedImage];
    //	}
    
	viewRating = rating;
	[viewDelegate ratingChanged:rating];
}

-(float)rating
{
	return viewRating;
}

- (float)getNewRatingWithRating:(float)rating
{
    if (rating == 0) {
        return 0;
    }
    else if (rating > 0 && rating <= 0.5) {
        return 0.5;
    }
    else if (rating > 0.5 && rating <=1) {
        return 1;
    }
    else if (rating > 1 && rating <= 1.5) {
        return 1.5;
    }
    else if (rating > 1.5 && rating <=2) {
        return 2;
    }
    else if (rating > 2 && rating <= 2.5) {
        return 2.5;
    }
    else if (rating > 2.5 && rating <=3) {
        return 3;
    }
    else if (rating > 3 && rating <= 3.5) {
        return 3.5;
    }
    else if (rating > 3.5 && rating <=4) {
        return 4;
    }
    else if (rating > 4 && rating <= 4.5) {
        return 4.5;
    }
    else if (rating > 4.5 && rating <=5) {
        return 5;
    }
    else {
        return 5;
    }
    
//    if (rating >= 0 && rating < 0.5) {
//        return 0.0;
//    }
//    else if (rating >= 0.5 && rating <1) {
//        return 0.5;
//    }
//    else if (rating >= 1.0 && rating < 1.5) {
//        return 1.0;
//    }
//    else if (rating >= 1.5 && rating < 2.0) {
//        return 1.5;
//    }
//    else if (rating >= 2.0 && rating <= 2.5) {
//        return 2.0;
//    }
//    else if (rating >= 2.5 && rating < 3.0) {
//        return 2.5;
//    }
//    else if (rating >= 3.0 && rating < 3.5) {
//        return 3.0;
//    }
//    else if (rating >= 3.5 && rating < 4.0) {
//        return 3.5;
//    }
//    else if (rating >= 4 && rating < 4.5) {
//        return 4.0;
//    }
//    else if (rating >= 4.5 && rating <5.0) {
//        return 4.5;
//    }
//    else {
//        return 5.0;
//    }
}

#pragma mark touch
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self touchesMoved:touches withEvent:event];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(!isEnable) return;
    
	CGPoint pt = [[touches anyObject] locationInView:self];
	float newRating = [self getNewRatingWithRating:pt.x / width];
	if (newRating < 0 || newRating > 5){
		return;
    }
    
	if (newRating != viewRating){
		[self displayRating:newRating];
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self touchesMoved:touches withEvent:event];
}

@end

