/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE:  test.cj
// EXEC: %compiler %cmp_macro test.cj
// EXEC: %compiler %cmp_opt  %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import test.*

func a(input: Bool): Bool {
    true
}

main(): Int64 {
    @M(true|>a)
    @M(true|>(a~>a))
    return 0
}
