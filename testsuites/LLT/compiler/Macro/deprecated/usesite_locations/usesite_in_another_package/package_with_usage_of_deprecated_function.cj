// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ./package_with_definition_of_deprecated_function.cj
// (CJNATIVE)EXEC-PIPE-0: %compiler %cmp_opt ./package_with_definition_of_deprecated_function.cj %macro_lib %compile_shared_lib_opt -o libdefine.%dylib_suffix
// (CJNATIVE)EXEC-PIPE-1: %pwd_to_ld_path %compiler %cmp_opt %f -L. -ldefine -o %output 2>&1 | compare %f
// (not CJNATIVE)EXEC-PIPE-0: %compiler %cmp_opt ./package_with_definition_of_deprecated_function.cj %macro_lib %compile_shared_lib_opt -o define.bc
// (not CJNATIVE)EXEC-PIPE-1: %pwd_to_ld_path %compiler %cmp_opt %f define.bc -o %output 2>&1 | compare %f
// ASSERT: scan function 'foo' is deprecated since 1999.
// ASSERT: scan class 'Class' is deprecated since 1111. msg.

package usage

import define.*

main(): Unit {
    foo()
    Class()
}

