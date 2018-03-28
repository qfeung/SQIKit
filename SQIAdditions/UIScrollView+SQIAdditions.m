//
//  UIScrollView+SQIAdditions.m
//  LingXia
//
//  Created by HSQI on 2017/10/18.
//  Copyright © 2017年 3Fsports. All rights reserved.
//

#import "UIScrollView+SQIAdditions.h"

@implementation UIScrollView (SQIAdditions)

static char *ScrBlockKey = "ScrBlockKey";
static char *WillBeginDraggingBlockKey = "WillBeginDraggingBlockKey";
static char *DidEndDraggingBlockKey = "DidEndDraggingBlockKey";


- (void)setSqi_scrBlock:(void (^)(void))sqi_scrBlock {
    objc_setAssociatedObject(self, ScrBlockKey, sqi_scrBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(void))sqi_scrBlock {
    return objc_getAssociatedObject(self, ScrBlockKey);
}

- (void)setSqi_willBeginDraggingBlock:(void (^)(void))sqi_willBeginDraggingBlock {
    objc_setAssociatedObject(self, WillBeginDraggingBlockKey, sqi_willBeginDraggingBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(void))sqi_willBeginDraggingBlock {
    return objc_getAssociatedObject(self, WillBeginDraggingBlockKey);
}

- (void)setSqi_didEndDraggingBlock:(void (^)(void))sqi_didEndDraggingBlock {
    objc_setAssociatedObject(self, DidEndDraggingBlockKey, sqi_didEndDraggingBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(void))sqi_didEndDraggingBlock {
    return objc_getAssociatedObject(self, DidEndDraggingBlockKey);
}

@end
