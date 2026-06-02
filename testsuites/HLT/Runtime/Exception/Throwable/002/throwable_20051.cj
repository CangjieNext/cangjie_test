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

func test() {
    var res = 0b0000
    while (true) {
        try {
            try {
                var a = ArrayList<Int64>([1])
                a[-1]
                ()
            } catch (_: A) {
                res |= 0b0001
            } finally {
                res |= 0b0010
            }
        } catch (_: Exception) {
            res |= 0b0100
        } finally {
            res |= 0b1000
            break
        }
    }
    return res
}

main() {
    0b1110 - test()
}
