/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

import std.posix.*
import std.unittest.*
import std.unittest.testmacro.*

var prefixs_01 = ["", "\\\\?\\", "\\\\.\\"]
var prefixs_02 = ["\\\\", "\\\\?\\UNC\\", "\\\\.\\UNC\\"]
var mode_codes: Array<UInt32> = [UInt32(S_IRUSR), UInt32(S_IWUSR), UInt32(S_IRUSR) | UInt32(S_IWUSR), UInt32(S_IXUSR),
    UInt32(S_IRGRP), UInt32(S_IWGRP), UInt32(2 << 30)]

@Test
public class Test_Chmod_01 {
    //non-exist file path
    @TestCase
    func case1(): Unit {
        var s1 = "D:\\cangjie\\mycode\\noNe.txt"
        for (prefix in prefixs_01) {
            var chmod_res_01: Int32 = chmod(prefix + s1, UInt32(S_IRUSR))
            var chmod_res_02: Int32 = chmod(prefix + s1, UInt32(S_IXUSR))
            var chmod_res_03: Int32 = chmod(prefix + s1, UInt32(2 << 30))
            @Expect(chmod_res_01, Int32(-1))
            @Expect(chmod_res_02, Int32(-1))
            @Expect(chmod_res_03, Int32(-1))
        }
    }

    //non-exist directory path
    @TestCase
    func case2(): Unit {
        var s1 = "D:\\cangjie\\mycode\\nonE"
        for (prefix in prefixs_01) {
            var chmod_res_01: Int32 = chmod(prefix + s1, UInt32(S_IRUSR) | UInt32(S_IWUSR))
            var chmod_res_02: Int32 = chmod(prefix + s1, UInt32(S_IRGRP))
            var chmod_res_03: Int32 = chmod(prefix + s1, UInt32(2 << 30))
            @Expect(chmod_res_01, Int32(-1))
            @Expect(chmod_res_02, Int32(-1))
            @Expect(chmod_res_03, Int32(-1))
        }
    }

    //empty path
    @TestCase
    func case3(): Unit {
        for (code in mode_codes) {
            var chmod_res: Int32 = chmod("", code)
            @Expect(chmod_res, Int32(-1))
        }
    }

    //path contains '\0'
    @TestCase
    func case4(): Unit {
        var paths = ["\0", "D:\\cangjie\\mycode\\\0", "D:\\cangjie\\myco\0de\\"]
        for (path in paths) {
            for (prefix in prefixs_01) {
                for (code in mode_codes) {
                    try {
                        var chmod_res: Int32 = chmod(prefix + path, code)
                        @Expect(1, 2)
                    } catch (e: IllegalArgumentException) {
                    }
                }
            }
        }
    }
}
