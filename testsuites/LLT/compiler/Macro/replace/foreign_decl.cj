// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macro_test.cj %f.expect
// EXEC: %compiler %cmp_macro macro_test.cj
// EXEC: %run_macro %compiler %cmp_opt %f --debug-macro -o %output
// EXEC: %diff %f.macrocall %f.expect

import test.*

@callTest
foreign func test(): Unit

@callTest
func MyFunc() {
    var counter = 0
    return counter
}

main(): Int64 {
    return 0
}
