/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    if (case01() != ()) {
        return 1
    }
    if (case02() != ()) {
        return 1
    }
    if (case03() != 1) {
        return 1
    }
    if (case04() != ()) {
        return 1
    }
    if (case05() != ()) {
        return 1
    }
    if (case06() != 2) {
        return 1
    }
    if (case07() != 2) {
        return 1
    }
    if (case08() != 1) {
        return 1
    }
    if (case09() != 2) {
        return 1
    }
    if (case10() != 2) {
        return 1
    }
    return 0
}

func case01() {
    var a = {=>}
    var b = a()
    return b
}

func case08() {
    var a = {=> 1}
    var b = a()
    return b
}

func case09() {
    var a = {
        =>
        1;
        2
    }
    var b = a()
    return b
}

func case10() {
    var a = {
        =>
        1
        2
    }
    var b = a()
    return b
}

func case02() {
    var a = {=>}
    var b = a()
    return b
}

func case03() {
    var a = {=> 1}
    var b = a()
    return b
}

func case06() {
    var a = {
        =>
        1;
        2
    }
    var b = a()
    return b
}

func case04() {
    var a = {a: Int64 =>}
    var b = a(1)
    return b
}

func case05() {
    var a = {a: Int64, b: Int32 =>}
    var b = a(1, 2)
    return b
}

func case07() {
    var a = {
        a: Int64, b: Int32 =>
        1;
        2
    }
    var b = a(1, 2)
    return b
}
