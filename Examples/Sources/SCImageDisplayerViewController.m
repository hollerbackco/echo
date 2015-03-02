//
//  SCImageViewDisPlayViewController.m
//  SCAudioVideoRecorder
//
//  Created by 曾 宪华 on 13-11-5.
//  Copyright (c) 2013年 rFlex. All rights reserved.
//

#import <Parse/Parse.h>
#import "SCImageDisplayerViewController.h"
#import "RMDateSelectionViewController.h"

@interface SCImageDisplayerViewController () <RMDateSelectionViewControllerDelegate> {
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
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"                          " style:UIBarButtonItemStylePlain target:self action:@selector(didPressAddNoteButton:)];
    [[UIBarButtonItem appearance] setTintColor:[UIColor whiteColor]];
//    self.navigationController.navigationBar.barStyle = UIStatusBarStyleLightContent;
    [[UIApplication sharedApplication] setStatusBarHidden:YES
                                            withAnimation:UIStatusBarAnimationFade];


    
    self.filterSwitcherView.contentMode = UIViewContentModeScaleAspectFill;
    
    self.filterSwitcherView.filterGroups = @[
                                             [NSNull null],
                                             [SCFilterGroup filterGroupWithFilter:[SCFilter filterWithName:@"CIPhotoEffectNoir"]],
                                             [SCFilterGroup filterGroupWithFilter:[SCFilter filterWithName:@"CIPhotoEffectChrome"]],
                                             [SCFilterGroup filterGroupWithFilter:[SCFilter filterWithName:@"CIPhotoEffectInstant"]],
                                             [SCFilterGroup filterGroupWithFilter:[SCFilter filterWithName:@"CIPhotoEffectTonal"]],
                                             [SCFilterGroup filterGroupWithFilter:[SCFilter filterWithName:@"CIPhotoEffectFade"]]
                                             ];

	// Do any additional setup after loading the view.
    

    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    
    // pull up date selector automatically
//    RMDateSelectionViewController *dateSelectionVC = [RMDateSelectionViewController dateSelectionController];
//    dateSelectionVC.delegate = self;
//    
//    [dateSelectionVC show];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}


//ALERTS

