//
//  MTListViewCell.m
//  MeiTuan
//
//  Created by xujunhao on 2017/5/24.
//  Copyright © 2017年 cocoadogs. All rights reserved.
//

#import "MTListViewCell.h"

@interface MTListViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *bubbleView;


@end

@implementation MTListViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    _infoLabel.textColor = selected?[UIColor whiteColor]:[UIColor blackColor];
    _bubbleView.image = selected?[UIImage imageNamed:@"bubble_sel"]:[UIImage imageNamed:@"bubble"];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];
    _infoLabel.textColor = highlighted?[UIColor whiteColor]:[UIColor blackColor];
    _bubbleView.image = highlighted?[UIImage imageNamed:@"bubble_sel"]:[UIImage imageNamed:@"bubble"];
}

@end
