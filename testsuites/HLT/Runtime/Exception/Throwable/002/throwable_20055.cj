/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
import std.collection.*

class A <: Exception {}

class B <: Exception {}

class C <: Exception {}

var temp: Int64 = 1

func f1() {
    return temp + 0
}

func test() {
    var a: ArrayList<Int64> = ArrayList<Int64>([1, 2, 3])
    var b = f1()
    var res = -1
    try {
        a[4] = 3 / (b - 1)
        ()
    } catch (a: ArithmeticException) { // throw ArithmeticException before ArrayIndexOutOfBoundException.
        res = 0
    } catch (e: Exception) {
        e.printStackTrace()
    }
    return res
}

main() {
    return test()
}
