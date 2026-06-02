/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.fs.*
import std.process.*

var sum = 0

@Test
class Test_directory_creat_walk_05 {
    var path_string = ["zpstest1", "仓颉鸿蒙", "仓颉鸿蒙1"]

    public override func beforeEach(): Unit {
        sum = 0
        for (str in path_string) {
            removeIfExists(str, recursive: true)
        }
    }

    public override func afterEach(): Unit {
        for (str1 in path_string) {
            removeIfExists(str1, recursive: true)
        }
    }

    @TestCase
    func test_directory_creat_walk_01(): Unit {
        Directory.create(Path("zpstest1"), recursive: false)
        @Expect(exists("zpstest1"), true)
        File.create("./zpstest1/zpstest2").close()
        @Expect(exists("./zpstest1/zpstest2"), true)
        Directory.walk("./zpstest1") {
            info =>
            if (info.isRegular()) {
                sum += 1
            }
            if (info.isDirectory()) {
                sum += 1
            }
            false
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_directory_creat_walk_02(): Unit {
        Directory.create(Path("zpstest1"), recursive: false)
        @Expect(exists("zpstest1"), true)
        File.create("./zpstest1/zpstest2").close()
        @Expect(exists("./zpstest1/zpstest2"), true)
        Directory.walk("./zpstest1") {
            info =>
            if (info.isRegular()) {
                sum += 1
            }
            if (info.isDirectory()) {
                sum += 1
            }
            true
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_directory_creat_walk_03(): Unit {
        Directory.create(Path("仓颉鸿蒙"), recursive: false)
        @Expect(exists("仓颉鸿蒙"), true)
        Directory.walk("./仓颉鸿蒙/") {
            info =>
            if (info.isRegular()) {
                sum += 1
            }
            if (info.isDirectory()) {
                sum += 1
            }
            true
        }
        @Expect(sum, 0)
    }

    @TestCase
    func test_directory_creat_walk_04(): Unit {
        Directory.create(Path("仓颉鸿蒙"), recursive: false)
        @Expect(exists("仓颉鸿蒙"), true)
        Directory.walk("./仓颉鸿蒙/") {
            info =>
            if (info.isRegular()) {
                sum += 1
            }
            if (info.isDirectory()) {
                sum += 1
            }
            false
        }
        @Expect(sum, 0)
    }

    @TestCase
    func test_directory_creat_walk_05(): Unit {
        Directory.create(Path("仓颉鸿蒙1/&^&/012345"), recursive: true)
        @Expect(exists("仓颉鸿蒙1/&^&/012345"), true)
        File.create("./仓颉鸿蒙1/&^&/012345/AAAAA").close()
        File.create("./仓颉鸿蒙1/&^&/012345/1234").close()
        File.create("./仓颉鸿蒙1/&^&/012345/$%^").close()
        File.create("./仓颉鸿蒙1/&^&/012345/12345678901").close()
        File.create("./仓颉鸿蒙1/&^&/012345/仓颉鸿蒙仓颉鸿蒙仓颉鸿蒙").close()
        @Expect(exists("仓颉鸿蒙1/&^&/012345/AAAAA"), true)
        Directory.walk("./仓颉鸿蒙1/") {
            info =>
            if (info.size < 5) {
                sum += 1
            }
            if (info.size > 5) {
                sum += 1
            }
            false
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_directory_creat_walk_06(): Unit {
        Directory.create(Path("仓颉鸿蒙1/&^&/012345"), recursive: true)
        @Expect(exists("仓颉鸿蒙1/&^&/012345"), true)
        File.create("./仓颉鸿蒙1/&^&/012345/AAAAA").close()
        File.create("./仓颉鸿蒙1/&^&/012345/1234").close()
        File.create("./仓颉鸿蒙1/&^&/012345/$%^").close()
        File.create("./仓颉鸿蒙1/&^&/012345/12345678901").close()
        File.create("./仓颉鸿蒙1/&^&/012345/仓颉鸿蒙仓颉鸿蒙仓颉鸿蒙").close()
        @Expect(exists("仓颉鸿蒙1/&^&/012345/AAAAA"), true)
        Directory.walk("./仓颉鸿蒙1/") {
            info =>
            if (info.size < 5) {
                sum += 1
            }
            if (info.size > 5) {
                sum += 1
            }
            true
        }
        @Expect(sum, 1)
    }
}
