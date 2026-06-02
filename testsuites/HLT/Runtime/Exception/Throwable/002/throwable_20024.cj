/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args | compare %f
// ASSERT: scan in_finally

func test(x: Int64) {
    var res = 3
    try {
        throw Exception()
    } catch (e: Exception) {
        throw Exception()
        return res
    } finally {
        res = 0
        println("in_finally");
        return res
    }
    println("end_finally")
    res = 4
    return res
}

main() {
    test(1)
    print("success")
    return 0
}
