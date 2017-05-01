//
//  EPTableViewHeader.h
//  ExpandCell
//
//  Created by polycom on 2017/5/1.
//  Copyright © 2017年 xuyafei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EPSectionModel.h"

typedef void(^HeaderViewClickedBack)(BOOL);

@interface EPTableViewHeader : UITableViewHeaderFooterView

@property (nonatomic, copy) HeaderViewClickedBack headerClickerBack;
@property (nonatomic, strong) EPSectionModel *sectionModel;

@end
