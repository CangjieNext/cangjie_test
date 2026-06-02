/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../module_name
// EXEC: %compiler %cmp_opt %compile_lib_opt ./module_name/src/package1/*.cj -o module_name/package1.%middle %mod_name
// EXEC: %compiler %cmp_opt %compile_lib_opt ./module_name/src/package2/*.cj -o module_name/package2.%middle %mod_name
// ERRCHECK: %compiler %cmp_opt %f --import-path module_name -o %output

import {module_name.package1, package2}

main(): Int64 {
    return 0
}
// ASSERT: scan package_search_error
