/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args | compare %f
// ASSERT: scan catch!
// ASSERT: scan-not success

class A <: Exception {}

class B <: Exception {}

func test() {
    var i = 0
    while (i != 10) {
        i++
        try {
            throw A()
        } catch (a: A) {
            print("catch!")
            throw B()
        } finally {
            try {
                return 1
            } finally {
                continue
            }
        }
    }
    return i
}

main() {
    var res = test()
    print("success")
    return res - 10
}
