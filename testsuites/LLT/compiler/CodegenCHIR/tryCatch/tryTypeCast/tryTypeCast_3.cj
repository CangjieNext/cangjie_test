// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 255

@OverflowWrapping
main() {
    var f: Float64 = 563.0
    try {
        var x = UInt8(f)
        println(x)
    } catch (e: Exception) {
        println(100)
    }
    return 0
}
