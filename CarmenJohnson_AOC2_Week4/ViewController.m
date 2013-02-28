//
//  ViewController.m
//  CarmenJohnson_AOC2_Week4
//
//  Created by Carmen Johnson on 2/28/13.
//  Copyright (c) 2013 Carmen Johnson. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    // Loads user saved data
    NSUserDefaults *_userEventSaves = [NSUserDefaults standardUserDefaults];
    if (_userEventSaves != nil)
    {
        NSString *_eventSaved = [_userEventSaves objectForKey:@"event"];
        
        _textView.text = _eventSaved;
    }
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
    
    [super viewDidAppear:animated];
}

-(void)viewWillAppear:(BOOL)animated
{
    _rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(_onSwipe:)];
    _rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    [_swipe addGestureRecognizer:_rightSwipe];
    
    [super viewWillAppear:animated];
}

// Switch to SecondViewController (Add Event page)
-(void)_onSwipe:(UISwipeGestureRecognizer*)recognizer
{
    SecondViewController *_switchPage = [[SecondViewController alloc] initWithNibName:@"SecondView" bundle:nil];
    if (_switchPage != nil)
    {
        _switchPage.delegate = self;
        
        [self presentViewController:_switchPage animated:true completion:nil];
        NSLog(@"Swiped Right");
    }
}

-(void)eventSaved:(NSString*)_eventSaved dateSaved:(NSDate *)_dateSaved
{
    // \n represents a new line (spaces) between events
    NSString *eventText = [NSString stringWithFormat:@"\n\n%@\n%@", _eventSaved, _dateSaved];
    
    if ([_textView.text isEqualToString:@""])
    {
        _textView.text = [NSString stringWithFormat:@"%@\n%@", _eventSaved, _dateSaved];
    }
    else
    {
        _textView.text = [_textView.text stringByAppendingString:eventText];
    }
}

// Save Function
-(IBAction)_save:(id)sender
{
    NSUserDefaults *_eventSaved = [NSUserDefaults standardUserDefaults];
    if (_eventSaved != nil)
    {
        NSString *_saved = _textView.text;
        
        [_eventSaved setObject:_saved forKey:@"event"];
        
        // Saves the data
        [_eventSaved synchronize];
    }
}

@end
