/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define.cj common1.cj common2.cj
// compile dependent lib for macro package.
// EXEC: %compiler %compile_lib_opt common1.cj -o libhost1.%middle
// EXEC: %compiler %compile_lib_opt common2.cj -o libhost2.%middle
// compile dependent lib for main package.
// EXEC: %compiler %cmp_opt %compile_lib_opt common1.cj -o libtarget1.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt common2.cj -o libtarget2.%middle
// compile macro package.
// EXEC: %compiler %cmp_macro define.cj -L. -lhost1 -lhost2
// compile main package.
// EXEC: %compiler %cmp_opt %f -o %output -L. -ltarget1 -ltarget2
// RUN-EXEC: %run %run_opt %output %run_args

import M.*

main() {
    var a = @M1()
    return a
}
