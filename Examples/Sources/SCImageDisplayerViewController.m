//
//  SCImageViewDisPlayViewController.m
//  SCAudioVideoRecorder
//
//  Created by 曾 宪华 on 13-11-5.
//  Copyright (c) 2013年 rFlex. All rights reserved.
//

#import <Parse/Parse.h>
#import "SCImageDisplayerViewController.h"
#import "TDDatePickerController.h"

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

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(saveToCameraRoll)];
    [[UIBarButtonItem appearance] setTintColor:[UIColor whiteColor]];


    
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
                                                        message:@"Date Picker coming soon :)"
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
    else {
        //No
        // Other Alert View
        
    }
    
}

- (void)saveToCameraRoll {
    UIImage *image = [self.filterSwitcherView currentlyDisplayedImageWithScale:self.photo.scale orientation:self.photo.imageOrientation];
    
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
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
    
    //uploading PFObject
    PFObject *timerImage = [PFObject objectWithClassName:@"TimerImage"];
    timerImage[@"image"] = imageFile;
    timerImage[@"comebacktime"] = aYearFromNow;
    timerImage[@"delayType"] = @"One Year";
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
    
    //finished saving trigger alert
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingYearWithError:contextInfo:), nil);
    
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
    
    //finished saving trigger alert
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingMonthWithError:contextInfo:), nil);

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
    
    //finished saving trigger alert
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWeekWithError:contextInfo:), nil);
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
    
    //finished saving trigger alert
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingDayWithError:contextInfo:), nil);
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
    
    //finished saving trigger alert
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingHourWithError:contextInfo:), nil);
    
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
    
    //finished saving trigger alert
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingSurpriseWithError:contextInfo:), nil);

}


//CUSTOM DATE PICKER

//upload function after date has been set

    
    
    

    

    






- (IBAction)didPressCustomButton:(id)sender {
    
    NSLog(@"custom button");
    //sc recorder code
    UIImage *image = [self.filterSwitcherView currentlyDisplayedImageWithScale:self.photo.scale orientation:self.photo.imageOrientation];
    
    //date adding math
    NSDate *today = [[NSDate alloc] init];
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    
    //WHERE YOU SET THE TIME FROM NOW IN MONTHS
    [offsetComponents setMinute:1];
    NSDate *aCustomTime = [gregorian dateByAddingComponents:offsetComponents
                                                       toDate:today options:0];
    
    //converting image file
    NSData *imageData = UIImageJPEGRepresentation(image, 0.9f);
    PFFile *imageFile = [PFFile fileWithName:@"comebackimage.png" data:imageData];
    
    
    //uploading PFObject
    PFObject *timerImage = [PFObject objectWithClassName:@"TimerImage"];
    timerImage[@"image"] = imageFile;
    timerImage[@"comebacktime"] = aCustomTime;
    timerImage[@"delayType"] = @"Surprise / 1 minute";
    [timerImage saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // The object has been saved.
        } else {
            // There was a problem, check error.description
        }
    }];
    
    //set local notification
    UILocalNotification* localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = aCustomTime;
    localNotification.alertBody = @"You have a new photo from your custom time";
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
    //finished saving trigger alert
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingCustomWithError:contextInfo:), nil);

}
@end
