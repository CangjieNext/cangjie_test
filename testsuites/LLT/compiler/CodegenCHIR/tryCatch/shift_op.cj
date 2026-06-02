// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan 0

@OverflowWrapping
func foo(num: Int64) {
    try {
        var a = 1 << num
    } catch (e: ArithmeticException) {
        println(0)
    }
}

main() {
    foo(128)
    return 0
}
