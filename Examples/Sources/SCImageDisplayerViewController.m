//
//  SCImageViewDisPlayViewController.m
//  SCAudioVideoRecorder
//
//  Created by 曾 宪华 on 13-11-5.
//  Copyright (c) 2013年 rFlex. All rights reserved.
//

#import <Parse/Parse.h>
#import "SCImageDisplayerViewController.h"

@interface SCImageDisplayerViewController () {
}



@end

@implementation SCImageDisplayerViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;

    
    [self.filterSwitcherView setImageByUIImage:self.photo];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = YES;

}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self.filterSwitcherView setNeedsDisplay];
}


- (void)viewDidLoad
{

    [super viewDidLoad];
       NSLog(@"photo view");

    //status bar and buttons
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"                          " style:UIBarButtonItemStylePlain target:self action:@selector(didPressAddFriendsButton:)];
    [[UIBarButtonItem appearance] setTintColor:[UIColor whiteColor]];
//    self.navigationController.navigationBar.barStyle = UIStatusBarStyleLightContent;
    [[UIApplication sharedApplication] setStatusBarHidden:YES
                                            withAnimation:UIStatusBarAnimationFade];

//
//    
    self.filterSwitcherView.contentMode = UIViewContentModeScaleAspectFill;
    
//    self.filterSwitcherView.filterGroups = @[
//                                             [NSNull null],
//                                             [SCFilterGroup filterGroupWithFilter:[SCFilter filterWithName:@"CIPhotoEffectNoir"]],
//                                             [SCFilterGroup filterGroupWithFilter:[SCFilter filterWithName:@"CIPhotoEffectChrome"]],
//                                             [SCFilterGroup filterGroupWithFilter:[SCFilter filterWithName:@"CIPhotoEffectInstant"]],
//                                             [SCFilterGroup filterGroupWithFilter:[SCFilter filterWithName:@"CIPhotoEffectTonal"]],
//                                             [SCFilterGroup filterGroupWithFilter:[SCFilter filterWithName:@"CIPhotoEffectFade"]]
//                                             ];

	// Do any additional setup after loading the view.
    

    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    
    // pull up date selector automatically
    [self triggerDatePicker];
    datePicker.alpha = 0;


}

- (BOOL)prefersStatusBarHidden {
    return YES;
}


//ALERTS


