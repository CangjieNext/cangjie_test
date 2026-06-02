/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: a
// EXEC: %compiler %cmp_opt %pkg_opt a %compile_lib_opt -o a.%middle
// EXEC: %mv a.cjo a1.cjo
// ERRCHECK: %compiler %cmp_opt a.%middle %f -o %output

import a1.*

main() {
    return a1 - 1
}
// ASSERT: scan package_import_inconsistent
