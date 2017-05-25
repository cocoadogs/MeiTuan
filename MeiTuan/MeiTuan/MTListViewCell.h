//
//  MTListViewCell.h
//  MeiTuan
//
//  Created by xujunhao on 2017/5/24.
//  Copyright © 2017年 cocoadogs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTListViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (weak, nonatomic) IBOutlet UIView *topLine;
@property (weak, nonatomic) IBOutlet UIView *bottomLine;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLineTopConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomLineBottomConstraint;

@end
