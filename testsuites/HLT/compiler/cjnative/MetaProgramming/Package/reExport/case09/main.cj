/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define.cj ./mod1 common2.cj
// EXEC: %compiler %compile_lib_opt ./mod1/src/p1/*.cj -o mod1/libhost1.%middle
// EXEC: %compiler %compile_lib_opt common2.cj -o libhost2.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt ./mod1/src/p1/*.cj -o mod1/libtarget1.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt common2.cj -o libtarget2.%middle
// EXEC: %compiler %cmp_macro define.cj -Lmod1 -lhost1 -L. -lhost2
// EXEC: %run_macro %compiler %cmp_opt %f -Lmod1 -ltarget1 -L. -ltarget2 -o %output
// RUN-EXEC: %run %run_opt %output %run_macro_opt %run_args

import M.*

main() {
    var a = @M1()
    return a
}
