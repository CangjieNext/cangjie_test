// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import <Foundation/Foundation.h>
#import "K.h"
#import "F.h"

@interface M : NSObject
- (id)init;
- (F*)instantiateOptionF;
- (F*)instantiateOptionFNil;
- (void)oneParamOption:(F*)param;
@end
