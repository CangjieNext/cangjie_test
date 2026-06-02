// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan-not unreachable expression

main() {
    var tuple_var: (Int32, Int32) = (1, 2);
    let check_01: Bool = ((1, 2) == tuple_var);
    println(check_01);
    let check_02: Bool = ((1, 1) == tuple_var);
    println(check_02);
    let check_03: Bool = ((2, 2) == tuple_var);
    println(check_03);
    return 0
}