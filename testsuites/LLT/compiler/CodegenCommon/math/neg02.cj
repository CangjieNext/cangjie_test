// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan-2 inf

public func negate(x: Float64): Float64 {
    -x
}

main() {
    let x: Float64 = 0.0

    println(x)
    println(1.0 / x)
    println(1.0 / negate(negate(x)))
}
