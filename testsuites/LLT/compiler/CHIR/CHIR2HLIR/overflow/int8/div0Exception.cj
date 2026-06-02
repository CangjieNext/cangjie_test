// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %enableCompileDebug %f %diag_json -Woff unused -o %n.%suffix 2>&1 | compare %f

func test(): Int64 {
    var x = 1
    var y = 1
    try {
        y = x / (x - 1)
    } catch (e: ArithmeticException) {
        print("catch!")
    }
    return 0
}

main() {
    test()
}
// ASSERT: scan chir_divisor_is_zero
