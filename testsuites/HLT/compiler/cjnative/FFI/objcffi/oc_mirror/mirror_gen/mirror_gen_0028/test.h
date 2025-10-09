/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import <Foundation/Foundation.h>

@interface test : NSObject {
    int a1;
    const int a2;
@private
    int a3;
    const int a4;
@protected
    int a5;
    const int a6;
@public
    int a7;
    const int a8;
@package
    int a9;
    const int a10;
}
@end
