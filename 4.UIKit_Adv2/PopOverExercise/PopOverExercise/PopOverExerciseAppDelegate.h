//
//  PopOverExerciseAppDelegate.h
//  PopOverExercise
//
//  Created by wannabewize_air on 4/2/11.
//  Copyright 2011 iNEED. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PopOverExerciseViewController;

@interface PopOverExerciseAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet PopOverExerciseViewController *viewController;

@end
