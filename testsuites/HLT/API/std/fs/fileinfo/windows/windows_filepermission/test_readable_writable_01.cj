/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (Windows and not OHOS)EXEC: mkdir specialfile321102a
// (Windows and not OHOS)EXEC: type nul>specialfile321102a/A.txt
// (Windows and not OHOS)EXEC: type nul>specialfile321102a/RA.txt
// (Windows and not OHOS)EXEC: type nul>specialfile321102a/RAS.txt
// (Windows and not OHOS)EXEC: type nul>specialfile321102a/RASH.txt
// (Windows and not OHOS)EXEC: echo bbbbb>specialfile321102a/A.txt
// (Windows and not OHOS)EXEC: echo aaaaa>specialfile321102a/RA.txt
// (Windows and not OHOS)EXEC: echo aaaaa>specialfile321102a/RAS.txt
// (Windows and not OHOS)EXEC: echo aaaaa>specialfile321102a/RASH.txt
// (Windows and not OHOS)EXEC: ATTRIB -r +a -s -h specialfile321102a/A.txt
// (Windows and not OHOS)EXEC: ATTRIB +r +a -s -h specialfile321102a/RA.txt
// (Windows and not OHOS)EXEC: ATTRIB +r +a +s -h specialfile321102a/RAS.txt
// (Windows and not OHOS)EXEC: ATTRIB +r +a +s +h specialfile321102a/RASH.txt
// (Windows and not OHOS)EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Windows and not OHOS)RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 
// (Windows and not OHOS)EXEC: rmdir /s/q specialfile321102a

import std.fs.*
import std.io.*
import std.unittest.*
import std.unittest.testmacro.*

var rel_path = ".\\specialfile321102a\\"
var filenames = ["RA.txt", "RAS.txt", "RASH.txt"]
var prefixs_01 = ["", "\\\\?\\", "\\\\.\\"]
var prefixs_02 = ["\\\\", "\\\\?\\UNC\\", "\\\\.\\UNC\\"]

@Test
public class Test_IsReadOnly {
    //Directory Path
    @TestCase
    func case1(): Unit {
        var f1 = FileInfo(".\\specialfile321102a")
        @Expect(f1.isDirectory(), true)
        @Expect(f1.isReadOnly(), false)
    }

    //Read-Only File
    @TestCase
    func case2(): Unit {
        for (filename in filenames) {
            var s1 = rel_path + filename
            var f1 = FileInfo(s1)
            @Expect(f1.isRegular(), true)
            @Expect(f1.isReadOnly(), true)
            var file = File(s1, Read)
            var arr2 = [97u8, 97u8, 97u8, 97u8, 97u8]
            try {
                file.write(arr2)
                @Expect("0","1")
            } catch (e: FSException) {}
            file.close()
        }
    }

    //Readable and Writable File
    @TestCase
    func case3(): Unit {
        var f1 = FileInfo(".\\specialfile321102a\\A.txt")
        @Expect(f1.isRegular(), true)
        @Expect(f1.isReadOnly(), false)
    }
}

@Test
public class Test_CanRead {
    //Directory Path
    @TestCase
    func case1(): Unit {
        var f1 = FileInfo(".\\specialfile321102a")
        @Expect(f1.canRead(), true)
    }

    //Read-Only File
    @TestCase
    func case2(): Unit {
        for (filename in filenames) {
            var s1 = rel_path + filename
            var f1 = FileInfo(s1)
            @Expect(f1.canRead(), true)
            var file = File(s1, Read)
            file.seek(SeekPosition.Begin(0))
            var arr1 = readToEnd(file)
            var arr2 = [97u8, 97u8, 97u8, 97u8, 97u8, 13u8, 10u8]
            @Expect(arr1, arr2)
            file.close()
        }
    }

    //Readable and Writable File
    @TestCase
    func case3(): Unit {
        var f1 = FileInfo(".\\specialfile321102a\\A.txt")
        @Expect(f1.canRead(), true)
        var file = File(".\\specialfile321102a\\A.txt", ReadWrite)
        file.seek(SeekPosition.Begin(0))
        var arr1 = readToEnd(file)
        @Expect(arr1, [98u8, 98u8, 98u8, 98u8, 98u8, 13u8, 10u8])
        file.close()
    }
}

@Test
public class Test_CanWrite {
    //Directory Path
    @TestCase
    func case1(): Unit {
        var f1 = FileInfo(".\\specialfile321102a")
        @Expect(f1.canWrite(), true)
    }

    //Read-Only File
    @TestCase
    func case2(): Unit {
        for (filename in filenames) {
            var s1 = rel_path + filename
            var f1 = FileInfo(s1)
            @Expect(f1.canWrite(), false)
        }
    }

    //Readable and Writable File
    @TestCase
    func case3(): Unit {
        var f1 = FileInfo(".\\specialfile321102a\\A.txt")
        @Expect(f1.canWrite(), true)
        var file = File(".\\specialfile321102a\\A.txt", ReadWrite)
        var arr1 = [97u8, 97u8, 97u8, 97u8, 97u8]
        var arr2 = [98u8, 98u8, 98u8, 98u8, 98u8]
        file.write(arr1)
        file.seek(SeekPosition.Begin(0))
        var arr3 = readToEnd(file)
        @Expect(arr3, [97u8, 97u8, 97u8, 97u8, 97u8, 13u8, 10u8])
        file.close()
    }
}

@Test
public class Test_canExecute {
    //Directory Path
    @TestCase
    func case1(): Unit {
        var f1 = FileInfo(".\\specialfile321102a")
        @Expect(f1.canExecute(), true)
    }

    //Read-Only File
    @TestCase
    func case2(): Unit {
        for (filename in filenames) {
            var s1 = rel_path + filename
            var f1 = FileInfo(s1)
            @Expect(f1.canExecute(), false)
        }
    }

    //Readable and Writable File
    @TestCase
    func case3(): Unit {
        var f1 = FileInfo(".\\specialfile321102a\\A.txt")
        @Expect(f1.canExecute(), false)
    }
}
