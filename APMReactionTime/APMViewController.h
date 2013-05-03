//
//  APMViewController.h
//  APMReactionTime
//
//  Created by Ana Mei on 5/2/13.
//  Copyright (c) 2013 Ana Mei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APMViewController : UIViewController{
    NSDate *startDate;
}
@property (weak, nonatomic) IBOutlet UIButton *upButton;
@property (weak, nonatomic) IBOutlet UIButton *downButton;
@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
@property (weak, nonatomic) IBOutlet UIImageView *displayScreen;
@property (nonatomic, strong) NSArray *displayImages;
@property (nonatomic, copy) NSDate *startDate;
@property (nonatomic, strong) NSMutableArray* results;

- (IBAction)pressButton:(id)sender;

@end