//month alert
- (void)image:(UIImage *)image didFinishSavingMonthWithError:(NSError *)error contextInfo:(void *)contextInfo {
    if (error == nil) {
        // Create Alert and set the delegate to listen events
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Nice!"
                                                        message:@"We'll return this in a month from now :)"
                                                       delegate:self
                                              cancelButtonTitle:nil
                                              otherButtonTitles:@"OK", nil];
        // Set the tag to alert unique among the other alerts.
        // So that you can find out later, which alert we are handling
        alert.tag = 100;
        [alert show];
        
    } else {
        [[[UIAlertView alloc] initWithTitle:@"Failed :(" message:error.localizedDescription delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }
    
}

//week alert
- (void)image:(UIImage *)image didFinishSavingWeekWithError:(NSError *)error contextInfo:(void *)contextInfo {
    if (error == nil) {
        // Create Alert and set the delegate to listen events
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Nice!"
                                                        message:@"We'll return this in a week from now :)"
                                                       delegate:self
                                              cancelButtonTitle:nil
                                              otherButtonTitles:@"OK", nil];
        // Set the tag to alert unique among the other alerts.
        // So that you can find out later, which alert we are handling
        alert.tag = 100;
        [alert show];
        
    } else {
        [[[UIAlertView alloc] initWithTitle:@"Failed :(" message:error.localizedDescription delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }
    
}

//day alert
- (void)image:(UIImage *)image didFinishSavingDayWithError:(NSError *)error contextInfo:(void *)contextInfo {
    if (error == nil) {
        // Create Alert and set the delegate to listen events
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Nice!"
                                                        message:@"We'll return this in a day from now :)"
                                                       delegate:self
                                              cancelButtonTitle:nil
                                              otherButtonTitles:@"OK", nil];
        // Set the tag to alert unique among the other alerts.
        // So that you can find out later, which alert we are handling
        alert.tag = 100;
        [alert show];
        
    } else {
        [[[UIAlertView alloc] initWithTitle:@"Failed :(" message:error.localizedDescription delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }
    
}

//hour alert
- (void)image:(UIImage *)image didFinishSavingHourWithError:(NSError *)error contextInfo:(void *)contextInfo {
    if (error == nil) {
        // Create Alert and set the delegate to listen events
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Nice!"
                                                        message:@"We'll return this in an hour from now :)"
                                                       delegate:self
                                              cancelButtonTitle:nil
                                              otherButtonTitles:@"OK", nil];
        // Set the tag to alert unique among the other alerts.
        // So that you can find out later, which alert we are handling
        alert.tag = 100;
        [alert show];
        
    } else {
        [[[UIAlertView alloc] initWithTitle:@"Failed :(" message:error.localizedDescription delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }
    
}

//custom alert
- (void)image:(UIImage *)image didFinishSavingCustomWithError:(NSError *)error contextInfo:(void *)contextInfo {
    if (error == nil) {
        // Create Alert and set the delegate to listen events
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Nice!"
                                                        message:[NSString stringWithFormat:@"We'll return this to you at %@", dateString]
                                                       delegate:self
                                              cancelButtonTitle:nil
                                              otherButtonTitles:@"OK", nil];
        // Set the tag to alert unique among the other alerts.
        // So that you can find out later, which alert we are handling
        alert.tag = 100;
        [alert show];

        
    } else {
        [[[UIAlertView alloc] initWithTitle:@"Failed :(" message:error.localizedDescription delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }
    
}

//surprise alert
- (void)image:(UIImage *)image didFinishSavingSurpriseWithError:(NSError *)error contextInfo:(void *)contextInfo {
    if (error == nil) {
        // Create Alert and set the delegate to listen events
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Nice!"
                                                        message:@"We'll surprise you with this later :)"
                                                       delegate:self
                                              cancelButtonTitle:nil
                                              otherButtonTitles:@"OK", nil];
        // Set the tag to alert unique among the other alerts.
        // So that you can find out later, which alert we are handling
        alert.tag = 100;
        [alert show];
        
        
    } else {
        [[[UIAlertView alloc] initWithTitle:@"Failed :(" message:error.localizedDescription delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }
    
}



//ALERT BUTTON PRESS ACTION - CAN BE SAME FOR ALL ALERTS FROM THE TIME BUTTONS - SEND BACK TO CAMERA

-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    // Is this my Alert View?
    if (alertView.tag == 100) {
        //Yes
        
        // You need to compare 'buttonIndex' & 0 to other value(1,2,3) if u have more buttons.
        // Then u can check which button was pressed.
        if (buttonIndex == 0) {// 1st Other Button
            
            //go back to camera
            [self.navigationController popViewControllerAnimated:YES];
        }
        else if (buttonIndex == 1) {// 2nd Other Button
    
        }
    }
    
    else if (alertView.tag == 200) {
        //Yes
        
        // You need to compare 'buttonIndex' & 0 to other value(1,2,3) if u have more buttons.
        // Then u can check which button was pressed.
        if (buttonIndex == 0) {// 1st Other Button

            NSLog(@"Entered: %@",[[alertView textFieldAtIndex:0] text]);
            addNoteText = [[alertView textFieldAtIndex:0] text];
            
            if (addNoteText.length != 0){
                
                // 20 point top and left margin. Sized to leave 20 pt at right.

                _addNoteLabel.numberOfLines = 0; // allows label to have as many lines as needed
                _addNoteLabel.text = [NSString stringWithFormat:@"%@", addNoteText];
                _addNoteLabel.preferredMaxLayoutWidth = 300.0;
                [_addNoteLabel sizeToFit];
                
                self.addNoteTIcon.alpha = 0;
                
            
            }
            else {
            self.addNoteLabel.text = @"";
            self.addNoteTIcon.alpha = 1;
            }
        }
        else if (buttonIndex == 1) {// 2nd Other Button
            
        }
        
    }
    else {
        //No
        // Other Alert View
        
    }
    
}

- (void)saveToCameraRoll {
//    UIImage *image = [self.filterSwitcherView currentlyDisplayedImageWithScale:self.photo.scale orientation:self.photo.imageOrientation];
//    
//    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}





//CUSTOM DATE PICKER

-(void)triggerDatePicker {
    NSLog(@"pressed custom button");
    
    if ([self.view viewWithTag:9]) {
        return;
    }
    CGRect toolbarTargetFrame = CGRectMake(0, self.view.bounds.size.height-216-44-30, 320, 44);
    CGRect datePickerTargetFrame = CGRectMake(0, self.view.bounds.size.height-216-30, 320, 216);
    
    UIView *darkView = [[UIView alloc] initWithFrame:self.view.bounds];
    darkView.alpha = 0;
    darkView.backgroundColor = [UIColor blackColor];
    darkView.tag = 9;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissDatePicker:)];
    [darkView addGestureRecognizer:tapGesture];
    [self.view addSubview:darkView];
    
    datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height+44, 320, 216)];
    datePicker.tag = 10;
    [datePicker addTarget:self action:@selector(changeDate:) forControlEvents:UIControlEventValueChanged];
    datePicker.date =
    [[ NSDate alloc ] initWithTimeIntervalSinceNow: (NSTimeInterval) 2 ];
    datePicker.minimumDate =
    [[ NSDate alloc ] initWithTimeIntervalSinceNow: (NSTimeInterval) 0 ];
    
    [self.view addSubview:datePicker];
    
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, 320, 44)];
    toolBar.tag = 11;
    toolBar.alpha = 0;
    toolBar.barStyle = UIBarStyleBlackTranslucent;
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissDatePicker:)];
    [toolBar setItems:[NSArray arrayWithObjects:spacer, doneButton, nil]];
    [self.view addSubview:toolBar];
    
    
    [UIView beginAnimations:@"MoveIn" context:nil];
    toolBar.frame = toolbarTargetFrame;
    datePicker.frame = datePickerTargetFrame;
    darkView.alpha = 0;
    [UIView commitAnimations];
    
    
    
    [datePicker setValue:[UIColor whiteColor] forKeyPath:@"textColor"];
    
    SEL selector = NSSelectorFromString(@"setHighlightsToday:");
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDatePicker instanceMethodSignatureForSelector:selector]];
    BOOL no = NO;
    [invocation setSelector:selector];
    [invocation setArgument:&no atIndex:2];
    [invocation invokeWithTarget:datePicker];
    

}

