// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_objc_interop 2>& 1 | compare %f

// `A` is marked broken by the member check, so it gets no registry companion. `B` stays clean, and restoring its
// companion hierarchy must skip it instead of dereferencing the parent companion that was never created.
// ASSERT: scan error: return type of Objective-C mirror method must be Objective-C compatible
// ASSERT: scan-not Internal Compiler Error

import objc.lang.*

@ObjCMirror
public open class M {
    init()
}

@ObjCImpl
public open class A <: M {
    init() {}

    public func broken(): Array<Int64> {
        []
    }
}

@ObjCImpl
public class B <: A {
    init() {}
}
