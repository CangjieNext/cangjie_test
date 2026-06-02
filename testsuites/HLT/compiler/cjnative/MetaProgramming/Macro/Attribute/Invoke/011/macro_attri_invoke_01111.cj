/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define_01111.cj  define_01111a.cj
//  EXEC: %compiler define_01111.cj %cmp_macro
//  EXEC: %compiler define_01111a.cj %cmp_macro 
//  EXEC: %compiler %cmp_opt %f -o %output

// RUN-EXEC: %run %run_opt %output %run_args

import define_01111.*
import define_01111a.*

main() {
    var a = 2
    @M[a](=1)
    @M(a=0)
    return a
}