- (void)dismissDatePicker:(id)sender {
    _hourButton.alpha = 1;
    _weekButton.alpha = 1;
    _dayButton.alpha = 1;
    _monthButton.alpha = 1;
    _surpriseButton.alpha = 1;
    _customTimeButton.alpha = 1;
    _customTimeSendButton.alpha = 0;
    datePicker.alpha = 0;
    
}



//date picker
- (void)changeDate:(UIDatePicker *)sender {
    NSLog(@"New Date: %@", sender.date);
    
    datePicked = sender.date;
    
}

- (void)removeViews:(id)object {
    [[self.view viewWithTag:9] removeFromSuperview];
    [[self.view viewWithTag:10] removeFromSuperview];
    [[self.view viewWithTag:11] removeFromSuperview];
}




//friends button
- (IBAction)didPressAddFriendsButton:(id)sender {
    
    NSLog(@"pressed friends button");
    PFUser *currentUser = [PFUser currentUser];
    
    //see if it's a user and anonymous
    if (currentUser) {
        if ([PFAnonymousUtils isLinkedWithUser:[PFUser currentUser]]) {
            NSLog(@"user is anonymous so make them sign up");
            [self performSegueWithIdentifier:@"signUpSegue" sender:sender];
        } else {
            NSLog(@"there is a user with username %@", currentUser);
            [self performSegueWithIdentifier:@"addFriendsSegue" sender:sender];
        }
    } else {
        // show the signup or login screen
        [self performSegueWithIdentifier:@"signUpSegue" sender:sender];
    }
}

