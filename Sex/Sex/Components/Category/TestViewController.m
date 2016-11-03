//
//  TestViewController.m
//  
//
//  Created by shendong on 16/11/3.
//
//

#import "TestViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>


@interface TestViewController ()
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *datas;
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"identifier"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"identifier"];
        cell.textLabel.text = [self.records objectAtIndex:indexPath.row];
    }
    return cell;
}
#pragma mark - PagingLoadProtocol -
- (void)pagingBeginLoad{
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSMutableArray *data = [NSMutableArray arrayWithCapacity:5];
        for (int index = 0; index < 5; index++) {
            NSString *name = [NSString stringWithFormat:@"index = %d",index];
            [data addObject:name];
        }
        if (self.records.count <= 20) {
            [self pagingLoaded:data];
        }else{
            [self pagingLoaded:@[]];
        }
//    });
}
@end
