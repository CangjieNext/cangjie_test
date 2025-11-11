// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) RUN-EXEC-0: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %overflowOpt %import_objc_interop
// (CJNATIVE and Linux) RUN-EXEC-0: sed -i "s/\.dylib/\.so/g" objc-gen/*
// (CJNATIVE and not Windows) RUN-EXEC-PIPE: %cat ./objc-gen/A.m | compare %f

/* SCAN-IN
- (A*)p {
    return (__bridge A*)CJImpl_ObjC_cjworld_A_p_get(self.$registryId);
}
*/
/* SCAN-IN
- (void)setP:(A*)value {
     CJImpl_ObjC_cjworld_A_p_set(self.$registryId, (__bridge void*)value);
}
*/

package cjworld

import objc.lang.*

@ObjCMirror
public open class M {
    init()
}

@ObjCImpl
public class A <: M {
    public mut prop p: A {
        get() {
            this
        }
        set(value) {

        }
    }
}