//add note
- (IBAction)didPressAddNoteButton:(id)sender {
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Add a note to this photo" message:@"" delegate:self cancelButtonTitle:@"Done" otherButtonTitles:nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    alert.tag = 200;
    [alert show];
}


//custom send pressed
- (IBAction)didPressSendToFutureButton:(id)sender {
    //Do something
    NSLog(@"pressed select with date: %@", datePicked);
    
    //sc recorder code
    UIImage *image = [self.filterSwitcherView currentlyDisplayedImageWithScale:self.photo.scale orientation:self.photo.imageOrientation];
    
    
    //converting image file
    NSData *imageData = UIImageJPEGRepresentation(image, 0.9f);
    PFFile *imageFile = [PFFile fileWithName:@"comebackimage.png" data:imageData];
    
    //convert date to string
    dateString = [NSDateFormatter localizedStringFromDate:datePicked
                                                dateStyle:NSDateFormatterShortStyle
                                                timeStyle:NSDateFormatterFullStyle];
    NSLog(@"this is the date in string: %@", dateString);
    
    //uploading PFObject
    PFObject *timerImage = [PFObject objectWithClassName:@"TimerImage"];
    timerImage[@"image"] = imageFile;
    timerImage[@"comebacktime"] = datePicked;
    timerImage[@"delayType"] = @"Custom";
    if (addNoteText.length != 0) {
        timerImage[@"firstNote"] = addNoteText;
    }
    
    //uploading user info to photo
    PFUser *currentUser = [PFUser currentUser];
    timerImage[@"user"] = currentUser;
    timerImage[@"username"] = currentUser.username;
    NSLog(@"currentUser = %@", currentUser);
    
    [timerImage saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // The object has been saved.
        } else {
            // There was a problem, check error.description
        }
    }];
    

    
    //set local notification
    UILocalNotification* localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = datePicked;
    localNotification.alertBody = [NSString stringWithFormat:@"Your photo set to return at %@ is here",dateString];
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
    //save to photo album and trigger alert
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingCustomWithError:contextInfo:), nil);
    
    //clear note
    NSLog(@"before custom note clear: %@", addNoteText);
    addNoteText = @"";
    NSLog(@"after custom note clear: %@", addNoteText);
    
    //animate
    CGRect toolbarTargetFrame = CGRectMake(0, self.view.bounds.size.height, 320, 44);
    CGRect datePickerTargetFrame = CGRectMake(0, self.view.bounds.size.height+44, 320, 216);
    [UIView beginAnimations:@"MoveOut" context:nil];
    [self.view viewWithTag:9].alpha = 0;
    [self.view viewWithTag:10].frame = datePickerTargetFrame;
    [self.view viewWithTag:11].frame = toolbarTargetFrame;
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(removeViews:)];
    [UIView commitAnimations];
}




- (IBAction)didPressSurprise:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Surprise!"
                                                    message:@"Coming soon :)"
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

