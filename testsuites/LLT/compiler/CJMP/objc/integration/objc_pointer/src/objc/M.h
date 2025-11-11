// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import <Foundation/Foundation.h>
#import <stddef.h>
#import "K.h"

@interface N : NSObject {
@public
    double f;
}
- (id)init;
- (double*)fPtr: (double*) value;
@end

@interface M : NSObject {
    double f;
    int64_t i;
    int64_t* p;
    N* s;
    K* ss;
}
- (id)init;
- (double*)fPtr: (double*) value;
- (int64_t*)iPtr: (int64_t*) value;
- (int64_t**)pPtr: (int64_t**) value;
- (N*__strong*)sPtr: (N*__strong*) value;
- (K*__strong*)ssPtr: (K*__strong*) value;

@end
