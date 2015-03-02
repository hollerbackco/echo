//
//  SignUpViewController.h
//  SCRecorderExamples
//
//  Created by Will Dennis on 3/2/15.
//
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userFullName;
@property (weak, nonatomic) IBOutlet UITextField *userEmail;
@property (weak, nonatomic) IBOutlet UITextField *userPhoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *userPassword;
- (IBAction)didPressSignUpButton:(id)sender;

- (IBAction)fullNameFinishEdit:(id)sender;
- (IBAction)emailFinishEdit:(id)sender;
- (IBAction)phoneNumberFinishEdit:(id)sender;
- (IBAction)passwordFinishEdit:(id)sender;

@end
