// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macro_test.cj
// EXEC: %compiler macro_test.cj %cmp_macro
// EXEC: %pwd_to_ld_path %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import test.*
import std.ast.*
import std.sync.*

func foo(): Tokens {
    var a: ReentrantMutex = ReentrantMutex()
    synchronized(a) {
        @Zero[0](1)
    }
    return quote(0)
}

main(): Int64 {
    let t = foo()
    if (t[0].value != "0") {
        return 1
    }
    return 0
}
