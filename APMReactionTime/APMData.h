//
//  APMData.h
//  APMReactionTime
//
//  Created by Ana Mei on 5/3/13.
//  Copyright (c) 2013 Ana Mei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface APMData : NSObject{
    NSMutableArray *times;
}

@property (nonatomic, retain) NSMutableArray *times;
+ (APMData *)sharedInstance;

@end

