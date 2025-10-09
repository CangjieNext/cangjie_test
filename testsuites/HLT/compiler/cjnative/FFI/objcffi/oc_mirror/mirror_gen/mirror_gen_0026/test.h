/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import <Foundation/Foundation.h>

@interface A : NSObject
@end

@protocol B <NSObject>
@end

typedef struct {
} S;

@interface test : NSObject {
@public
    int a1;
    bool a2;
    NSString *a3;
    A *a4;
    id<B> a5;
    S a6;
}
@end
