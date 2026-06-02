// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-0: %compiler %cmp_opt %n.cj %disableReflection --int-overflow=wrapping -o %n.%suffix
// EXEC-0: %run %run_opt %n.%suffix 2>&1 | compare %f

/* SCAN
1024
0
-19683
-7752514261426648835
*/
func exp(x: Int64, y: UInt64): Int64 {
    return x ** y
}

main() {
    println(exp(2, 10))
    println(exp(2, 65))
    println(exp(-3, 9))
    println(exp(-3, 65))
}
