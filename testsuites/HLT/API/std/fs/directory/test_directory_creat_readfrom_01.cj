/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.fs.*
import std.process.*

@Test
class Test_directory_creat_readfrom_01 {
    @TestCase
    func test_directory_creat_readfrom_01(): Unit {
        var illegal_path_string = ["", "\0", "/"]
        for (str in illegal_path_string) {
            let e = @AssertThrows[IllegalArgumentException](Directory.create(str, recursive: false))
            let e1 = @AssertThrows[IllegalArgumentException](Directory.create(str, recursive: true))
            @Expect(e.message.contains("Invalid path `${str}`, failed to create directory"))
            @Expect(e1.message.contains("Invalid path `${str}`, failed to create directory"))
        }
    }

    @TestCase
    func test_directory_creat_readfrom_02(): Unit {
        var illegal_path_string = ["", "\0", "/"]
        for (str in illegal_path_string) {
            let e = @AssertThrows[IllegalArgumentException](Directory.create(Path(str), recursive: false))
            let e1 = @AssertThrows[IllegalArgumentException](Directory.create(Path(str), recursive: true))
            @Expect(e.message.contains("Invalid path `${str}`, failed to create directory"))
            @Expect(e1.message.contains("Invalid path `${str}`, failed to create directory"))
        }
    }

    @TestCase
    func test_directory_creat_readfrom_03(): Unit {
        var illegal_path_string = ["zpstest", "zpstest.jpg", "$%^(^&)", "仓颉", "倉罷筆畢邊", "♫♬♪♩✲✳❃.cj", "01233"]
        for (str in illegal_path_string) {
            let e = @AssertThrows[FSException](Directory.readFrom(str))
            let e1 = @AssertThrows[FSException](Directory.readFrom(Path(str)))
            @Expect(e.message.contains("does not exist"))
            @Expect(e1.message.contains("does not exist"))
        }
    }

    @TestCase
    func test_directory_creat_readfrom_04(): Unit {
        var illegal_path_string = ["./home/root", "XXX/仓颉", "zps/zps/zps"]
        for (str in illegal_path_string) {
            let e = @AssertThrows[FSException](Directory.create(str, recursive: false))
            let e1 = @AssertThrows[FSException](Directory.create(Path(str), recursive: false))
            @Expect(e.message.contains("Failed to create directory"))
            @Expect(e1.message.contains("Failed to create directory"))
        }

        let e = @AssertThrows[IllegalArgumentException](Directory.create("zps/\0", recursive: false))
        let e1 = @AssertThrows[IllegalArgumentException](Directory.create(Path("zps/\0"), recursive: false))
        @Expect(e.message.contains("Invalid path"))
        @Expect(e1.message.contains("Invalid path"))
    }

    @TestCase
    func test_directory_creat_readfrom_05(): Unit {
        Directory.create("zpstest", recursive: false)
        let e = @AssertThrows[FSException](Directory.create("zpstest", recursive: false))
        let e1 = @AssertThrows[FSException](Directory.create(Path("zpstest"), recursive: false))
        @Expect(e.message.contains("is already exists"))
        @Expect(e1.message.contains("is already exists"))
    }

    @TestCase
    func test_directory_creat_readfrom_06(): Unit {
        Directory.create("zpstest1/zpstest1", recursive: true)
        let e = @AssertThrows[FSException](Directory.create("zpstest", recursive: true))
        let e1 = @AssertThrows[FSException](Directory.create(Path("zpstest"), recursive: true))
        @Expect(e.message.contains("is already exists"))
        @Expect(e1.message.contains("is already exists"))
        remove("zpstest", recursive: true)
        remove("zpstest1/zpstest1", recursive: true)
    }
}
