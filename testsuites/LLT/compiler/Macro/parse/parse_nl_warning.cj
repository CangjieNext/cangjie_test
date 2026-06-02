// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %run_macro %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f
// ASSERT: scan parse_nl_warning
// ASSERT: scan the warning originates in the macro `Mdiag` (consider using `--debug-macro` for more info)


import define.*
import std.collection.ArrayList

@M1
class A {
    let data = "aaa"
        + "test"
    let key = "class A"
    func test() {
        let errors: ArrayList<String> = ArrayList<String>()
        if (true) {
            errors.add("Sum of children pools' alloc fraction should be less than 1 got: ${data}"
                + " for pool: ${key}")
            println(errors)
        }
    }
}

@Mdiag
class B {
    func test() {
        println("bbb")
    }
}

main() {
    A().test()
    B().test()
}
