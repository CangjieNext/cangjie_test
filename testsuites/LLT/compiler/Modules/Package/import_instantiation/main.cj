// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg2.cj pkg1.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg2.cj -o pkg2.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg1.cj -o pkg1.%middle
// (CJNATIVE) EXEC:%compiler %cmp_opt pkg1.%middle pkg2.%middle %n.cj -o %n.%suffix
// (not CJNATIVE) EXEC:%compiler %cmp_opt pkg2.%middle pkg1.%middle %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

internal import pkg1.*

main(): Int64 {
    let a: Array<Float32> = [1.0, 2.0, 3.0]
    0
}
