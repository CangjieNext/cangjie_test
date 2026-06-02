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
    var res = match (m) {
        case 2 => ifoo2
        case 3 => ifoo3
        case _ => return ifoo5
    }
    return res
}

func hoo(m: Int32) {
    var a: Int32 = 1
    let b: Int32 = 2
    func ifoo1(x!: Int32 = a) {
        return x
    }
    func ifoo4(x!: Int32 = b) {
        return x
    }
    var res = match (m) {
        case 1 => ifoo1
        case _ => return ifoo4
    }
    return res
}
// ASSERT: scan sema_use_func_capture_var_alone
