// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macroFoo.cj
// EXEC: %compiler %cmp_macro macroFoo.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import pkg1.*

@Foo
interface A {
    static func test(input: Int32): Int64 {
        1
    }
    static func test(input: Int64): Int64 {
        2
    }
    func test2(input: Int64): Int64
}

main() {
    var a = test()
    if (a != 42) {
        return 1
    }
    return 0
}
