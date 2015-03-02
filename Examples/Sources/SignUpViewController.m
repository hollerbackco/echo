//
//  SignUpViewController.m
//  SCRecorderExamples
//
//  Created by Will Dennis on 3/2/15.
//
//

#import "SignUpViewController.h"
#import <Parse/Parse.h>

@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES
                                            withAnimation:UIStatusBarAnimationFade];
    
}

//close ekyboard when touching outside of text field
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)didPressSignUpButton:(id)sender {
    //shut keyboard
    [self.view endEditing:YES];

    
    NSLog(@"user name : %@", _userFullName.text);
    NSLog(@"email : %@", _userEmail.text);
    NSLog(@"phone : %@", _userPhoneNumber.text);
    NSLog(@"password : %@", _userPassword.text);
    
    NSString *pFullName = _userFullName.text;
    NSString *pEmail = _userEmail.text;
    NSString *pPhone = _userPhoneNumber.text;
    NSString *pPassword = _userPassword.text;
    
    
    
    PFUser *user = [PFUser user];
    user.username = pFullName;
    user.password = pPassword;
    user.email = pEmail;
    
    // other fields can be set just like with PFObject
    user[@"phone"] = pPhone;
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            NSLog(@"%@ just successfully signed up!", pFullName);
            [self performSegueWithIdentifier:@"dismissSignUp" sender:sender];
            
            // Hooray! Let them use the app now.
        } else {
            NSString *errorString = [error userInfo][@"error"];
            NSLog(@"%@ just FAILED sign up", pFullName);

            // Show the errorString somewhere and let the user try again.
        }
    }];
}

- (IBAction)fullNameFinishEdit:(id)sender {
    [sender becomeFirstResponder];
    [sender resignFirstResponder];
}

- (IBAction)emailFinishEdit:(id)sender {
    [sender becomeFirstResponder];
    [sender resignFirstResponder];
}

- (IBAction)phoneNumberFinishEdit:(id)sender {
    [sender becomeFirstResponder];
    [sender resignFirstResponder];
}

- (IBAction)passwordFinishEdit:(id)sender {
    [sender becomeFirstResponder];
    [sender resignFirstResponder];
}
@end
