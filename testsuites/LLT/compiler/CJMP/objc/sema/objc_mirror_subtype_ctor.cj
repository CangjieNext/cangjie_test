// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC-PIPE-0: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_objc_interop 2>& 1 | compare %f
// ASSERT: scan-not error

import interoplib.objc.*

@ObjCMirror
open class M {
    @ForeignName["initWithA:"]
    init(a: Bool)
    init()
}

@ObjCImpl
class A <: M {
    init() {
        super()
    }

    init(b: Bool) { }
    init(i: Int64) { }
    init(a: Int64, b: Bool) { }
    init(a: Int64, b: Bool, d: M) { }
}

@ObjCImpl
class B <: M {
    init() {
        super()
    }
}
