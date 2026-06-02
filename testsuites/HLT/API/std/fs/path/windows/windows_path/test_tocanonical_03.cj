/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (Windows and not OHOS)EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Windows and not OHOS)EXEC: mkdir specialfile0001
// (Windows and not OHOS)EXEC: type nul>specialfile0001/A.txt
// (Windows and not OHOS)EXEC: type nul>specialfile0001/RA.txt
// (Windows and not OHOS)EXEC: type nul>specialfile0001/RAS.txt
// (Windows and not OHOS)EXEC: type nul>specialfile0001/RASH.txt
// (Windows and not OHOS)EXEC: ATTRIB -r +a -s -h specialfile0001/A.txt
// (Windows and not OHOS)EXEC: ATTRIB +r +a -s -h specialfile0001/RA.txt
// (Windows and not OHOS)EXEC: ATTRIB +r +a +s -h specialfile0001/RAS.txt
// (Windows and not OHOS)EXEC: ATTRIB +r +a +s +h specialfile0001/RASH.txt
// (Windows and not OHOS)EXEC: mklink /h hardlink1 specialfile0001/A.txt
// (Windows and not OHOS)EXEC: mklink /h hardlink2 specialfile0001/RASH.txt
// (Windows and not OHOS)EXEC: mkdir dir\directory0001
// (Windows and not OHOS)RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 
// (Windows and not OHOS)EXEC: rmdir /s/q specialfile0001
// (Windows and not OHOS)EXEC: rmdir /s/q dir
// (Windows and not OHOS)EXEC: del hardlink1 hardlink2

import std.fs.*
import std.unittest.*
import std.unittest.testmacro.*

var prefixs_01 = ["", "\\\\?\\", "\\\\.\\"]

@Test
public class Test_ToCanonical_03 {
    //hardlink
    @TestCase
    func case1(): Unit {
        var pathbody_01 = ".\\"
        var filenames = ["hardlink1", "hardlink2"]
        for (filename in filenames) {
            var path_c = canonicalize(Path(pathbody_01 + filename))
            @Expect(path_c, canonicalize(path_c))
            @Expect(path_c.hashCode(), canonicalize(path_c).hashCode())
        }
    }

    //Chmod File Path
    @TestCase
    func case2(): Unit {
        var pathbody_01 = ".\\specialfile0001\\"
        var filenames = ["A.txt", "RA.txt", "RAS.txt", "RASH.txt"]
        for (filename in filenames) {
            var path_c = canonicalize(Path(pathbody_01 + filename))
            @Expect(path_c, canonicalize(path_c))
            @Expect(path_c.hashCode(), canonicalize(path_c).hashCode())
        }
    }
}
