/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: mp
// EXEC: %compiler %cmp_opt mp/test_com.cj %compile_chir_opt -o ./
// EXEC: %compiler %cmp_opt mp/test_plat.cj %compile_dylib_opt_cjmp -o ./
// EXEC: %compiler %cmp_opt %f %link_cjmp -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import mp.*

main() {
    var c = C<Float64, Int64, Int32>()
    return f1() + f2() + c.foo(1, 2) + Int64(c.foo(1.0, 2.0)) + Int64(c.foo(Int32(1), Int32(2))) - 18
}
