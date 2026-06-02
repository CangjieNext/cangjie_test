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
    return temp + 2
}

func test(): Int64 {
    var res = 2
    var (a, b, c) = (1, 2, 1)
    try {
        a = f1()
        try {
            b = b / (a - 3)
        } catch (e: ArithmeticException) {
            res = 0
        }
        c = 3
    } catch (e: ArithmeticException) {
        res = 1
    }
    return res // should be 0
}

main() {
    test()
}
