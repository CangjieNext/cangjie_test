/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define.cj common.cj
// compile dependent lib for macro package.
// EXEC: %compiler %compile_lib_opt common.cj -o libhost.%middle
// compile dependent lib for main package.
// EXEC: %compiler %cmp_opt %compile_lib_opt common.cj -o libtarget.%middle
// compile macro package.
// EXEC: %compiler %cmp_macro define.cj -L. -lhost
// EXEC: %run_macro %compiler %cmp_opt %f -L. -ltarget -o %output
// RUN-EXEC: %run %run_opt %output %run_macro_opt %run_args

import M.*

main() {
    var a = @M1(0)
    return a - 12
}
