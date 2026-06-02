// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-0: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan-2 nan
func f16(): Float16 {
    return 0.0
}

public let nan17 = 0.0 / f16() // nan
public let nan18 = 0.0 / Float16(0.0) // nan

main() {
    println(nan17)
    println(nan18)
    return 0
}
