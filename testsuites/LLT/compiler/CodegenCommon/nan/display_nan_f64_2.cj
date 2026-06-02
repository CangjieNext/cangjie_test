// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-0: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan-2 nan
func f64(): Float64 {
    return 0.0
}

public let nan17 = 0.0 / f64() // nan
public let nan18 = 0.0 / Float64(0.0) // nan

main() {
    if (nan17.toString().size != 3 || nan17.toString().size != nan18.toString().size) {
        return 1
    }
    println(nan17.toString())
    println(nan18.toString())
    return 0
}
