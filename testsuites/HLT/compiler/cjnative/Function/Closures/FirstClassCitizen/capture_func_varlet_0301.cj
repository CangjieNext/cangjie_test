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

func case02() {
    var a: Int32 = 1
    return {
        =>
        var x = a;
        return x
    }()
}

func case03() {
    var a: Int32 = 1
    return {=> return a}()
}

func case04() {
    var a: Int32 = 1
    return {=> a}()
}

func case05() {
    var a: Int32 = 1
    return {
        =>
        a;
        return 1
    }()
}
