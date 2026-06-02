// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler --int-overflow=wrapping %cmp_opt %f -o %output
// EXEC: %run %output %run_args 2>&1 | compare %f
// ASSERT: scan 1024\n2147483647\n2147483647\n0\n-2147483648\n-2147482626\n-2147482624\n
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

@OverflowWrapping
main() {
    let x0: Float32 = 1024.1024
    let y0: Int32 = Int32(x0)
    println(y0)
    let x1: Float32 = 1024e10
    let y1: Int32 = Int32(x1)
    println(y1)
    let x2: Float32 = 3.4e40
    let y2: Int32 = Int32(x2)
    println(y2)
    let x3: Float32 = 3.4e40 * 0.0
    let y3: Int32 = Int32(x3)
    println(y3)
    let x4: Float32 = -3.4e40
    let y4: Int32 = Int32(x4)
    println(y4)
    let res0: Int32 = y0 + y1 + y2 + y3 + y4
    println(res0)
    let res1: Int32 = y0 * y1 * y2 + y3 + y4
    println(res1)
    return 0
}
