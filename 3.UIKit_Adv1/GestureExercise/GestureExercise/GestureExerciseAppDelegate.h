//
//  GestureExerciseAppDelegate.h
//  GestureExercise
//
//  Created by wannabewize_air on 4/22/11.
//  Copyright 2011 iNEED. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GestureExerciseViewController;

@interface GestureExerciseAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet GestureExerciseViewController *viewController;

@end
