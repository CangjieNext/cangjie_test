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
// EXEC: %run_macro %compiler %cmp_opt  %f -o %output
// RUN-EXEC: %run %run_opt %output  %run_macro_opt %run_args

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
    | @B3[1, 2, 3]
    a(T, T, T)

    @SAME
    @SAME[123]
    public prop x: Int64 {
        get() {
            return 1
        }
    }
}

main() {
    A<Int64>.b(1, 1)
    return 0
}
