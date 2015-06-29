//
//  TableViewCell.m
//  download
//
//  Created by amesty on 15/6/26.
//  Copyright (c) 2015年 cf. All rights reserved.
//

#import "TableViewCell.h"
#import "DownloadManager.h"

@interface TableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *fileName;
@property (weak, nonatomic) IBOutlet UILabel *fileSize;
@property (weak, nonatomic) IBOutlet UIProgressView *progress;
@property (nonatomic, strong) NSURL *url;
- (IBAction)pause:(UIButton *)sender;

@end

@implementation TableViewCell

- (void)setOperation:(DownloadOperation *)operation{
    _operation = operation;
    self.fileName.text = [operation.filePath lastPathComponent];
    self.fileSize.text = [NSString stringWithFormat:@"%zd", operation.fileSize];
    dispatch_async(dispatch_get_main_queue(), ^{
        self.progress.progress = operation.progress;
    });
    self.url = operation.url;
}

- (IBAction)pause:(UIButton *)sender {
    NSLog(@"暂停");
    [[DownloadManager sharedManager] pauseWithURL:self.url];
}
@end
