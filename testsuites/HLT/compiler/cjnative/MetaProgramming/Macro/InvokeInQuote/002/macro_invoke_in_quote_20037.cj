/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define_20037.cj
// EXEC: %compiler %cmp_macro define_20037.cj
// EXEC: %compiler %cmp_opt %f  -o %output
// RUN-EXEC: %run %run_opt %output

package use

import std.ast.*
import define_20037.*

interface A {
    @Y
    func a(): Int64
}

main() {
    return 0
}
