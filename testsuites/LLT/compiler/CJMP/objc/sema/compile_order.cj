// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC-PIPE-0: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_objc_interop 2>& 1 | compare %f
// ASSERT: scan-not error
// info: checks that declaration order (mirror is before impl and vice versa) does not matter

import interoplib.objc.*

@ObjCMirror
open class M {
    @ForeignName["initWithA:"]
    init(a: Bool)
    init()
}

@ObjCImpl
class A <: M {
    init() {}
}

// MMI is declared above MM
@ObjCImpl
class MMI <: MM {
    init() {}
}

// MMM is declared above MM
@ObjCMirror
class MMM <: MM {
    init()
}

@ObjCMirror
open class MM {
    @ForeignName["initWithA:"]
    init(a: Bool)
    init()
}

// B is declared below MM
@ObjCImpl
class B <: MM {
    init() {}
}
