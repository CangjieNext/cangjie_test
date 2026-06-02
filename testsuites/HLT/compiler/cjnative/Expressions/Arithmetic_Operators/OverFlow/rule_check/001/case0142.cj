/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan OverflowException: add

func test() {
    var b: Int8 = 0
    func temp(): Int8 {
        b = b + 1
        return 1
    }
    var c: Int8 = temp()
    let a: Int8 = 127 + b
    return c + a
}

main() {
    test()
    1
}
