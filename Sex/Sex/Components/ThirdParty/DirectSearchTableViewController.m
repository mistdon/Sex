//
//  DirectSearchTableViewController.m
//  Sex
//
//  Created by shendong on 16/11/1.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "DirectSearchTableViewController.h"

#define SearchHistoriesPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"SearchHistories.plist"]

@interface DirectSearchTableViewController ()<UISearchBarDelegate>

@property (nonatomic, strong) UIView *headerContentView;
@property (nonatomic, strong) NSArray *hotTags; //热门搜索
@property (nonatomic, strong) NSMutableArray *historys; //历史搜索

@end

@implementation DirectSearchTableViewController
- (NSMutableArray *)historys{
    if (!_historys) {
        _historys = [NSKeyedUnarchiver unarchiveObjectWithFile:SearchHistoriesPath];
        if (!_historys) {
            _historys = [NSMutableArray array];
        }
    }
    return _historys;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(40, 0, [UIScreen mainScreen].bounds.size.width - 80, 44)];
    searchBar.placeholder = @"请输入想搜索的内容";
    searchBar.delegate = self;
    self.navigationItem.titleView = searchBar;
    
    
    
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
////        self.hotTags = @[@"One day",@"Bandria",@"The sound of slice",@"500 miles",@"Taylor swift",@"Mack jakson",@"Hiller xierton",@"Washington DC",@"This is a msessage for you", @"Can you feel my world"];
//        [self.tableView reloadData];
//    });
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.historys.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"searchHistoryCellIdentifier" forIndexPath:indexPath];
    cell.textLabel.text = [self.historys objectAtIndex:indexPath.row];
    UIButton *btn = [[UIButton alloc] init];
    btn.backgroundColor = [UIColor greenColor];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UISearchBar delegate -
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
    //save data
    [self.historys insertObject:searchBar.text atIndex:0];
    [NSKeyedArchiver archiveRootObject:self.historys toFile:SearchHistoriesPath];
}
@end
