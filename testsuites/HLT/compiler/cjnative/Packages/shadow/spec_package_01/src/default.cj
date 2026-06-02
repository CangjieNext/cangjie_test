/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../module_name
// EXEC: %compiler %cmp_opt %mod_name %compile_lib_opt ./module_name/src/package1/*.cj -o module_name/package1.%middle 
// EXEC: %compiler %cmp_opt %mod_name %compile_lib_opt ./module_name/src/package2/*.cj -o module_name/package2.%middle 
// EXEC: %compiler %cmp_opt module_name/package1.%middle module_name/package2.%middle %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import module_name.package1.*
import module_name.{package1, package2}
import module_name.package1.a1
import module_name.{package1.a1, package2.a2}

main(): Int64 {
    var a = package1.a1
    var b = package2.a2
    var c = a1
    var d = a2
    return 0
}
