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

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(saveToCameraRoll)];
    
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

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    if (error == nil) {
        [[[UIAlertView alloc] initWithTitle:@"Done!" message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    } else {
        [[[UIAlertView alloc] initWithTitle:@"Failed :(" message:error.localizedDescription delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }
    
}

- (void)saveToCameraRoll {
    UIImage *image = [self.filterSwitcherView currentlyDisplayedImageWithScale:self.photo.scale orientation:self.photo.imageOrientation];
    
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}


// COME BACK BUTTONS

- (IBAction)oneYearButton:(UIButton *)sender {
    
    //sc recorder code
    UIImage *image = [self.filterSwitcherView currentlyDisplayedImageWithScale:self.photo.scale orientation:self.photo.imageOrientation];

    //date adding math
    NSDate *today = [[NSDate alloc] init];
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setHour:8760];
    //    [offsetComponents setMinute:30];
    NSDate *aYearFromNow = [gregorian dateByAddingComponents:offsetComponents
                                                       toDate:today options:0];
    
    //converting image file
//    NSData *imageData = UIImagePNGRepresentation(image);
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
    
    //finished saving
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
}

- (IBAction)oneMonthButton:(UIButton *)sender {
}

- (IBAction)oneWeekButton:(UIButton *)sender {
}

- (IBAction)oneDayButton:(UIButton *)sender {
}

- (IBAction)oneHourButton:(UIButton *)sender {
    
    //sc recorder code
    UIImage *image = [self.filterSwitcherView currentlyDisplayedImageWithScale:self.photo.scale orientation:self.photo.imageOrientation];
    
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
    //date adding math
    NSDate *today = [[NSDate alloc] init];
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setHour:1];
//    [offsetComponents setMinute:30];
    NSDate *anHourFromNow = [gregorian dateByAddingComponents:offsetComponents
                                                       toDate:today options:0];
    
    PFObject *timerImage = [PFObject objectWithClassName:@"TimerImage"];
    timerImage[@"comebacktime"] = anHourFromNow;
    timerImage[@"delayType"] = @"One Hour";
    [timerImage saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // The object has been saved.
        } else {
            // There was a problem, check error.description
        }
    }];
}

- (IBAction)customTimeButton:(UIButton *)sender {
}

- (IBAction)surpriseMeButton:(UIButton *)sender {
}
@end
