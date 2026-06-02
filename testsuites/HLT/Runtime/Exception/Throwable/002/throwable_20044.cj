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
// (not O2) ASSERT: scan success
// (not O2) ASSERT: scan throwable_20044.cj:22
class A <: Exception {}

class B <: Exception {}

func test(): Int64 {
    var res = 5
    try {
        let fut: Future<Int64> = spawn {
            throw A()
            return 0
        }
        try {
            res = fut.get()
        } catch (e: Exception) {
            throw e // res is still 5.
        }
    } catch (e: Exception) {
        e.printStackTrace()
    }
    return res - 5
}

main() {
    test()
    print("success")
    return 0
}

// ASSERT: scan An exception has occurred
