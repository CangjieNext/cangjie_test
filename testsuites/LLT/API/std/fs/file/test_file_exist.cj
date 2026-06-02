/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (Windows) DEPENDENCE: chang_file_attr.c
// (Windows) EXEC: gcc chang_file_attr.c -o chang_file_attr.exe
// (Windows) EXEC: chang_file_attr.exe
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// (Windows)EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args

import std.fs.*

@Test
class test_win_rar_file_exist {
    @TestCase
    func test() {
        @Expect(exists("./chang_file_attr.c"))
    }
}
