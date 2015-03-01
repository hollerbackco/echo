//
//  InboxItemViewController.m
//  SCRecorderExamples
//
//  Created by Will Dennis on 2/28/15.
//
//

#import "InboxItemViewController.h"
#import <Parse/Parse.h>


@interface InboxItemViewController ()
@end

@implementation InboxItemViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    //set up card
    MDCSwipeToChooseViewOptions *options = [MDCSwipeToChooseViewOptions new];
    options.delegate = self;
    options.likedText = @"Keep";
    options.likedColor = [UIColor blueColor];
    options.nopeText = @"Delete";
    options.onPan = ^(MDCPanState *state){
        if (state.thresholdRatio == 1.f && state.direction == MDCSwipeDirectionLeft) {
            NSLog(@"Let go now to delete the photo!");
        }
    };
    
    
    MDCSwipeToChooseView *view = [[MDCSwipeToChooseView alloc] initWithFrame:self.view.bounds
                                                                     options:options];
    
    
    
    // Do any additional setup after loading the view.
    // You can customize MDCSwipeToChooseView using MDCSwipeToChooseViewOptions.
    //date math
    NSDate *now = [[NSDate alloc] init];
    
    PFQuery *query = [PFQuery queryWithClassName:@"TimerImage"];
    [query whereKey:@"comebacktime" lessThan:now];
    [query addDescendingOrder:@"comebacktime"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            
            NSLog(@"Successfully retrieved %d photos.", objects.count);
            
            // Do something with the found objects
            for (PFObject *object in objects) {
                NSLog(@"%@", object.objectId);
                
                //image
                PFFile *thumbnail = [object objectForKey:@"image"];
                [thumbnail getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
                    if (!error) {
                        queryImage = [UIImage imageWithData:data];
                        view.imageView.image = queryImage;
                        [self.view addSubview:view];
                        NSLog(@"queryImage set");
                        // image can now be set on a UIImageView
                        
                    }
                }];
            
            }
            
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
        
    }];

    

}

- (void)loadCardView {
    
    
    NSLog(@"load card view");
    // Do any additional setup after loading the view.
    // You can customize MDCSwipeToChooseView using MDCSwipeToChooseViewOptions.
    MDCSwipeToChooseViewOptions *options = [MDCSwipeToChooseViewOptions new];
    options.delegate = self;
    options.likedText = @"Keep";
    options.likedColor = [UIColor blueColor];
    options.nopeText = @"Delete";
    options.onPan = ^(MDCPanState *state){
        if (state.thresholdRatio == 1.f && state.direction == MDCSwipeDirectionLeft) {
            NSLog(@"Let go now to delete the photo!");
        }
    };
    
    MDCSwipeToChooseView *view = [[MDCSwipeToChooseView alloc] initWithFrame:self.view.bounds
                                                                     options:options];
    
    view.imageView.image = queryImage;
    [self.view addSubview:view];
}




#pragma mark - MDCSwipeToChooseDelegate Callbacks

// This is called when a user didn't fully swipe left or right.
- (void)viewDidCancelSwipe:(UIView *)view {
    NSLog(@"Couldn't decide, huh?");
}

// Sent before a choice is made. Cancel the choice by returning `NO`. Otherwise return `YES`.
- (BOOL)view:(UIView *)view shouldBeChosenWithDirection:(MDCSwipeDirection)direction {
    if (direction == MDCSwipeDirectionLeft) {
        return YES;
    } else {
        // Snap the view back and cancel the choice.
        [UIView animateWithDuration:0.16 animations:^{
            view.transform = CGAffineTransformIdentity;
//            view.center = self.superview.center;
        }];
        return NO;
    }
}

// This is called then a user swipes the view fully left or right.
- (void)view:(UIView *)view wasChosenWithDirection:(MDCSwipeDirection)direction {
    if (direction == MDCSwipeDirectionLeft) {
        NSLog(@"Photo deleted!");
        [self loadCardView];
          } else {
        NSLog(@"Photo saved!");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
