//
//  EPSectionModel.h
//  ExpandCell
//
//  Created by polycom on 2017/4/29.
//  Copyright © 2017年 xuyafei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EPCellModel.h"

@interface EPSectionModel : NSObject

@property (nonatomic, copy) NSString *sectionTitle;
@property (nonatomic, assign) BOOL isExpanded;
@property (nonatomic, strong) NSArray<EPCellModel *> *cellModels;

+ (void)loadData:(void(^)(NSArray *models))finished;

@end
