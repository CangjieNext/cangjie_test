/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (Windows and not OHOS)DEPENDENCE: ./extensions.txt
// (Windows and not OHOS)EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Windows and not OHOS)RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

import std.fs.*
import std.io.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class Test_Stat_01 {
    @TestCase
    func case1(): Unit {
        var path0 = canonicalize(Path("./"))
        var exe_files = ["file.exe", "file.bat", "file.com", "file.cmd"]
        for (file in exe_files) {
            var filePath = path0.join(file)
            var f1 = File.create(filePath)
            @Assert(exists(filePath), true)
            var fileInfo = FileInfo(filePath)
            @Expect(fileInfo.canExecute(), true)
            f1.close()
            remove(filePath)
        }
    }

    @TestCase
    func case2(): Unit {
        var filename = "extensions.txt"
        var arr_UInt8_raw = File.readFrom(filename)
        var arr_UInt8_new = ArrayList<UInt8>()
        for (i in arr_UInt8_raw) {
            if (i != UInt8(13)) {
                arr_UInt8_new.add(i)
            }
        }
        var arr = arr_UInt8_new.toArray()
        var str1 = String.fromUtf8(arr)
        var extensions = str1.split("\n", -1, removeEmpty: false)

        var path0 = canonicalize(Path("./"))
        var sum = 0
        for (file in extensions) {
            var filePath = path0.join("file." + file)
            var f1 = File.create(filePath)
            @Assert(exists(filePath), true)
            var fileInfo = FileInfo(filePath)
            f1.close()
            if (fileInfo.canExecute() == true) {
                sum += 1
            }
            remove(filePath)
        }
        @Expect(sum, 4)
    }
}
