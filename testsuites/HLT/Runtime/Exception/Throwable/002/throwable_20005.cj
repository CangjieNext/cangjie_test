/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan catch!
// ASSERT: scan func_test
// (not O2): scan throwable_20005.cj:24

func test() {
    throw Exception("func_test")
}

main() {
    var n = [1, 2, 3]
    var res = 3
    try {
        test()
    } catch (e: Exception) {
        print("catch!");
        e.printStackTrace()
    } finally {
        res = 0
    }
    return res
}
