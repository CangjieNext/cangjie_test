/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_macro test.cj
// EXEC: %compiler %cmp_opt  %f -o %output
// RUN-EXEC: %run %run_opt %output  %run_args

import test.*

func foo(input!: IntNative = @M[0](+0)) {
    input
}

main() {
    return foo()
}
