//
//  SCInboxViewController.m
//  SCRecorderExamples
//
//  Created by Will Dennis on 2/21/15.
//
//

#import "SCInboxViewController.h"

@interface SCInboxViewController ()

@end

@implementation SCInboxViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    [[UIApplication sharedApplication] setStatusBarHidden:YES
                                            withAnimation:UIStatusBarAnimationFade];
    
}
- (BOOL)prefersStatusBarHidden {
    return YES;
}


- (id)initWithCoder:(NSCoder *)aCoder
{
    self = [super initWithCoder:aCoder];
    if (self) {
        // The className to query on
        self.parseClassName = @"TimerImage";
        
        // The key of the PFObject to display in the label of the default cell style
        self.textKey = @"createdAt";
        
        // Whether the built-in pull-to-refresh is enabled
        self.pullToRefreshEnabled = YES;
        
        // Whether the built-in pagination is enabled
        self.paginationEnabled = NO;
        self.objectsPerPage =5;
    }
    return self;
}

- (PFQuery *)queryForTable
{
    //date math
    NSDate *now = [[NSDate alloc] init];
    
    //converting combacktime to date
   
    
    //query filter

    PFQuery *query = [PFQuery queryWithClassName:self.parseClassName];
    [query whereKey:@"comebacktime" lessThan:now];

    [query orderByDescending:@"createdAt"];
    return query;
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
                        object:(PFObject *)object {
    static NSString *identifier = @"cell";
    PFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[PFTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    //ui label for createdAt
    NSDate *createdAtDate = [object createdAt];
    NSDateFormatter *df = [NSDateFormatter new];
    [df setDateFormat:@"MMMM dd 'at' HH:mm"];
    UILabel *createdAtLabel = (UILabel*) [cell viewWithTag:101];
    createdAtLabel.text = [df stringFromDate:createdAtDate];
    
    //ui label for returnAt
    NSDate *returnAtDate = [object objectForKey:@"comebacktime"];
    NSDateFormatter *dfdf = [NSDateFormatter new];
    [dfdf setDateFormat:@"MMMM dd 'at' HH:mm"];
    UILabel *returnAtLabel = (UILabel*) [cell viewWithTag:102];
    returnAtLabel.text = [dfdf stringFromDate:returnAtDate];
    
    //image
    PFFile *thumbnail = [object objectForKey:@"image"];
    PFImageView *thumbnailImageView = (PFImageView*)[cell viewWithTag:100];
    thumbnailImageView.image = [UIImage imageNamed:@"placeholder.jpg"];
    thumbnailImageView.file = thumbnail;
    [thumbnailImageView loadInBackground];
    
    return cell;
}

//SNAP TO CELL
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self centerTable];
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    [self centerTable];
}

- (void)centerTable {
    NSIndexPath *pathForCenterCell = [self.tableView indexPathForRowAtPoint:CGPointMake(CGRectGetMidX(self.tableView.bounds), CGRectGetMidY(self.tableView.bounds))];
    
    [self.tableView scrollToRowAtIndexPath:pathForCenterCell atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
}


//trying to go next cell
NSIndexPath *currentSelection;

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    currentSelection = indexPath;
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

- (IBAction)didPressNextButton:(UIButton *)sender {
    //Remember to check boundaries before just setting an indexpath or your app will crash!
    if(currentSelection){
        currentSelection = [NSIndexPath indexPathForRow:currentSelection.row+1 inSection:currentSelection.section];
    }else{
        currentSelection = [NSIndexPath indexPathForRow:0 inSection:0];
    }
    
    [self.tableView selectRowAtIndexPath:currentSelection animated:NO scrollPosition: UITableViewScrollPositionTop];

}


@end