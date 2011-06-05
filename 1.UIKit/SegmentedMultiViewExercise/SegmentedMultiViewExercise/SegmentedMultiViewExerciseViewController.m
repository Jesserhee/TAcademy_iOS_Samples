//
//  SegmentedMultiViewExerciseViewController.m
//  SegmentedMultiViewExercise
//
//  Created by wannabewize on 3/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SegmentedMultiViewExerciseViewController.h"

@implementation SegmentedMultiViewExerciseViewController

- (void)dealloc
{
    [pageChangeControl release];
    [contentsContainer release];
    [first release];
    [second release];
    [third release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[pageChangeControl addTarget:self action:@selector(onSegmentChanged:) forControlEvents:UIControlEventValueChanged];	
	[self onSegmentChanged:pageChangeControl];	
}

- (void)viewDidUnload
{
    [pageChangeControl release];
    pageChangeControl = nil;
    [contentsContainer release];
    contentsContainer = nil;
    [first release];
    first = nil;
    [second release];
    second = nil;
    [third release];
    third = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)onSegmentChanged:(id)sender {
	UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;	
	NSInteger selectedIndex = segmentedControl.selectedSegmentIndex;

	[UIView beginAnimations:nil context:NULL];
	UIViewAnimationTransition transitionEffect = currentViewIndex < selectedIndex ? UIViewAnimationTransitionFlipFromRight : UIViewAnimationTransitionFlipFromLeft;
	[UIView setAnimationTransition:transitionEffect forView:contentsContainer cache:NO];
	[UIView setAnimationDuration:0.7];
	
	[currentView removeFromSuperview];
	
	switch (selectedIndex) {
		case 0:			
			currentView = first;
			break;
		case 1:			
			currentView = second;
			break;
		default:
			currentView = third;
			break;
	}
	
	currentViewIndex = selectedIndex;
	[contentsContainer addSubview:currentView];
	
	[UIView commitAnimations];
}

@end
