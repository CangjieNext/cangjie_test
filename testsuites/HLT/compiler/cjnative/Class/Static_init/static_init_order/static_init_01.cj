/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan sema_global_var_used_before_initialization
import std.collection.*

class A {
    static init() {
        // invoke static member function inside static init.
        C.fun()
    }
}

class C {
    static let map = HashMap<String, String>()
    // this function accesses map before it is initialized.
    public static func fun() {
        map.size
    }
}

main() {
    println("hello")
}
