// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../../use_macro_test
// EXEC: %compiler %pkg_opt use_macro_test/src/boo %compile_lib_opt -o libboo.%middle
// EXEC: %compiler %pkg_opt use_macro_test/src/ libboo.%middle -o %output %cmp_utest_opt
// EXEC: %run %run_opt %run_args %output %run_utest_opt

import boo

@Test
class Testmain {
    @TestCase
    public func casemain(): Unit {
        let b = boo.two
        expectEqual("b", "2", b, 2)
    }
}
