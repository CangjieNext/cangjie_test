// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import "Fraction.h"

@implementation FractionForeignName
-(id) initWithNum: (int) inum andDenom: (int) idenom {
	if (self = [super init]) {
        self->num = inum;
        // division by zero is not allowed
        if (denom == 0) {
            return nil; // <- returning nil here
        }
        self->denom = idenom;
    }
    
    return self; // <- returning nil here, if [super init] failed
}
@end
