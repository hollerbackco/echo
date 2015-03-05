//
//  ImageViewController.h
//  LLSimpleCameraExample
//
//  Created by Ömer Faruk Gül on 15/11/14.
//  Copyright (c) 2014 Ömer Faruk Gül. All rights reserved.
//

#import <UIKit/UIKit.h>

NSString *addNoteText;
NSString *dateString;
NSDate *datePicked;
UIDatePicker *datePicker;

@interface ImageViewController : UIViewController <UIPopoverControllerDelegate>
- (instancetype)initWithImage:(UIImage *)image;
@end
