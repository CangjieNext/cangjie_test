// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg.cj pkg2.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg2.cj -o pkg2.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg.cj -o pkg.%middle
// (CJNATIVE) EXEC: %compiler %cmp_opt pkg.%middle pkg2.%middle %n.cj -o %output
// (not CJNATIVE) EXEC: %compiler %cmp_opt pkg2.%middle pkg.%middle %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

internal import pkg.*
internal import pkg2.*

main() {}
