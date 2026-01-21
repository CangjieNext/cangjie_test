// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: pkg1.cj pkg2.cj pkg3.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg1.cj -o pkg1.a
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg2.cj -o pkg2.a
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg3.cj -o pkg3.a
// EXEC: %compiler %cmp_opt %f pkg1.a pkg2.a pkg3.a -o %n.%suffix
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan I::foo

import test1.*
import test2.*
import test3.*

main() {
    var b = B()
    b.foo()
}