//
//  TableViewController.m
//  download
//
//  Created by amesty on 15/6/25.
//  Copyright (c) 2015年 cf. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "DownloadManager.h"

@interface TableViewController ()
//
//@property (weak, nonatomic) IBOutlet ProgressButton *progressView;

@property (nonatomic, strong) NSMutableArray *finishedTasks;
//是否完成
@property (nonatomic,assign)BOOL isFinishedList;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加返回按钮
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(goback)];
    // 添加分段按钮
    UISegmentedControl * segmentedControl = [[UISegmentedControl alloc] initWithFrame:CGRectMake(60.0f, 8.0f, 300.0f, 30.0f)];
    [segmentedControl insertSegmentWithTitle:@"下载中" atIndex:0  animated: YES];
    [segmentedControl insertSegmentWithTitle:@"已完成" atIndex:1 animated:YES];
    
    segmentedControl.momentary = YES;
    segmentedControl.multipleTouchEnabled=NO;
    [segmentedControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc] initWithCustomView:segmentedControl];
    
    [[DownloadManager sharedManager] downloadWithURL:self.url progress:^(float progress) {
        //这里，在下载中，存入了正在下载的内容
        NSArray *downloadingTasks = [DownloadManager sharedManager].downloadingTasks;
        for (int i = 0; i < downloadingTasks.count; i++) {
            DownloadOperation *op = downloadingTasks[i];
            if (op.url == self.url) {
            }
        }
    } finished:^(DownloadOperation *operation, NSError *error) {
        NSLog(@"%@ %@ %@", operation.filePath , error, [NSThread currentThread]);
        [self.finishedTasks addObject:operation];
    }];

}

-(void)segmentAction:(UISegmentedControl *)Segment{
    NSInteger index = Segment.selectedSegmentIndex;
    if (index == 0) {
        self.isFinishedList = NO;
    }else{
        self.isFinishedList = YES;
    }
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (self.isFinishedList) {
        return self.finishedTasks.count;
    }else{
        return [DownloadManager sharedManager].downloadingTasks.count;
    };
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell;
    if (self.isFinishedList) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"finishedCell"];
        cell.operation = self.finishedTasks[indexPath.row];
    }else{
        cell = [tableView dequeueReusableCellWithIdentifier:@"downloadingCell"];
        cell.operation = [DownloadManager sharedManager].downloadingTasks[indexPath.row];
    }
    
    // Configure the cell...、

    
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

@end
