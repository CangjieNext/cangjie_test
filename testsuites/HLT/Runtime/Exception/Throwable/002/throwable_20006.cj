/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output

func test() {
    var n = 2
    try {
        n = n / (n - 2)
    } catch (e: Error) {
    //e.printStackTrace()
    } finally {
        print("finally_in_test!")
    }
}

main() {
    var n = [1, 2, 3]
    var res = 3
    try {
        test()
    } catch (e: ArithmeticException) {
        print("catch!");
        e.printStackTrace()
    } finally {
        res = 0
    }
    return res
}
// ASSERT: scan chir_divisor_is_zero
// ASSERT: scan chir_dce_unused_variable
