//
//  InboxItemViewController.h
//  SCRecorderExamples
//
//  Created by Will Dennis on 2/28/15.
//
//

#import <UIKit/UIKit.h>
#import "InboxItemView.h"
#import <ParseUI/ParseUI.h>

UIImage *queryImage;

@interface InboxItemViewController : UIViewController <MDCSwipeToChooseDelegate>

//@property (nonatomic, strong) Person *currentPerson;
@property (nonatomic, strong) InboxItemView *frontCardView;
@property (nonatomic, strong) InboxItemView *backCardView;


@end
