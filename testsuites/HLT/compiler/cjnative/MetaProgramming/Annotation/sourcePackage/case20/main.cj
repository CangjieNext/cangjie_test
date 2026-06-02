/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %compiler %cmp_opt %macro_lib %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package test

import define.*

main() {
    var fileLine = @N(
        @M("11")
        )
    if (fileLine != "test11") {
        return 1
    }
    return 0
}
