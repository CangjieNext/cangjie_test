// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) RUN-EXEC-0: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %overflowOpt %import_objc_interop
// (CJNATIVE and Linux) RUN-EXEC-0: sed -i "s/\.dylib/\.so/g" objc-gen/*
// (CJNATIVE and not Windows) RUN-EXEC-PIPE: %cat ./objc-gen/A.m | compare %f

/* SCAN-IN
- (id)initWithM:(M*)m {
    if (self = [super init]) {
        self.$registryId = CJImpl_ObjC_cjworld_A_initWithM_PuCN7cjworld1ME((__bridge void*)self, (__bridge_retained void*)m);
    } 
*/

package cjworld

import objc.lang.*

@ObjCMirror
public open class M {
    @ForeignName["initWithM:"]
    init(m: M)
}

@ObjCImpl
public class A <: M {
    @ForeignName["initWithM:"]
    public init(m: M) {
        super(m)
    }
}
