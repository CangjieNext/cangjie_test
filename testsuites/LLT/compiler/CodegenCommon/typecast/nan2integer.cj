// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// ERRCHECK: %run %run_opt %output %run_args
// ASSERT: scan OverflowException: Casting Infinite or NaN value to integer.

main(): Int64 {
    let finf: Float32 = 3.4e400
    let fz: Float32 = 0.0
    let b1 = Int32(finf * fz)
    return 0
}
