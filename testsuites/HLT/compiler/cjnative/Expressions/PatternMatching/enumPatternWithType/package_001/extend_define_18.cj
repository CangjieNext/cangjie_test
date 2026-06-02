/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: pkg 
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg/foo.cj -o pkg.%middle
// EXEC: %compiler %cmp_opt %f  pkg.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import pkg
import pkg.*

var a1 = Year(8)
var b1 = match (a1) {
    case pkg.TimeUnit.Month => 3
    case pkg.TimeUnit.Year(_) => 4
    case _ => 8
}

main(): Int64 {
    return b1 - 4
}
