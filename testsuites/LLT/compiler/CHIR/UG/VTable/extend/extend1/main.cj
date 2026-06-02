// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: package1.cj package2.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt package1.cj -o pkg1.a
// EXEC: %compiler %cmp_opt %compile_lib_opt package2.cj pkg1.a -o pkg2.a
// EXEC: %compiler %cmp_opt %f pkg1.a pkg2.a -o %n.%suffix
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan 2

import test.*
import test1.*

main() {
    var a = A2()
    a.goo()
}
