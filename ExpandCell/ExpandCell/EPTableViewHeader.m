//
//  EPTableViewHeader.m
//  ExpandCell
//
//  Created by polycom on 2017/5/1.
//  Copyright © 2017年 xuyafei. All rights reserved.
//
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

#import "EPTableViewHeader.h"

@interface EPTableViewHeader ()

@property(nonatomic, weak) UIImageView *diectiongImageView;

@end

@implementation EPTableViewHeader

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if(self == [super initWithReuseIdentifier:reuseIdentifier]) {
        [self setupItems];
    }
    
    return self;
}

- (void)setupItems {
    self.diectiongImageView.image = [UIImage imageNamed:@"brand_expand"];
    self.diectiongImageView.frame = CGRectMake(ScreenWidth - 30, (44 - 8) / 2, 15, 8);
    [self.contentView addSubview:self.diectiongImageView];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 44)];
    button.backgroundColor = [UIColor clearColor];
    [button addTarget:self action:@selector(headerClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:button];
    
    self.contentView.backgroundColor = [UIColor colorWithRed:188 / 255.0 green:188 / 255.0 blue:194 / 255.0 alpha:1.0];
    self.contentView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.contentView.layer.borderWidth = 0.5;
}

- (void)headerClick:(UIButton *)sender {
    self.sectionModel.isExpanded = !self.sectionModel.isExpanded;
    
    [UIView animateWithDuration:0.25 animations:^{
        if(!self.sectionModel.isExpanded) {
            self.diectiongImageView.transform = CGAffineTransformIdentity;
        } else {
            self.diectiongImageView.transform = CGAffineTransformMakeRotation(M_PI);
        }
    }];
    
    if(self.headerClickerBack) {
        self.headerClickerBack(self.sectionModel.isExpanded);
    }
}

- (UIImageView *)diectiongImageView {
    if(!_diectiongImageView) {
        UIImageView *directionImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:directionImageView];
        _diectiongImageView = directionImageView;
    }
    
    return _diectiongImageView;
}

- (void)setSectionModel:(EPSectionModel *)sectionModel{
    _sectionModel = sectionModel;
    self.textLabel.text = sectionModel.sectionTitle;
    
    if (!_sectionModel.isExpanded) {
        self.diectiongImageView.transform = CGAffineTransformIdentity;
    } else {
        self.diectiongImageView.transform = CGAffineTransformMakeRotation(M_PI);
    }
}

@end
