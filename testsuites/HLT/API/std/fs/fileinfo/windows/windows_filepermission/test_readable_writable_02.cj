/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (Windows and not OHOS)EXEC: mkdir specialfile321101a specialfile321101b 
// (Windows and not OHOS)EXEC: type nul>specialfile321101a/A
// (Windows and not OHOS)EXEC: type nul>specialfile321101a/A.sys
// (Windows and not OHOS)EXEC: type nul>specialfile321101b/RA
// (Windows and not OHOS)EXEC: type nul>specialfile321101b/RA.sys
// (Windows and not OHOS)EXEC: ATTRIB /d /s +r specialfile321101b/*
// (Windows and not OHOS)EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Windows and not OHOS)RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 
// (Windows and not OHOS)EXEC: rmdir /s/q specialfile321101a specialfile321101b

import std.fs.*
import std.io.*
import std.unittest.*
import std.unittest.testmacro.*

var rw_path = ".\\specialfile321101a\\A"
var r_path = ".\\specialfile321101b\\RA"
var suffixs = ["", ".sys"]

@Test
public class Test_Special_File {
    @TestCase
    func case1(): Unit {
        for (suffix in suffixs) {
            var s1 = rw_path + suffix
            var f1 = FileInfo(s1)
            @Expect(f1.isRegular(), true)
            @Expect(f1.isReadOnly(), false)
            @Expect(f1.canRead(), true)
            @Expect(f1.canWrite(), true)
            @Expect(f1.canExecute(), false)
        }
    }

    @TestCase
    func case2(): Unit {
        for (suffix in suffixs) {
            var s1 = rw_path + suffix
            var f1 = FileInfo(s1)
            var file = File(s1, ReadWrite)
            var arr1 = readToEnd(file)
            file.write(arr1)
            file.seek(SeekPosition.Begin(0))
            var arr2 = readToEnd(file)
            @Expect(2 * arr1.size, arr2.size)
            file.close()
        }
    }

    @TestCase
    func case3(): Unit {
        for (suffix in suffixs) {
            var s1 = r_path + suffix
            var f1 = FileInfo(s1)
            @Expect(f1.isRegular(), true)
            @Expect(f1.isReadOnly(), true)
            @Expect(f1.canRead(), true)
            @Expect(f1.canWrite(), false)
            @Expect(f1.canExecute(), false)

            var file1 = File(s1, Read)
            var arr1 = readToEnd(file1)
            var file2 = File(s1, Read)
            var arr2 = readToEnd(file2)
            @Expect(arr1, arr2)
            try {
                file1.write(Array<UInt8>())
                @Expect("", "1")
            } catch (e: FSException) {}
            file1.close()
            file2.close()
        }
    }
}
