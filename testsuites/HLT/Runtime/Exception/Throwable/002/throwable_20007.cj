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

var temp: Int64 = 1

func f1() {
    return temp + 0
}

main() {
    var a = 0
    var b = 0
    var res = 0
    try {
        a = f1()
        b = 1 / (a - 1)
    } catch (e: ArithmeticException) {
        if (a == 1 && b == 0) {
            return res
        }
    } finally {
        res = 3
    }
    return res
}
