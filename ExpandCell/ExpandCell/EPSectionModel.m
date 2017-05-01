//
//  EPSectionModel.m
//  ExpandCell
//
//  Created by polycom on 2017/4/29.
//  Copyright © 2017年 xuyafei. All rights reserved.
//

#import "EPSectionModel.h"
#import "EPCellModel.h"

@implementation EPSectionModel

+ (void)loadData:(void (^)(NSArray *models))finished {
    NSMutableArray *dataArr =[NSMutableArray array];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ExpandList.plist" ofType:nil];
    NSDictionary *diaryList = [NSDictionary dictionaryWithContentsOfFile:path];
    
    NSArray *keyVal = diaryList.allKeys;
    NSArray *valVal = diaryList.allValues;
    
    NSInteger keyCount = keyVal.count;
    
    for (NSInteger i = 0; i < keyCount; i++) {
        EPSectionModel *sectionModel = [[EPSectionModel alloc] init];
        sectionModel.isExpanded = NO;
        sectionModel.sectionTitle = keyVal[i];
        
        NSMutableArray *cellArr = [[NSMutableArray alloc] init];
        
        NSUInteger valuCount = ((NSArray *)valVal[i]).count;
        
        for(NSInteger j = 0; j < valuCount; j++) {
            EPCellModel *cellModel = [[EPCellModel alloc] init];
            cellModel.title = valVal[i][j];
            [cellArr addObject:cellModel];
        }
        
        sectionModel.cellModels = cellArr;
        [dataArr addObject:sectionModel];
    }
    
    finished(dataArr);
}
@end
