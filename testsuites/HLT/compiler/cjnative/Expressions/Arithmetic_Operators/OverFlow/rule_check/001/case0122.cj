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

class A {
    var a: Int8 = 10
    var temp1: Int8 = 127 + a
    A() {}
}

main() {
    var a: A = A()
    return 0
}

// ASSERT: scan An exception has occurred:
// ASSERT: scan OverflowException: add
