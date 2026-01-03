// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import <Foundation/Foundation.h>
#import <stddef.h>
#import "K.h"

struct S {
    int64_t a;
    double b;
};

@interface N : NSObject {
@public
    int64_t _id;
}
- (id)init;
- (double)mapF: (double(*)(double)) f;
- (N*)letF: (N*(*)(N*)) f;
- (int64_t)id;
@end

@interface M : NSObject
- (id)init;
- (double(*)(double))fPtr;
- (K*)makeK;
- (N*(*)(N*))makeNFunc;
@end
