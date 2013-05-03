//
//  APMViewController.m
//  APMReactionTime
//
//  Created by Ana Mei on 5/2/13.
//  Copyright (c) 2013 Ana Mei. All rights reserved.
//

#import "APMViewController.h"

@interface APMViewController ()

@end

@implementation APMViewController
@synthesize displayImages = _displayImages;
@synthesize startDate = _startDate;
@synthesize results = _results;

//a boolean to keep track of whether it's okay to press buttons
int pressOk = 0;
int imagesIndex = 0;

- (void) awakeFromNib
{
    
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hit Start to Play!" message:@"Watch the screen carefully. Press the matching button as soon as possible."
    delegate:self cancelButtonTitle:@"Play" otherButtonTitles: nil];
	[alert show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
	self.displayScreen.image = [UIImage imageNamed:@"bg_yellow.png"];
	
	[NSTimer scheduledTimerWithTimeInterval:(3.0) target:self selector:@selector(onYellowLightTimer) userInfo:nil repeats:NO];
}

- (void)onYellowLightTimer
{
	self.displayScreen.image = [UIImage imageNamed:@"bg_red.png"];
	
	int delay = ((int) (random() % 7) + 1);
    
	[NSTimer scheduledTimerWithTimeInterval:(3.0 + delay) target:self selector:@selector(onRedLightTimer) userInfo:nil repeats:NO];
}

- (void)onRedLightTimer
{
    imagesIndex = ((int)random() % (4));
    
    [self.displayScreen setImage:[UIImage imageNamed:[self.displayImages objectAtIndex:imagesIndex]]];
    
    pressOk = 1;
    
    self.startDate = [NSDate date];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[self view] setBackgroundColor: [UIColor colorWithPatternImage: [UIImage imageNamed:@"bluebg.png"]]];
    self.displayImages = [[NSArray alloc] initWithObjects:@"bg_up.png",@"bg_down.png",@"bg_right.png",@"bg_left.png", nil];
    self.results = [[NSMutableArray alloc] init];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressButton:(id)sender {
    
    NSString *reactionTime = @"";
    //double timepassed = (double) [[NSDate date]timeIntervalSinceDate:self.startDate] * -1000;
    
    double noSeconds = (double) [self.startDate timeIntervalSinceNow] * -1000;
    NSNumber *num = [NSNumber numberWithFloat:noSeconds];
    [self.results addObject:num];
    
    APMData *data = [APMData sharedInstance];
    data.times = self.results;
    
    NSLog(@"time = %d", [data.times count]);
    
    NSString *title = [(UIButton *)sender currentTitle];
    int check = [title intValue];
    
    if(pressOk == 0){
		reactionTime = @"Hold it! You have to wait until the arrow shows up!";
    }
    else{
        if(check == imagesIndex){
            reactionTime= [[NSString alloc] initWithFormat:@"Good Job! You're reaction time is %f milliseconds. Let's see if you can do better...", noSeconds];
        }
        else{
            reactionTime = [[NSString alloc] initWithFormat:@"Sorry! You pressed the wrong button! Please try again!"];
        
        }
	}
	
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Reaction Time" message:reactionTime
        delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
	[alert show];
    
}
@end
