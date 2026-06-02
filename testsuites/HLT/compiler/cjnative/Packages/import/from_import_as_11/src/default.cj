/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../module_name
// EXEC: %compiler %cmp_opt %compile_lib_opt ./module_name/src/package1/*.cj -o module_name/package1.%middle 
// EXEC: %compiler %cmp_opt module_name/package1.%middle --import-path module_name %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import module_name.package1 as pkg1

main(): Int64 {
    return pkg1.a1 - 1
}
