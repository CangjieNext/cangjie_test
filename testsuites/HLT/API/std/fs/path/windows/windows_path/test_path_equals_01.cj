/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (Windows and not OHOS)EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Windows and not OHOS)EXEC: mkdir file321011a directory321011a
// (Windows and not OHOS)EXEC: type nul>file321011a/file321011a.txt
// (Windows and not OHOS)EXEC: type nul>file321011a/file321011a
// (Windows and not OHOS)EXEC: mkdir directory321011a/t
// (Windows and not OHOS)EXEC: mkdir directory321011a/仓颉cj
// (Windows and not OHOS)EXEC: mklink /d link_D_D_init directory321011a\t
// (Windows and not OHOS)EXEC: mklink /j link_J_D_init directory321011a\仓颉cj
// (Windows and not OHOS)EXEC: mklink link_N_F_init file321011a\file321011a.txt
// (Windows and not OHOS)EXEC: mklink /d link_D_L_JD link_J_D_init
// (Windows and not OHOS)EXEC: mklink /j link_J_L_JD link_J_D_init
// (Windows and not OHOS)RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 
// (Windows and not OHOS)EXEC: rmdir link_D_L_JD  link_J_L_JD link_D_D_init link_J_D_init 
// (Windows and not OHOS)EXEC: del link_N_F_init 
// (Windows and not OHOS)EXEC: rmdir /s/q file321011a
// (Windows and not OHOS)EXEC: rmdir /s/q directory321011a

import std.fs.*
import std.unittest.*
import std.unittest.testmacro.*

var prefixs_01 = ["\\", "\\\\?\\", "\\\\.\\"]
var prefixs_02 = ["\\\\", "\\\\?\\UNC\\", "\\\\.\\UNC\\"]

@Test
public class Test_Path_Equals_01 {
    //file Path
    @TestCase
    func case1(): Unit {
        var rel_path1 = ".\\file321011a\\file321011a.txt"
        var rel_path2 = ".\\file321011a\\file321011a"
        var can_path1 = canonicalize(Path(rel_path1))
        var can_path2 = canonicalize(Path(rel_path2))
        for (prefix in prefixs_01) {
            var path1 = Path(prefix + can_path1.toString())
            var boolean1 = (path1 == can_path1)
            var boolean2 = (path1 == can_path2)
            @Expect(boolean1, false)
            @Expect(boolean2, false)
        }
    }

    //directory Path
    @TestCase
    func case2(): Unit {
        var rel_path1 = ".\\directory321011a\\T"
        var rel_path2 = ".\\directory321011a\\仓颉cj"
        var can_path1 = canonicalize(Path(rel_path1))
        var can_path2 = canonicalize(Path(rel_path2))
        for (prefix in prefixs_01) {
            var path1 = Path(prefix + can_path1.toString())
            var boolean1 = (path1 == can_path1)
            var boolean2 = (path1 == can_path2)
            @Expect(boolean1, false)
            @Expect(boolean2, false)
        }
    }

    //SymbolicLink Path -linked to same directory321011a
    @TestCase
    func case3(): Unit {
        var rel_path1 = ".\\link_J_D_init"
        var rel_path2 = ".\\link_D_L_JD"
        var rel_path3 = ".\\link_J_L_JD"
        var can_path1 = canonicalize(Path(rel_path1))
        var can_path2 = canonicalize(Path(rel_path2))
        var can_path3 = canonicalize(Path(rel_path3))
        for (prefix in prefixs_01) {
            var path1 = Path(prefix + can_path1.toString())
            var boolean1 = (path1 == can_path1)
            var boolean2 = (path1 == can_path2)
            var boolean3 = (path1 == can_path3)
            var boolean4 = (path1 == Path(rel_path1))
            @Expect(boolean1, false)
            @Expect(boolean2, false)
            @Expect(boolean3, false)
            @Expect(boolean4, false)
        }
    }

    //SymbolicLink Path -linked to different directory321011a
    @TestCase
    func case4(): Unit {
        var rel_path1 = ".\\link_D_D_init"
        var rel_path2 = ".\\link_D_L_JD"
        var rel_path3 = ".\\link_J_L_JD"
        var can_path1 = canonicalize(Path(rel_path1))
        var can_path2 = canonicalize(Path(rel_path2))
        var can_path3 = canonicalize(Path(rel_path3))
        for (prefix in prefixs_01) {
            var path1 = Path(prefix + can_path1.toString())
            var boolean1 = (path1 == can_path1)
            var boolean2 = (path1 == can_path2)
            var boolean3 = (path1 == can_path3)
            @Expect(boolean1, false)
            @Expect(boolean2, false)
            @Expect(boolean3, false)
        }
    }

    //both paths do not exist
    @TestCase
    func case5(): Unit {
        var rel_path = ".\\directory321011a"
        var can_path1 = canonicalize(Path(rel_path))
        var file321011as = ["\\none", "\\nONe", "\\仓颉.Cj"]

        for (file321011a in file321011as) {
            for (prefix in prefixs_01) {
                var path1 = Path(prefix + can_path1.toString() + file321011a)
                @Expect(path1 == path1, true)
            }
        }
        var p1 = Path(prefixs_01[0] + can_path1.toString() + file321011as[0])
        var p2 = Path(prefixs_01[1] + can_path1.toString() + file321011as[1])
        var p3 = Path(prefixs_01[2] + can_path1.toString() + file321011as[2])
        @Expect(p1 == p2, false)
        @Expect(p1 == p3, false)
    }

    //one path exists, another does not exist
    @TestCase
    func case6(): Unit {
        var rel_path = ".\\directory321011a"
        var can_path1 = canonicalize(Path(rel_path))
        var path1 = Path(rel_path + can_path1.toString() + "\\None")
        var path2 = Path(rel_path + can_path1.toString() + "\\仓颉Cj")
        @Expect(path1 == path2, false)
    }
}
