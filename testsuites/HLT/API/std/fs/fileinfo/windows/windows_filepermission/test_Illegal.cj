/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

import std.fs.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class Test_Illegal {
    //Illegal Path
    @TestCase
    func case1(): Unit {
        var sum = 0
        var arr1 = ["", "../../../../utils/none", "../../../../utils/\0", "../../../../utils/dir1/仓颉aa", "\0"]
        for (s in arr1) {
            try {
                var f = FileInfo(s)
            } catch (e: FSException | IllegalArgumentException) {
                sum += 1
            }
        }
        @Expect(sum, 5)
    }
}
