/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../testcase
// EXEC: %compiler %cmp_opt %compile_lib_opt %pkg_opt testcase/a/ -o ./ %compile_lib_opt
// EXEC: %compiler %cmp_opt %compile_lib_opt %pkg_opt testcase/b/ -o ./ %compile_lib_opt
// EXEC: %compiler %cmp_opt %compile_lib_opt %f libtestcase.a.%middle libtestcase.b.%middle -o %output


package testcase
