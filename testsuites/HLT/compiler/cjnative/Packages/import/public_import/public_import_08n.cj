/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: mod
// (not iOS) EXEC: %compiler %cmp_opt --module-name mod %compile_lib_opt mod/define.cj -o mod/define.%middle
// (not iOS) EXEC: %compiler %cmp_opt %compile_dylib_opt %f mod/define.%middle -o %output
// (not CJNATIVE) EXEC: %compiler %cmp_opt_no_output %compile_lib_opt %f mod/define.%middle -o %output

macro package test

public import mod.define.*

main() {
    return M()
}
