/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

main(): Int64 {
    return 0
}

func case01() {
    var a: Int32 = 1
    func foo1(x!: Int32 = a) {
        return x
    }
    func foo2() {
        var x = a;
        return x
    }
    func foo3() {
        return a
    }
    func foo4() {
        a
    }
    func foo5() {
        a;
        return 1
    }
    var a1 = foo1
    var a2 = foo2
    var a3 = foo3
    var a4 = foo4
    var a5 = foo5
}
// ASSERT: scan sema_use_func_capture_var_alone
