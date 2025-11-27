/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: checkConstVarName.cj
// EXEC: %compiler checkConstVarName.cj --output-type=dylib -o libplugin.%dylib_suffix -lstdx.plugin %import-cangjie-stdx
// EXEC-PIPE-1: %compiler --plugin=libplugin.%dylib_suffix %f %cmp_opt %compile_lib_opt %import-cangjie-stdx 2>&1 | compare %f

public const all_uppercase = 1

/* SCAN
warning: const_var_not_uppercase: const var name is not all uppercase: all_uppercase, should be ALL_UPPERCASE
  ==> checkConstVarName.bad.cj:14:1:
   | 
14 | public const all_uppercase = 1
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff plugin`

1 warning generated, 1 warning printed.
*/
