//
//  EPMoreTableViewCell.m
//  ExpandCell
//
//  Created by polycom on 2017/5/1.
//  Copyright © 2017年 xuyafei. All rights reserved.
//

#import "EPMoreTableViewCell.h"

@implementation EPMoreTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCellModel:(EPCellModel *)cellModel {
    _cellModel = cellModel;
    self.textLabel.text = cellModel.title;
}

@end
