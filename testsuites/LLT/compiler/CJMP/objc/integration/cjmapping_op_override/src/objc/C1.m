/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

 #import <objc/runtime.h>
 #import "C1.h"

 @implementation C1

 - (id)init {
    if (self = [super init]) {
        printf("objc: C1 init()\n");
    }

    return self;
 }

 @end