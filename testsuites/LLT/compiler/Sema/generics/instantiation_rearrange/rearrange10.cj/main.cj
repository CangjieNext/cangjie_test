// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ./test.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt test.cj -o test.%middle %enableO2
// EXEC: %compiler %cmp_opt %enableO2 %f test.%middle -o %output
// EXEC: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan foo in extend

import test.*

extend OutlineStyle {
    func foo() {
        println("foo in extend")
    }
}

main() {
    let a = OutlineStyle.AA
    (a as OutlineStyle).getOrThrow().foo()
    0
}