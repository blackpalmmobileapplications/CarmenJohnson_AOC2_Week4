//
//  ViewController.h
//  CarmenJohnson_AOC2_Week4
//
//  Created by Carmen Johnson on 2/28/13.
//  Copyright (c) 2013 Carmen Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondViewController.h"

@interface ViewController : UIViewController <SecondViewDelegate>
{
    IBOutlet UITextView *_textView; // TextView
    
    IBOutlet UILabel *_swipe; // Swipe Label
    UISwipeGestureRecognizer *_rightSwipe;
}

-(IBAction)_save:(id)sender; // Save

@end