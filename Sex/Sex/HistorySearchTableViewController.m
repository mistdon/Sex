//
//  HistorySearchTableViewController.m
//  Sex
//
//  Created by shendong on 16/11/1.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "HistorySearchTableViewController.h"

// 搜索历史存储路径
#define PYSearchHistoriesPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"SexSearchsHistory.plist"]

@interface HistorySearchTableViewController ()<UISearchBarDelegate>
@property (nonatomic, strong) NSMutableArray *hotTags; //热门搜索
@property (nonatomic, strong) NSMutableArray *searchHistorys; //搜索历史
@end

@implementation HistorySearchTableViewController
#pragma mark - lazy loading -
- (NSMutableArray *)searchHistorys{
    if (!_searchHistorys) {
        _searchHistorys = [NSKeyedUnarchiver  unarchiveObjectWithFile:PYSearchHistoriesPath];
        if (!_searchHistorys) {
            _searchHistorys = [NSMutableArray array];
        }
    }
    return _searchHistorys;
}
- (NSMutableArray *)hotTags{
    if (!_hotTags) {
        _hotTags = [NSMutableArray array];
    }
    return _hotTags;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(20, 0, [UIScreen mainScreen].bounds.size.width - 40 , 44)];
//    searchBar.delegate = self;
//    self.navigationItem.titleView = searchBar;
    
    self.hotTags = [@[@"One day",@"Bandria",@"The sound of slice",@"500 miles",@"Taylor swift",@"Mack jakson",@"Hiller xierton",@"Washington DC",@"This is a msessage for you", @"Can you feel my world"] mutableCopy];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
#pragma mark - UISearch Bar delegate -


@end
