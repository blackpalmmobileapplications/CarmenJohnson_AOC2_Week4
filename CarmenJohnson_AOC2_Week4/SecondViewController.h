//
//  SecondViewController.h
//  CarmenJohnson_AOC2_Week4
//
//  Created by Carmen Johnson on 2/28/13.
//  Copyright (c) 2013 Carmen Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>

// Delegate that takes the new event back to the ViewController text view.
@protocol SecondViewDelegate <NSObject>

@required
-(void)eventSaved:(NSString*)_eventSaved dateSaved:(NSDate *)_dateSaved;

@end

@interface SecondViewController : UIViewController <UITextFieldDelegate, UIPickerViewDelegate>
{
    IBOutlet UITextField *eventText; // TextField
    IBOutlet UIDatePicker *_date; // Date picker
    
    id<SecondViewDelegate> delegate; // Creates SecondViewDelegate
    
    NSString *_eventSaved;
    NSDate *_dateSaved;
    
    IBOutlet UILabel *_swipe; // Swipe Label
    UISwipeGestureRecognizer *_leftSwipe;
}

-(IBAction)closeKeyboard:(id)sender; //close
-(IBAction)_picker:(id)sender;  //picker

// Allows you to set the delegate from outside
@property (strong) id<SecondViewDelegate> delegate;
@end
