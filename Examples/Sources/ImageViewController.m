//
//  ImageViewController.m
//  LLSimpleCameraExample
//
//  Created by Ömer Faruk Gül on 15/11/14.
//  Copyright (c) 2014 Ömer Faruk Gül. All rights reserved.
//

#import "ImageViewController.h"
#import "ViewUtils.h"
#import "UIImage+Crop.h"
#import <Parse/Parse.h>

@interface ImageViewController ()

//images
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UIImageView *noteIcon;

//labels
@property (strong, nonatomic) UILabel *infoLabel;
@property (strong, nonatomic) UILabel *noteLabel;
@property (strong, nonatomic) UILabel *buttonGroupLabel;

//6 buttons

@property (strong, nonatomic) UIButton *hourButton;
@property (strong, nonatomic) UIButton *dayButton;
@property (strong, nonatomic) UIButton *weekButton;
@property (strong, nonatomic) UIButton *monthButton;
@property (strong, nonatomic) UIButton *setTimeButton;
@property (strong, nonatomic) UIButton *surpriseButton;

//other button
@property (strong, nonatomic) UIButton *addNote;
@property (strong, nonatomic) UIButton *cancelButton;



@end

@implementation ImageViewController

- (instancetype)initWithImage:(UIImage *)image {
    self = [super initWithNibName:nil bundle:nil];
    if(self) {
        self.image = image;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView.backgroundColor = [UIColor blackColor];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, screenRect.size.width, screenRect.size.height)];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.imageView.backgroundColor = [UIColor clearColor];
    self.imageView.image = self.image;
    [self.view addSubview:self.imageView];
    
    NSString *info = [NSString stringWithFormat:@"Size: %@  -  Orientation: %d", NSStringFromCGSize(self.image.size), self.image.imageOrientation];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    [self.view addGestureRecognizer:tapGesture];
    
    
    self.infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
    self.infoLabel.backgroundColor = [[UIColor darkGrayColor] colorWithAlphaComponent:0.7];
    self.infoLabel.textColor = [UIColor whiteColor];
    self.infoLabel.font = [UIFont fontWithName:@"AvenirNext-Regular" size:13];
    self.infoLabel.textAlignment = NSTextAlignmentCenter;
    self.infoLabel.text = info;
    [self.view addSubview:self.infoLabel];
    
    self.buttonGroupLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 340, 320, 20)];
    self.buttonGroupLabel.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    self.buttonGroupLabel.textColor = [UIColor whiteColor];
    self.buttonGroupLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14];
    self.buttonGroupLabel.textAlignment = NSTextAlignmentCenter;
    self.buttonGroupLabel.text = @"Send to Future Self in...";
    [self.view addSubview:self.buttonGroupLabel];

    
    //buttons
    self.hourButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 370, 80, 80)];
    self.hourButton.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.5];
    self.hourButton.tintColor = [UIColor whiteColor];
    self.hourButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14];
    [self.hourButton setTitle:@"Hour" forState:UIControlStateNormal];
    [self.hourButton addTarget:self action:@selector(didPressHourButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.hourButton];
    
    self.dayButton = [[UIButton alloc] initWithFrame:CGRectMake(120, 370, 80, 80)];
    self.dayButton.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:0.5];
    self.dayButton.tintColor = [UIColor whiteColor];
    self.dayButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14];
    [self.dayButton setTitle:@"Day" forState:UIControlStateNormal];
    [self.dayButton addTarget:self action:@selector(didPressDayButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.dayButton];
    
    self.weekButton = [[UIButton alloc] initWithFrame:CGRectMake(220, 370, 80, 80)];
    self.weekButton.backgroundColor = [[UIColor orangeColor] colorWithAlphaComponent:0.5];
    self.weekButton.tintColor = [UIColor whiteColor];
    self.weekButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14];
    [self.weekButton setTitle:@"Week" forState:UIControlStateNormal];
    [self.weekButton addTarget:self action:@selector(didPressWeekButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.weekButton];
    
    self.monthButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 470, 80, 80)];
    self.monthButton.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.5];
    self.monthButton.tintColor = [UIColor whiteColor];
    self.monthButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14];
    [self.monthButton setTitle:@"Month" forState:UIControlStateNormal];
    [self.monthButton addTarget:self action:@selector(didPressMonthButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.monthButton];
    
    self.setTimeButton = [[UIButton alloc] initWithFrame:CGRectMake(120, 470, 80, 80)];
    self.setTimeButton.backgroundColor = [[UIColor cyanColor] colorWithAlphaComponent:0.5];
    self.setTimeButton.tintColor = [UIColor whiteColor];
    self.setTimeButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14];
    [self.setTimeButton setTitle:@"Set..." forState:UIControlStateNormal];
    [self.setTimeButton addTarget:self action:@selector(didPressSetTimeButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.setTimeButton];
    
    self.surpriseButton = [[UIButton alloc] initWithFrame:CGRectMake(220, 470, 80, 80)];
    self.surpriseButton.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:0.5];
    self.surpriseButton.tintColor = [UIColor whiteColor];
    self.surpriseButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14];
    [self.surpriseButton setTitle:@"Surprise!" forState:UIControlStateNormal];
    [self.surpriseButton addTarget:self action:@selector(didPressSurpriseButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.surpriseButton];
    
    // pull up date selector automatically
    [self triggerDatePicker];
    datePicker.alpha = 0;
}