//camera save alert
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    if (error == nil) {
        [[[UIAlertView alloc] initWithTitle:@"Done!" message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    } else {
        [[[UIAlertView alloc] initWithTitle:@"Failed :(" message:error.localizedDescription delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }
    
}

//year alert
- (void)image:(UIImage *)image didFinishSavingYearWithError:(NSError *)error contextInfo:(void *)contextInfo {
    if (error == nil) {
        // Create Alert and set the delegate to listen events
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Nice!"
                                                        message:@"We'll return this in a year from now :)"
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


// TIME FROM NOW BUTTONS


//year from now button
- (IBAction)oneYearButton:(UIButton *)sender {
    
    //sc recorder code
    UIImage *image = [self.filterSwitcherView currentlyDisplayedImageWithScale:self.photo.scale orientation:self.photo.imageOrientation];

    //date adding math
    NSDate *today = [[NSDate alloc] init];
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    
    //WHERE YOU SET THE TIME FROM NOW IN HOURS
    [offsetComponents setHour:8760];
    NSDate *aYearFromNow = [gregorian dateByAddingComponents:offsetComponents
                                                       toDate:today options:0];
    
    //converting image file
    NSData *imageData = UIImageJPEGRepresentation(image, 0.9f);
    PFFile *imageFile = [PFFile fileWithName:@"comebackimage.png" data:imageData];
    
    //trying to grab text
    NSLog(@"Entered: %@", addNoteText);
    
    
    //uploading PFObject
    PFObject *timerImage = [PFObject objectWithClassName:@"TimerImage"];
    timerImage[@"image"] = imageFile;
    timerImage[@"comebacktime"] = aYearFromNow;
    timerImage[@"delayType"] = @"One Year";
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
    localNotification.fireDate = aYearFromNow;
    localNotification.alertBody = @"You have a new photo from 1 year ago";
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
    //save to photo album and trigger alert
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingYearWithError:contextInfo:), nil);
    
    //clear note
    NSLog(@"before year note clear: %@", addNoteText);
    addNoteText = @"";
    NSLog(@"after year note clear: %@", addNoteText);
    
}

//month from now button
- (IBAction)oneMonthButton:(UIButton *)sender {
    //sc recorder code
    UIImage *image = [self.filterSwitcherView currentlyDisplayedImageWithScale:self.photo.scale orientation:self.photo.imageOrientation];
    
    //date adding math
    NSDate *today = [[NSDate alloc] init];
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    
    //WHERE YOU SET THE TIME FROM NOW IN MONTHS
    [offsetComponents setMonth:1];
    NSDate *aMonthFromNow = [gregorian dateByAddingComponents:offsetComponents
                                                      toDate:today options:0];
    
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

//week from now button
- (IBAction)oneWeekButton:(UIButton *)sender {
    //sc recorder code
    UIImage *image = [self.filterSwitcherView currentlyDisplayedImageWithScale:self.photo.scale orientation:self.photo.imageOrientation];
    
    //date adding math
    NSDate *today = [[NSDate alloc] init];
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    
    //WHERE YOU SET THE TIME FROM NOW IN MONTHS
    [offsetComponents setDay:7];
    NSDate *aWeekFromNow = [gregorian dateByAddingComponents:offsetComponents
                                                       toDate:today options:0];
    
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

//day from now button
- (IBAction)oneDayButton:(UIButton *)sender {
    //sc recorder code
    UIImage *image = [self.filterSwitcherView currentlyDisplayedImageWithScale:self.photo.scale orientation:self.photo.imageOrientation];
    
    //date adding math
    NSDate *today = [[NSDate alloc] init];
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    
    //WHERE YOU SET THE TIME FROM NOW IN MONTHS
    [offsetComponents setDay:1];
    NSDate *aDayFromNow = [gregorian dateByAddingComponents:offsetComponents
                                                      toDate:today options:0];
    
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

//hour button
- (IBAction)oneHourButton:(UIButton *)sender {
    //sc recorder code
    UIImage *image = [self.filterSwitcherView currentlyDisplayedImageWithScale:self.photo.scale orientation:self.photo.imageOrientation];
    
    //date adding math
    NSDate *today = [[NSDate alloc] init];
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    
    //WHERE YOU SET THE TIME FROM NOW IN MONTHS
    [offsetComponents setHour:1];
    NSDate *anHourFromNow = [gregorian dateByAddingComponents:offsetComponents
                                                     toDate:today options:0];
    
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



//surprise button
- (IBAction)surpriseMeButton:(UIButton *)sender {
    //sc recorder code
    UIImage *image = [self.filterSwitcherView currentlyDisplayedImageWithScale:self.photo.scale orientation:self.photo.imageOrientation];
    
    //date adding math
    NSDate *today = [[NSDate alloc] init];
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    
    //WHERE YOU SET THE TIME FROM NOW IN MONTHS
    [offsetComponents setMinute:1];
    NSDate *aSurpriseTime = [gregorian dateByAddingComponents:offsetComponents
                                                     toDate:today options:0];
    
    //converting image file
    NSData *imageData = UIImageJPEGRepresentation(image, 0.9f);
    PFFile *imageFile = [PFFile fileWithName:@"comebackimage.png" data:imageData];
    
    
    //uploading PFObject
    
    PFObject *timerImage = [PFObject objectWithClassName:@"TimerImage"];
    timerImage[@"image"] = imageFile;
    timerImage[@"comebacktime"] = aSurpriseTime;
    timerImage[@"delayType"] = @"Surprise / 1 minute";
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
    localNotification.fireDate = aSurpriseTime;
    localNotification.alertBody = @"SURPRISE!! You have a new photo from 1 minute ago.";
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
    //save to photo album and trigger alert
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingSurpriseWithError:contextInfo:), nil);
    
    //clear note
    NSLog(@"before surprise note clear: %@", addNoteText);
    addNoteText = @"";
    NSLog(@"after surprise note clear: %@", addNoteText);

}


//CUSTOM DATE PICKER

//upload function after date has been set

#pragma mark - RMDateSelectionViewController Delegates
- (void)dateSelectionViewController:(RMDateSelectionViewController *)vc didSelectDate:(NSDate *)aDate {
    //Do something
    NSLog(@"pressed select with date: %@", aDate);
    
    //sc recorder code
    UIImage *image = [self.filterSwitcherView currentlyDisplayedImageWithScale:self.photo.scale orientation:self.photo.imageOrientation];
    
    
    //converting image file
    NSData *imageData = UIImageJPEGRepresentation(image, 0.9f);
    PFFile *imageFile = [PFFile fileWithName:@"comebackimage.png" data:imageData];
    
    
    //uploading PFObject
    PFObject *timerImage = [PFObject objectWithClassName:@"TimerImage"];
    timerImage[@"image"] = imageFile;
    timerImage[@"comebacktime"] = aDate;
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
    
    //convert date to string
    dateString = [NSDateFormatter localizedStringFromDate:aDate
                                                          dateStyle:NSDateFormatterShortStyle
                                                          timeStyle:NSDateFormatterFullStyle];
    NSLog(@"this is the date in string: %@", dateString);
    
    //set local notification
    UILocalNotification* localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = aDate;
    localNotification.alertBody = [NSString stringWithFormat:@"Your photo set to return at %@ is here",dateString];
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
    //save to photo album and trigger alert
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingCustomWithError:contextInfo:), nil);
    
    //clear note
    NSLog(@"before custom note clear: %@", addNoteText);
    addNoteText = @"";
    NSLog(@"after custom note clear: %@", addNoteText);
}

- (void)dateSelectionViewControllerDidCancel:(RMDateSelectionViewController *)vc {
    //Do something else
        NSLog(@"pressed cancel");
}


- (IBAction)customButton:(id)sender {
    NSLog(@"pressed custom button");
    RMDateSelectionViewController *dateSelectionVC = [RMDateSelectionViewController dateSelectionController];
    dateSelectionVC.delegate = self;
    
    [dateSelectionVC show];

}




//friends button
- (IBAction)didPressAddFriendsButton:(id)sender {
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



@end