- (IBAction)didPressMonth:(id)sender {
    //date adding math
    NSDate *today = [[NSDate alloc] init];
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    
    //WHERE YOU SET THE TIME FROM NOW IN MONTHS
    [offsetComponents setMonth:1];
    NSDate *aMonthFromNow = [gregorian dateByAddingComponents:offsetComponents
                                                      toDate:today options:0];
    
    datePicker.date = aMonthFromNow;
    NSLog(@"a month from now: %@", aMonthFromNow);
    

        //sc recorder code
        UIImage *image = [self.filterSwitcherView currentlyDisplayedImageWithScale:self.photo.scale orientation:self.photo.imageOrientation];
        //converting image file
        NSData *imageData = UIImageJPEGRepresentation(image, 0.9f);
        PFFile *imageFile = [PFFile fileWithName:@"comebackimage.png" data:imageData];
    
    
        //uploading PFObject
        PFObject *timerImage = [PFObject objectWithClassName:@"TimerImage"];
        timerImage[@"image"] = imageFile;
        timerImage[@"comebacktime"] = aMonthFromNow;
        timerImage[@"delayType"] = @"One Month";
        if (addNoteText.length != 0) {
            timerImage[@"firstNote"] = addNoteText;
        }
    
        //uploading user info to photo
        PFUser *currentUser = [PFUser currentUser];
        timerImage[@"user"] = currentUser;
        timerImage[@"username"] = currentUser.username;
        NSLog(@"currentUser = %@", currentUser);
    
        [timerImage saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                // The object has been saved.
            } else {
                // There was a problem, check error.description
            }
        }];
    
        //set local notification
        UILocalNotification* localNotification = [[UILocalNotification alloc] init];
        localNotification.fireDate = aMonthFromNow;
        localNotification.alertBody = @"You have a new photo from 1 month ago";
        localNotification.timeZone = [NSTimeZone defaultTimeZone];
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
        //save to photo album and trigger alert
        UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingMonthWithError:contextInfo:), nil);
        
        //clear note
        NSLog(@"before month note clear: %@", addNoteText);
        addNoteText = @"";
        NSLog(@"after month note clear: %@", addNoteText);


}

- (IBAction)didPressWeek:(id)sender {
    //date adding math
    NSDate *today = [[NSDate alloc] init];
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    
    //WHERE YOU SET THE TIME FROM NOW IN MONTHS
    [offsetComponents setDay:7];
    NSDate *aWeekFromNow = [gregorian dateByAddingComponents:offsetComponents
                                                     toDate:today options:0];
    
    datePicker.date = aWeekFromNow;
    NSLog(@"a week from now: %@", aWeekFromNow);
    

        //sc recorder code
        UIImage *image = [self.filterSwitcherView currentlyDisplayedImageWithScale:self.photo.scale orientation:self.photo.imageOrientation];
    
    
        //converting image file
        NSData *imageData = UIImageJPEGRepresentation(image, 0.9f);
        PFFile *imageFile = [PFFile fileWithName:@"comebackimage.png" data:imageData];
    
    
        //uploading PFObject
        PFObject *timerImage = [PFObject objectWithClassName:@"TimerImage"];
        timerImage[@"image"] = imageFile;
        timerImage[@"comebacktime"] = aWeekFromNow;
        timerImage[@"delayType"] = @"One Week";
        if (addNoteText.length != 0) {
            timerImage[@"firstNote"] = addNoteText;
        }
    
        //uploading user info to photo
        PFUser *currentUser = [PFUser currentUser];
        timerImage[@"user"] = currentUser;
        timerImage[@"username"] = currentUser.username;
        NSLog(@"currentUser = %@", currentUser);
    
        [timerImage saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                // The object has been saved.
            } else {
                // There was a problem, check error.description
            }
        }];
    
        //set local notification
        UILocalNotification* localNotification = [[UILocalNotification alloc] init];
        localNotification.fireDate = aWeekFromNow;
        localNotification.alertBody = @"You have a new photo from 1 week ago";
        localNotification.timeZone = [NSTimeZone defaultTimeZone];
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
        //save to photo album and trigger alert
        UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWeekWithError:contextInfo:), nil);
        
        //clear note
        NSLog(@"before week note clear: %@", addNoteText);
        addNoteText = @"";
        NSLog(@"after week note clear: %@", addNoteText);

    

}

