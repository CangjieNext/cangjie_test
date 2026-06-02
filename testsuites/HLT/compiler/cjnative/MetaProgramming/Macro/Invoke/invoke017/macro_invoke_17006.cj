/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE:  define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

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
    | @B
    a(T, T, T)
}

main() {
    A<Int64>.b(1)
    return 0
}
// ASSERT: scan macro_expect_plain_macro
