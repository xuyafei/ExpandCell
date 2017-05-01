//
//  EPSectionModel.m
//  ExpandCell
//
//  Created by polycom on 2017/4/29.
//  Copyright © 2017年 xuyafei. All rights reserved.
//

#import "EPSectionModel.h"

@implementation EPSectionModel

+ (void)loadData:(void (^)(NSArray *models))finished {
    NSMutableArray *dataArr =[NSMutableArray array];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ExpandList.plist" ofType:nil];
    NSDictionary *diaryList = [NSDictionary dictionaryWithContentsOfFile:path];
    
    NSArray *keyVal = diaryList.allKeys;
    NSArray *valVal = diaryList.allValues;
    
    NSInteger keyCount = keyVal.count;
    
    for (NSInteger i = 0; i < keyCount; i++) {
        
    }
}
@end
