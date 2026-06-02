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
class A<T> {
    var x: T
    @SAME
    @SAME[123]
    init(i: T) {
        @SAME @SAME[123]
        var temp = i
        x = temp
    }
}

@SAME
@SAME[123]
struct B<T> {
    var x: T
    @SAME
    @SAME[123]
    init(i: T) {
        @SAME @SAME[123]
        var temp = i
        x = temp
    }
}

main() {
    A<Int64>(0).x + A<Int64>(0).x
}
