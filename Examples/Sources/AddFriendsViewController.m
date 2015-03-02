//
//  AddFriendsViewController.m
//  SCRecorderExamples
//
//  Created by Will Dennis on 3/2/15.
//
//

#import "AddFriendsViewController.h"


@interface AddFriendsViewController ()

@end

@implementation AddFriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[UIApplication sharedApplication] setStatusBarHidden:YES
                                            withAnimation:UIStatusBarAnimationFade];


}
- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didPressLogOutButton:(id)sender {
    [PFUser logOut];
    PFUser *currentUser = [PFUser currentUser]; //should be nil now
}
@end
