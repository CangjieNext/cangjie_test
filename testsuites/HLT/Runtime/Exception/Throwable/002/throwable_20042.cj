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

class A <: Exception {}

class B <: Exception {}

func test(): Int64 {
    var res = -1
    try {
        let fut: Future<Int64> = spawn {
            throw A()
            return 0
        }
        try {
            res = fut.get()
        } catch (e: Exception) {
            e.printStackTrace(); // matched
            res = 1
        }
    } catch (e: Exception) {
        return -1
    }
    return res - 1
}

main() {
    test()
}
