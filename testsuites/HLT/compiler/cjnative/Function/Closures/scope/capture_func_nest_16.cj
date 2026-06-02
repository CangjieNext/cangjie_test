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

func goo(m: Int32) {
    var a: Int32 = 1
    let b: Int32 = 2
    if (true) {
        func ifoo2() {
            var x = a;
            return x
        }
        func ifoo3() {
            return a
        }
        func ifoo5() {
            var x = b;
            return x
        }
        var res1 = ifoo2
        var res2 = ifoo3
    }
    return 0
}

func hoo(m: Int32) {
    var a: Int32 = 1
    let b: Int32 = 2
    if (true) {
        func ifoo1(x!: Int32 = a) {
            return x
        }
        func ifoo4(x!: Int32 = b) {
            return x
        }
        var res1 = ifoo1
    }
    return 0
}
// ASSERT: scan sema_use_func_capture_var_alone
