// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import "Fraction.h"

@implementation Fraction
-(id) initWithNum: (int) num andDenom: (int) denom {
	if (self = [super init]) {
    	self->num = num;
        // division by zero is not allowed
        if (denom == 0) {
            return nil; // <- returning nil here
        }
        self->denom = denom;
    }
    
    return self; // <- returning nil here, if [super init] failed
}
-(void) doStuff {
    self->num = 0;
}
@end
