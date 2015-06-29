//
//  TableViewCell.h
//  download
//
//  Created by amesty on 15/6/26.
//  Copyright (c) 2015年 cf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DownloadOperation.h"

@interface TableViewCell : UITableViewCell

@property (nonatomic, strong) DownloadOperation *operation;


@end
