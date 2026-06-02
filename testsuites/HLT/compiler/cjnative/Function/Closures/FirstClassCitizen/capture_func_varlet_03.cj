/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f  -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    let c1 = case01()
    if (c1 != 1) {
        return 1
    }
    let c2 = case02()
    if (c2 != 1) {
        return 1
    }
    let c3 = case03()
    if (c3 != 1) {
        return 1
    }
    let c4 = case04()
    if (c4 != 1) {
        return 1
    }
    let c5 = case05()
    if (c5 != 1) {
        return 1
    }
    0
}

func case01() {
    var a: Int32 = 1
    func foo1(x!: Int32 = a) {
        return x
    }
    return foo1()
}

func case02() {
    var a: Int32 = 1
    func foo2() {
        var x = a;
        return x
    }
    return foo2()
}

func case03() {
    var a: Int32 = 1
    func foo3() {
        return a
    }
    return foo3()
}

func case04() {
    var a: Int32 = 1
    func foo4() {
        a
    }
    return foo4()
}

func case05() {
    var a: Int32 = 1
    func foo5() {
        a;
        return 1
    }
    return foo5()
}
