//
//  SecondViewController.m
//  CarmenJohnson_AOC2_Week4
//
//  Created by Carmen Johnson on 2/28/13.
//  Copyright (c) 2013 Carmen Johnson. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        delegate = nil;
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    // picker sets minimum date of the current date.
    NSDate *_minimum = [NSDate date];
    _date.minimumDate = _minimum;
    _dateSaved = [NSDate date];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

// Keyboard (show and hide)
- (void)viewWillAppear:(BOOL)animated
{
    // Show
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    // Hide
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    // swipe gestures
    _leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(_onSwipe:)];
    _leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [_swipe addGestureRecognizer:_leftSwipe];
    
    [super viewWillAppear:animated];
}

// Show
- (void)keyboardWillShow:(NSNotification *)notification
{
    
}

// Hide
- (void)keyboardWillHide:(NSNotification *)notification
{
    
}

// Close Keyboard
-(IBAction)closeKeyboard:(id)sender
{
    [eventText resignFirstResponder];
    NSLog(@"Close Keyboard Pressed");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Left swipe function
-(void)_onSwipe:(UISwipeGestureRecognizer*)recognizer
{
    // Populates text field
    _eventSaved = eventText.text;
    
    // Runs if there is no text in the field
    if ([eventText.text length] == 0)
    {
        // This is an alert if the text is not put in the text field.
        UIAlertView *_eventAlert = [[UIAlertView alloc] initWithTitle:@"This is not correct" message:@"Please Create An Event To Save." delegate:nil cancelButtonTitle:@"Continue" otherButtonTitles:nil];
        if (_eventAlert != nil)
        {
            [_eventAlert show];
        }
    }
    NSLog(@"Swiped Left");
    NSLog(@"%@", _eventSaved);
    
    // Grabs _eventSaved and _dateSaved
    [delegate eventSaved:_eventSaved dateSaved:_dateSaved];
    
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

// became first responder (delegate for textfield)
- (void)textFieldDidBeginEditing:(UITextField *)textField // Did Begin Editing
{
    textField.text = [NSString stringWithFormat:@""]; // clear out text when pressed
    NSLog(@"textField touched");
}


// Date Picker
-(IBAction)_picker:(id)sender
{
    UIDatePicker *picker = (UIDatePicker*)sender;
    if (picker != nil)
    {
        _dateSaved = picker.date;
        
        NSLog(@"date=%@", [_dateSaved description]); //displays the date in Output
    }
}

@end
