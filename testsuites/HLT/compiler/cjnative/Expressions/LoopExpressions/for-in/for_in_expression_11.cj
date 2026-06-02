/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (JS) EXEC: cp -r %stdpath .
// EXEC: %compiler %cmp_opt %f  -o %output
// RUN-EXEC: %run %run_opt %output %run_args
import std.collection.*

main(): Int64 {
    if (case01() != 20) {
        return 1
    }
    if (case02() != 20) {
        return 2
    }
    return 0
}

func case01() {
    func x(input: Int64): Int64 {
        input * 2
    }
    var s: Int64 = 5
    let arr: ArrayList<Int64> = ArrayList<Int64>(s, x)
    var a: Int64 = 0
    for (item in arr) {
        a = a + item
    }
    a
}

func case02() {
    func x(input: Int64): Int64 {
        input * 2
    }
    var s: Int64 = 5
    let arr: ArrayList<Int64> = ArrayList<Int64>(s, x)
    var a: Int64 = 0
    let it = arr.iterator()
    while (true) {
        match (it.next()) {
            case None => break
            case Some(v) => match (v) {
                case w => a = a + w
                case _ => continue
            }
        }
    }
    a
}
