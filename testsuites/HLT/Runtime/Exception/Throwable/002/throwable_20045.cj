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
// (not O2) ASSERT: scan throwable_20045.cj:22
class A <: Exception {}

class B <: Exception {}

func test(): Int64 {
    let f = spawn {
        var res = -1
        try {
            let fut: Future<Int64> = spawn {
                throw A()
                return 0
            }
            try {
                res = fut.get()
            } catch (e: Exception) {
                throw e // matched
            }
        } catch (e: Exception) {
            e.printStackTrace()
            return -1 // matched
        }
        return res // -1
    }
    var res = -2
    try {
        res = f.get() // -1
    } catch (e: Exception) {
        throw e;
        res = 2
    }
    return res + 1
}

main() {
    test()
}

// ASSERT: scan An exception has occurred
