//
//  SCImageViewDisPlayViewController.h
//  SCAudioVideoRecorder
//
//  Created by 曾 宪华 on 13-11-5.
//  Copyright (c) 2013年 rFlex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SCSwipeableFilterView.h>

NSString *addNoteText;
NSString *dateString;
NSDate *datePicked;
UIDatePicker *datePicker;

@interface SCImageDisplayerViewController : UIViewController <UIPopoverControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *addNoteTIcon;
@property (nonatomic, strong) UIImage *photo;
@property (weak, nonatomic) IBOutlet SCSwipeableFilterView *filterSwitcherView;
@property (weak, nonatomic) IBOutlet UILabel *addNoteLabel;

- (IBAction)didPressAddFriendsButton:(id)sender;
- (IBAction)didPressAddNoteButton:(id)sender;
- (IBAction)didPressSendToFutureButton:(id)sender;


//add time to datepicker buttons
- (IBAction)didPressSurprise:(id)sender;
- (IBAction)didPressMonth:(id)sender;
- (IBAction)didPressWeek:(id)sender;
- (IBAction)didPressDay:(id)sender;
- (IBAction)didPressHour:(id)sender;
- (IBAction)didPressCustomTime:(id)sender;

//ibOutlets so button's can show / hide 
@property (weak, nonatomic) IBOutlet UIButton *hourButton;
@property (weak, nonatomic) IBOutlet UIButton *dayButton;
@property (weak, nonatomic) IBOutlet UIButton *weekButton;
@property (weak, nonatomic) IBOutlet UIButton *monthButton;
@property (weak, nonatomic) IBOutlet UIButton *customTimeButton;
@property (weak, nonatomic) IBOutlet UIButton *surpriseButton;
@property (weak, nonatomic) IBOutlet UIButton *customTimeSendButton;





@end
