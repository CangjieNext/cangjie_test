// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt --int-overflow saturating %enableCompileDebug %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 0

func getFP() {
    -2012.0
}

main(): Int64 {
    var a = UInt64(Float32({=> 100.0 + 2.0 + getFP()}())) // --int-overflow saturating should have no effect
    println(a)
    return 0
}
