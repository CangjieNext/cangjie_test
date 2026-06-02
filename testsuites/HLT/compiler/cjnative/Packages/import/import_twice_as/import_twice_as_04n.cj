/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: mod
// EXEC: %compiler %cmp_opt %compile_lib_opt mod/pkg.cj -o mod/pkg.%middle
// EXEC: %compiler %cmp_opt %f mod/pkg.%middle -o %output

import mod.pkg.a as a1
import mod.pkg.a as a2

main() {
    return a1 - 1
}
