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
// ASSERT: scan aaa
// ASSERT: scan-not zzz
// ASSERT: scan OverflowException: add

@OverflowThrowing
func test(a: Int8, b: Int8) {
    a - b
    a / b
    print("aaa")
    a + b
    print("zzz")
    a * b
    -a
    var c = a
    c++
    c--
    return 1 // a+b will overflow.
}

main() {
    return Int64(test(100, 100))
}
