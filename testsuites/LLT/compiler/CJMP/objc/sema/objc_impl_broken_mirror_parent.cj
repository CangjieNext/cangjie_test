// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_objc_interop 2>& 1 | compare %f

// Same as objc_mirror_broken_parent.cj, but the clean subtype is an @ObjCImpl, which reads the base constructor
// of its broken @ObjCMirror parent through a different path.
// ASSERT: scan error: Objective-C mirror property type must be Objective-C compatible
// ASSERT: scan-not Internal Compiler Error

import objc.lang.*

@ObjCMirror
public open class M {
    init()
    public prop bad: Array<Int64>
}

@ObjCImpl
public class B <: M {
    init() {}
}
