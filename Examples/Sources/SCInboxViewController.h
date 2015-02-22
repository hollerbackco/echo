//
//  SCInboxViewController.h
//  SCRecorderExamples
//
//  Created by Will Dennis on 2/21/15.
//
//

#import <UIKit/UIKit.h>
#import <ParseUI/ParseUI.h>
#import <Parse/Parse.h>

@interface SCInboxViewController : PFQueryTableViewController <UITableViewDelegate>
- (IBAction)didPressNextButton:(UIButton *)sender;

@end

