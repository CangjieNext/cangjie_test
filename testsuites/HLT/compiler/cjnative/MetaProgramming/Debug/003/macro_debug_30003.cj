/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %run_macro %compiler %cmp_opt  %f %macro_debug -o %output
// RUN-EXEC: %run %run_opt %output %run_macro_opt %run_args

package use

import define.*

func test(x: () -> Unit) {}

open class X<T> {}

interface Y<T> {}

@SAME
class A<T, R> <: X<(Int64) -> Int64> & Y<(Int32, Int32)> where T <: X<Int8> & Y<Int16>, R <: X<Int8> & Y<Int16> {
    init() {
        a = 0
    };
    A(var a: Int64) {}
    mut prop x: Int64 {
        get() {
            0
        }
        set(v) {}
    }
    operator func +(i: Int64) {}
    static func test() {}
}

main() {
    0
}
