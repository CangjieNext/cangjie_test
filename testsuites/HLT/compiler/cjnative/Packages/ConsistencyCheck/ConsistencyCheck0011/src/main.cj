/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../mod1
// EXEC: %compiler %cmp_opt %pkg_opt mod1/src/a %compile_lib_opt -o mod1/a.%middle
// EXEC: %mv mod1/mod.a.cjo mod1/mod1.a.cjo
// EXEC: %compiler %cmp_opt %pkg_opt mod1/src/a/b %compile_lib_opt -o mod1/b.%middle
// EXEC: %mv mod1/mod.a.b.cjo mod1/mod1.a.b.cjo
// EXEC: %compiler %cmp_opt %pkg_opt mod1/src/c %compile_lib_opt -o mod1/c.%middle
// EXEC: %mv mod1/mod.c.cjo mod1/mod1.c.cjo
// ERRCHECK: %compiler %cmp_opt mod1/a.%middle mod1/b.%middle mod1/c.%middle %f -o %output

import mod1.a.*
import mod1.a.b.*
import mod1.c.*

main() {
    return a1 + b1 + c1 - 3
}
// ASSERT: scan package_import_inconsistent
