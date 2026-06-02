/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../mod1
// EXEC: %compiler %cmp_opt %pkg_opt mod1/src/a  %compile_lib_opt -o mod1/a.%middle
// EXEC: %mv mod1 mod
// EXEC: %mv mod/mod1.a.cjo mod/mod.a.cjo
// ERRCHECK: %compiler %cmp_opt mod/a.%middle %f -o %output

import mod.a.*

main() {
    return a1 - 1
}
// ASSERT: scan package_import_inconsistent
