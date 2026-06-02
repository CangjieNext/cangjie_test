/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../mod1
// EXEC: %compiler %cmp_opt %pkg_opt mod1/src/a --module-name mod1 %compile_lib_opt -o mod1/a.%middle
// EXEC: %mv mod1/* ./
// ERRCHECK: %compiler %cmp_opt a.%middle %f -o %output

import aaa.*

main() {
    return a1 - 1
}
// ASSERT: scan package_search_error
