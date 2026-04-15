// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj %f.expect
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %run_macro %compiler %cmp_opt %macro_parallel %f --debug-macro -o %output
// EXEC: %diff %f.macrocall %f.expect

import define.*

@SAME
@SAME[123]
enum A<T> {
    @SAME
    @SAME[123]
    a
    | @SAME
    @SAME[123]
    a(T)
    | @SAME
    @SAME[123]
    a(T, T)
    | @B[123]
    a(T, T, T)
}

main() {
    return 0
}

