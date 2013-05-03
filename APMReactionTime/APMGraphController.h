//
//  APMGraphController.h
//  APMReactionTime
//
//  Created by Ana Mei on 5/3/13.
//  Copyright (c) 2013 Ana Mei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CorePlot-CocoaTouch.h" 

@interface APMGraphController : UIViewController <CPTPlotDataSource>


    @property (nonatomic, strong) CPTGraphHostingView *hostView;


@end
