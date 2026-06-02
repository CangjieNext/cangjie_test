/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: mod
// EXEC: %compiler %cmp_opt %compile_lib_opt mod/define_macro.cj -o mod/define.%test_suffix
// ERRCHECK: %compiler %cmp_opt %f -o %output

package test

public import mod.define_macro

@M
main() {
    return 0
}
// ASSERT: scan package_cannot_export_macro_package
