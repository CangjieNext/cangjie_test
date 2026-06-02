// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-ERRCHECK: %run %run_opt %output %run_args
// ASSERT: scan An exception has occurred:
// ASSERT: scan OverflowException: The result would be greater than Int8.Max.

main() {
    var f: Float64 = 16549841.89
    var i: Int8 = Int8(f)
    println(i)
    return 0
}
