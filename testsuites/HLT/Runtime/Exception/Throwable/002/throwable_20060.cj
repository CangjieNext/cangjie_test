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

open class A <: Exception {}

open class B <: A {}

class C <: B {}

var res = 0b0000

func test() {
    try {
        throw C()
        res |= 0b0001
    } catch (a: Exception) {
        res |= 0b0010
        throw B()
    }
}

func foo() {
    try {
        test()
        res |= 0b0100
    } catch (e: Exception) {
        if (e is B) {
            res |= 0b1000
        }
    }
}

main() {
    foo()
    print("res is ${res}\n")
    return res - 0b1010
}
