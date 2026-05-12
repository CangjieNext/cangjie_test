/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC:%run %run_opt %output %run_utest_opt %run_args

import std.fs.*
import std.process.*

@Test
class Test_directory_creat_readfrom_02 {
    var legal_path_string1 = ["zpstest", "仓颉", "123456", "倉罷筆畢邊", "♫♬♪♩✲✳❃", "test.cj", "%$$"]
    var legal_path_string2 = ["zpstest/zpstest", "zpstest/仓颉", "zpstest/12345", "zpstest/倉罷筆畢邊",
        "zpstest/♫♬♪♩✲✳❃", "zpstest/test.cj", "zpstest/%$$"]
    var legal_path_string3 = ["zpstest1", "仓颉1", "1234561", "倉罷筆畢邊1", "♫♬♪♩✲✳❃1", "test.cj1", "%$$1"]

    public override func beforeEach(): Unit {
        for (str1 in legal_path_string1) {
            removeIfExists(str1, recursive: true)
        }

        for (str2 in legal_path_string2) {
            removeIfExists(str2, recursive: true)
        }

        for (str3 in legal_path_string3) {
            removeIfExists(str3, recursive: true)
        }
    }

    public override func afterEach(): Unit {
        for (str1 in legal_path_string1) {
            removeIfExists(str1, recursive: true)
        }

        for (str2 in legal_path_string2) {
            removeIfExists(str2, recursive: true)
        }

        for (str3 in legal_path_string3) {
            removeIfExists(str3, recursive: true)
        }
    }

    @TestCase
    func test_directory_creat_readfrom_01(): Unit {
        var illegal_path_string = ["", "\0"]
        for (str in illegal_path_string) {
            let e = @AssertThrows[IllegalArgumentException](Directory.createTemp(str))
            println(e.message.toString())
            @Expect(e.message.contains("The input path is empty.") || e.message.contains("The input path value [0] contains null character."))
        }
    }

    @TestCase
    func test_directory_creat_readfrom_02(): Unit {
        var illegal_path_string = ["", "\0"]
        for (str in illegal_path_string) {
            let e = @AssertThrows[IllegalArgumentException](Directory.createTemp(Path(str)))
            @Expect(e.message.contains("The input path is empty.") || e.message.contains("The input path value [0] contains null character."))
        }
    }

    @TestCase
    func test_directory_creat_readfrom_03(): Unit {
        for (str in legal_path_string1) {
            Directory.create(str, recursive: false)
            @Expect(exists(str), true)
            var fileinfo = Directory.readFrom(str)
            let e = @AssertThrows[IndexOutOfBoundsException](fileinfo[0].name)
        }
    }

    @TestCase
    func test_directory_creat_readfrom_04(): Unit {
        for (str in legal_path_string2) {
            Directory.create(str, recursive: true)
            @Expect(exists(str), true)
            var fileinfo = Directory.readFrom(str)
            let e = @AssertThrows[IndexOutOfBoundsException](fileinfo[0].name)
        }
    }

    @TestCase
    func test_directory_creat_readfrom_05(): Unit {
        for (str in legal_path_string3) {
            Directory.create(Path(str), recursive: false)
            @Expect(exists(str), true)
            var fileinfo = Directory.readFrom(str)
            let e = @AssertThrows[IndexOutOfBoundsException](fileinfo[0].name)
        }
    }

    @TestCase
    func test_directory_creat_readfrom_06(): Unit {
        for (str in legal_path_string2) {
            Directory.create(Path(str), recursive: true)
            @Expect(exists(str), true)
            var fileinfo = Directory.readFrom(str)
            let e = @AssertThrows[IndexOutOfBoundsException](fileinfo[0].name)
        }
    }
}
