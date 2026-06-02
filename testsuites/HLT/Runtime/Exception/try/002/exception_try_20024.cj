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

open class A <: Exception {}

class B <: A {}

func test() {
    var a = 0
    try {
        return a
    } catch (_: B) {
        print("hello catch\n")
    } finally {
        a = 1
    }
    0
}

main() {
    return test()
}