- (IBAction)didPressDay:(id)sender {
    //date adding math
    NSDate *today = [[NSDate alloc] init];
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    
    //WHERE YOU SET THE TIME FROM NOW IN MONTHS
    [offsetComponents setDay:1];
    NSDate *aDayFromNow = [gregorian dateByAddingComponents:offsetComponents
                                                       toDate:today options:0];
    
    datePicker.date = aDayFromNow;
    NSLog(@"a day from now: %@", aDayFromNow);

        //sc recorder code
        UIImage *image = [self.filterSwitcherView currentlyDisplayedImageWithScale:self.photo.scale orientation:self.photo.imageOrientation];
    
    
        //converting image file
        NSData *imageData = UIImageJPEGRepresentation(image, 0.9f);
        PFFile *imageFile = [PFFile fileWithName:@"comebackimage.png" data:imageData];
    
    
        //uploading PFObject
        PFObject *timerImage = [PFObject objectWithClassName:@"TimerImage"];
        timerImage[@"image"] = imageFile;
        timerImage[@"comebacktime"] = aDayFromNow;
        timerImage[@"delayType"] = @"One Day";
        if (addNoteText.length != 0) {
            timerImage[@"firstNote"] = addNoteText;
        }
    
        //uploading user info to photo
        PFUser *currentUser = [PFUser currentUser];
        timerImage[@"user"] = currentUser;
        timerImage[@"username"] = currentUser.username;
        NSLog(@"currentUser = %@", currentUser);
    
        [timerImage saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                // The object has been saved.
            } else {
                // There was a problem, check error.description
            }
        }];
    
        //set local notification
        UILocalNotification* localNotification = [[UILocalNotification alloc] init];
        localNotification.fireDate = aDayFromNow;
        localNotification.alertBody = @"You have a new photo from 1 day ago";
        localNotification.timeZone = [NSTimeZone defaultTimeZone];
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
        //save to photo album and trigger alert
        UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingDayWithError:contextInfo:), nil);
        
        //clear note
        NSLog(@"before day note clear: %@", addNoteText);
        addNoteText = @"";
        NSLog(@"after day note clear: %@", addNoteText);

}

- (IBAction)didPressHour:(id)sender {
        //date adding math
        NSDate *today = [[NSDate alloc] init];
        NSCalendar *gregorian = [[NSCalendar alloc]
                                 initWithCalendarIdentifier:NSGregorianCalendar];
        NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    
        //WHERE YOU SET THE TIME FROM NOW IN MONTHS
        [offsetComponents setHour:1];
        NSDate *anHourFromNow = [gregorian dateByAddingComponents:offsetComponents
                                                         toDate:today options:0];
    
        datePicker.date = anHourFromNow;
    NSLog(@"an hour from now: %@", anHourFromNow);
    

        //sc recorder code
        UIImage *image = [self.filterSwitcherView currentlyDisplayedImageWithScale:self.photo.scale orientation:self.photo.imageOrientation];
    
        //converting image file
        NSData *imageData = UIImageJPEGRepresentation(image, 0.9f);
        PFFile *imageFile = [PFFile fileWithName:@"comebackimage.png" data:imageData];
    
    
        //uploading PFObject
        PFObject *timerImage = [PFObject objectWithClassName:@"TimerImage"];
        timerImage[@"image"] = imageFile;
        timerImage[@"comebacktime"] = anHourFromNow;
        timerImage[@"delayType"] = @"One Hour";
        if (addNoteText.length != 0) {
            timerImage[@"firstNote"] = addNoteText;
        }
    
        //uploading user info to photo
        PFUser *currentUser = [PFUser currentUser];
        timerImage[@"user"] = currentUser;
        timerImage[@"username"] = currentUser.username;
        NSLog(@"currentUser = %@", currentUser);
    
        [timerImage saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                // The object has been saved.
            } else {
                // There was a problem, check error.description
            }
        }];
    
        //set local notification
        UILocalNotification* localNotification = [[UILocalNotification alloc] init];
        localNotification.fireDate = anHourFromNow;
        localNotification.alertBody = @"You have a new photo from 1 hour ago";
        localNotification.timeZone = [NSTimeZone defaultTimeZone];
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
        //save to photo album and trigger alert
        UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingHourWithError:contextInfo:), nil);
        
        //clear note
        NSLog(@"before hour note clear: %@", addNoteText);
        addNoteText = @"";
        NSLog(@"after hour note clear: %@", addNoteText);

}

- (IBAction)didPressCustomTime:(id)sender {
    _hourButton.alpha = 0;
    _weekButton.alpha = 0;
    _dayButton.alpha = 0;
    _monthButton.alpha = 0;
    _surpriseButton.alpha = 0;
    _customTimeButton.alpha = 0;
    _customTimeSendButton.alpha = 1;
    datePicker.alpha = 1;
}


@end
