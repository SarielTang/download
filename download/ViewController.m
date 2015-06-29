//
//  ViewController.m
//  download
//
//  Created by SarielTang on 15/6/26.
//  Copyright (c) 2015年 cf. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textfield;
- (IBAction)download;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)download {
    [self performSegueWithIdentifier:@"DownloadViewSegue" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString: @"DownloadViewSegue"]) {
        TableViewController *VC = (TableViewController *)segue.destinationViewController;
        VC.url = [NSURL URLWithString:self.textfield.text];
    }
}

@end
