// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC-0: %run %run_args %run_opt %output 2>&1

import define.*
import std.ast.*

main() {
    let x = ["hello"]
    let y = @M2(quote($(x.size)))
    if (y[0].value != "1") {
        return 1
    }
    let z = @M2(quote($(x[0])))
    if (z[0].value != "hello") {
        return 2
    }
    let q = @M2(quote($x == $(x[0])))
    for (token in q) {
        if (token.value == "x") {
            return 3
        }
    }
    return 0
}
