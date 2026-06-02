/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (Windows and not OHOS)EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Windows and not OHOS)EXEC: mkdir file321008a directory321008a
// (Windows and not OHOS)EXEC: type nul>file321008a/file321008a.txt
// (Windows and not OHOS)EXEC: type nul>file321008a/file321008a
// (Windows and not OHOS)EXEC: mkdir directory321008a/t
// (Windows and not OHOS)EXEC: mkdir directory321008a/仓颉cj
// (Windows and not OHOS)EXEC: mklink /d link_D_D_init directory321008a\t
// (Windows and not OHOS)EXEC: mklink /j link_J_D_init directory321008a\仓颉cj
// (Windows and not OHOS)EXEC: mklink link_N_F_init file321008a\file321008a.txt
// (Windows and not OHOS)EXEC: mklink /d link_D_L_JD link_J_D_init
// (Windows and not OHOS)EXEC: mklink /j link_J_L_JD link_J_D_init
// (Windows and not OHOS)RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 
// (Windows and not OHOS)EXEC: rmdir link_D_L_JD  link_J_L_JD link_D_D_init link_J_D_init 
// (Windows and not OHOS)EXEC: del link_N_F_init 
// (Windows and not OHOS)EXEC: rmdir /s/q file321008a
// (Windows and not OHOS)EXEC: rmdir /s/q directory321008a

import std.fs.*
import std.unittest.*
import std.unittest.testmacro.*

var prefixs_01 = ["\\", "\\\\?\\", "\\\\.\\"]
var prefixs_02 = ["\\\\", "\\\\?\\UNC\\", "\\\\.\\UNC\\"]

@Test
public class Test_Path_Unequal_01 {
    //File Path
    @TestCase
    func case1(): Unit {
        var rel_path1 = ".\\file321008a\\file321008a.txt"
        var rel_path2 = ".\\file321008a\\file321008a"
        var can_path1 = canonicalize(Path(rel_path1))
        var can_path2 = canonicalize(Path(rel_path2))
        for (prefix in prefixs_01) {
            var path1 = Path(prefix + can_path1.toString())
            var boolean1 = (path1 != can_path1)
            var boolean2 = (path1 != can_path2)
            @Expect(boolean1, true)
            @Expect(boolean2, true)
        }
    }

    //Directory Path
    @TestCase
    func case2(): Unit {
        var rel_path1 = ".\\directory321008a\\T"
        var rel_path2 = ".\\directory321008a\\仓颉cj"
        var can_path1 = canonicalize(Path(rel_path1))
        var can_path2 = canonicalize(Path(rel_path2))
        for (prefix in prefixs_01) {
            var path1 = Path(prefix + can_path1.toString())
            var boolean1 = (path1 != can_path1)
            var boolean2 = (path1 != can_path2)
            @Expect(boolean1, true)
            @Expect(boolean2, true)
        }
    }

    //SymbolicLink Path -linked to same directory
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
            var boolean1 = (path1 != can_path1)
            var boolean2 = (path1 != can_path2)
            var boolean3 = (path1 != can_path3)
            var boolean4 = (path1 != Path(rel_path1))
            @Expect(boolean1, true)
            @Expect(boolean2, true)
            @Expect(boolean3, true)
            @Expect(boolean4, true)
        }
    }

    //SymbolicLink Path -linked to different directory
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
            var boolean1 = (path1 != can_path1)
            var boolean2 = (path1 != can_path2)
            var boolean3 = (path1 != can_path3)
            @Expect(boolean1, true)
            @Expect(boolean2, true)
            @Expect(boolean3, true)
        }
    }

    //both paths do not exist
    @TestCase
    func case5(): Unit {
        var rel_path = ".\\directory321008a"
        var can_path1 = canonicalize(Path(rel_path))
        var files = ["\\none", "\\nONe", "\\仓颉.Cj"]

        for (file in files) {
            for (prefix in prefixs_01) {
                var path1 = Path(prefix + can_path1.toString() + file)
                @Expect(path1 != path1, false)
            }
        }
        var p1 = Path(prefixs_01[0] + can_path1.toString() + files[0])
        var p2 = Path(prefixs_01[1] + can_path1.toString() + files[1])
        var p3 = Path(prefixs_01[2] + can_path1.toString() + files[2])
        @Expect(p1 != p2, true)
        @Expect(p1 != p3, true)
    }

    //one path exists, another does not exist
    @TestCase
    func case6(): Unit {
        var rel_path = ".\\directory321008a"
        var can_path1 = canonicalize(Path(rel_path))
        var path1 = Path(rel_path + can_path1.toString() + "\\None")
        var path2 = Path(rel_path + can_path1.toString() + "\\仓颉Cj")
        @Expect(path1 != path2, true)
    }
}
