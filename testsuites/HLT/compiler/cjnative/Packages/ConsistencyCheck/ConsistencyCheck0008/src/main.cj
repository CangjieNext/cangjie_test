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
// EXEC: %compiler %cmp_opt --import-path mod mod/a.%middle %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import a.*

main() {
    return a1 - 1
}
