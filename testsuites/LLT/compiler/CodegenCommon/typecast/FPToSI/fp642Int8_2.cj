// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %int_overflow_opt saturating %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 127
// ASSERT: scan 255

main() {
    var f: Float64 = 16549841.89
    var i: Int8 = Int8(f)
    var ui: UInt8 = UInt8(f)
    println(i)
    println(ui)
    return 0
}