//send pressed
- (void)didPressSendToFutureButton:(id)sender {
    //Do something
    NSLog(@"pressed select with date: %@", datePicked);

    
    //converting image file
    NSData *imageData = UIImageJPEGRepresentation(_image, 0.9f);
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
    UIImageWriteToSavedPhotosAlbum(_image, self, @selector(image:didFinishSavingCustomWithError:contextInfo:), nil);
    
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




- (void)didPressSurpriseButton:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Surprise!"
                                                    message:@"Coming soon :)"
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

- (void)didPressMonthButton:(id)sender {
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
    

    //converting image file
    NSData *imageData = UIImageJPEGRepresentation(_image, 0.9f);
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
    UIImageWriteToSavedPhotosAlbum(_image, self, @selector(image:didFinishSavingMonthWithError:contextInfo:), nil);
    
    //clear note
    NSLog(@"before month note clear: %@", addNoteText);
    addNoteText = @"";
    NSLog(@"after month note clear: %@", addNoteText);
    
    
}

- (void)didPressWeekButton:(id)sender {
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
    
    
    //converting image file
    NSData *imageData = UIImageJPEGRepresentation(_image, 0.9f);
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
    UIImageWriteToSavedPhotosAlbum(_image, self, @selector(image:didFinishSavingWeekWithError:contextInfo:), nil);
    
    //clear note
    NSLog(@"before week note clear: %@", addNoteText);
    addNoteText = @"";
    NSLog(@"after week note clear: %@", addNoteText);
    
    
    
}

- (void)didPressDayButton:(id)sender {
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

    
    //converting image file
    NSData *imageData = UIImageJPEGRepresentation(_image, 0.9f);
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
    UIImageWriteToSavedPhotosAlbum(_image, self, @selector(image:didFinishSavingDayWithError:contextInfo:), nil);
    
    //clear note
    NSLog(@"before day note clear: %@", addNoteText);
    addNoteText = @"";
    NSLog(@"after day note clear: %@", addNoteText);
    
}

- (void)didPressHourButton:(id)sender {
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
    
    
    //converting image file
    NSData *imageData = UIImageJPEGRepresentation(_image, 0.9f);
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
    UIImageWriteToSavedPhotosAlbum(_image, self, @selector(image:didFinishSavingHourWithError:contextInfo:), nil);
    
    //clear note
    NSLog(@"before hour note clear: %@", addNoteText);
    addNoteText = @"";
    NSLog(@"after hour note clear: %@", addNoteText);
    
}

- (void)didPressSetTimeButton:(id)sender {
    _hourButton.alpha = 0;
    _weekButton.alpha = 0;
    _dayButton.alpha = 0;
    _monthButton.alpha = 0;
    _surpriseButton.alpha = 0;
    _setTimeButton.alpha = 0;
    _setTimeButton.alpha = 1;
    datePicker.alpha = 1;
}



- (void)viewTapped:(UIGestureRecognizer *)gesture {
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    
    self.imageView.frame = self.view.contentBounds;

    [self.infoLabel sizeToFit];
    self.infoLabel.width = self.view.contentBounds.size.width;
    self.infoLabel.top = 0;
    self.infoLabel.left = 0;
    
    
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
    _setTimeButton.alpha = 1;
    _setTimeButton.alpha = 0;
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
            [self dismissViewControllerAnimated:NO completion:nil];
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
                
                _noteLabel.numberOfLines = 0; // allows label to have as many lines as needed
                _noteLabel.text = [NSString stringWithFormat:@"%@", addNoteText];
                _noteLabel.preferredMaxLayoutWidth = 300.0;
                [_noteLabel sizeToFit];
                
                self.noteIcon.alpha = 0;
                
                
            }
            else {
                self.noteLabel.text = @"";
                self.noteIcon.alpha = 1;
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

//friends button
//- (void)didPressAddFriendsButton:(id)sender {
//    
//    NSLog(@"pressed friends button");
//    PFUser *currentUser = [PFUser currentUser];
//    
//    //see if it's a user and anonymous
//    if (currentUser) {
//        if ([PFAnonymousUtils isLinkedWithUser:[PFUser currentUser]]) {
//            NSLog(@"user is anonymous so make them sign up");
//            [self performSegueWithIdentifier:@"signUpSegue" sender:sender];
//        } else {
//            NSLog(@"there is a user with username %@", currentUser);
//            [self performSegueWithIdentifier:@"addFriendsSegue" sender:sender];
//        }
//    } else {
//        // show the signup or login screen
//        [self performSegueWithIdentifier:@"signUpSegue" sender:sender];
//    }
//}

//add note
- (void)didPressAddNoteButton:(id)sender {
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Add a note to this photo" message:@"" delegate:self cancelButtonTitle:@"Done" otherButtonTitles:nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    alert.tag = 200;
    [alert show];
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
