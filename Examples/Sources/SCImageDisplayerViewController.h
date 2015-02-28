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

@interface SCImageDisplayerViewController : UIViewController <UIPopoverControllerDelegate>


@property (nonatomic, strong) UIImage *photo;
@property (weak, nonatomic) IBOutlet SCSwipeableFilterView *filterSwitcherView;

//timer buttons
- (IBAction)oneYearButton:(UIButton *)sender;
- (IBAction)oneMonthButton:(UIButton *)sender;
- (IBAction)oneWeekButton:(UIButton *)sender;
- (IBAction)oneDayButton:(UIButton *)sender;
- (IBAction)oneHourButton:(UIButton *)sender;
- (IBAction)surpriseMeButton:(UIButton *)sender;
- (IBAction)customButton:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *addNoteLabel;


- (IBAction)didPressAddNoteButton:(id)sender;



@end
