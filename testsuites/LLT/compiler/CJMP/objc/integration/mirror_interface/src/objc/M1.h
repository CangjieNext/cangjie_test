// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import <Foundation/Foundation.h>
#import "ProtoM1.h"

@interface M1 : NSObject<ProtoM1>
{
    @private 
    int64_t value;
}
-(id)initWithValue: (int64_t)value;
@end