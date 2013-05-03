//
//  APMData.m
//  APMReactionTime
//
//  Created by Ana Mei on 5/3/13.
//  Copyright (c) 2013 Ana Mei. All rights reserved.
//

#import "APMData.h"

@interface APMData ()

@end

@implementation APMData
@synthesize times;
static APMData *instance =nil;
#pragma mark - Class methods

+ (APMData *)sharedInstance
{
    @synchronized(self)
    {
        if(instance==nil)
        {
            
            instance= [APMData new];
        }
    }
    return instance;
}

@end
