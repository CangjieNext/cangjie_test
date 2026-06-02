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
class Test_directory_creat_readfrom_04 {
    var path_string = ["zpstest1", "0123354943754", "仓颉鸿蒙$", "♫♬♪♩✲✳❃$", "0123", "仓颉"]

    public override func beforeEach(): Unit {
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
    func test_directory_creat_readfrom_01(): Unit {
        Directory.create(Path("zpstest1"), recursive: false)
        @Expect(exists("zpstest1"), true)
        File.create("./zpstest1/zpstest2").close()
        @Expect(exists("./zpstest1/zpstest2"), true)
        var fileinfo = Directory.readFrom("zpstest1")
        @Expect(fileinfo[0].name, "zpstest2")
    }

    @TestCase
    func test_directory_creat_readfrom_02(): Unit {
        Directory.create(Path("0123354943754"), recursive: false)
        @Expect(exists("0123354943754"), true)
        File.create("./0123354943754/仓颉.cj").close()
        @Expect(exists("./0123354943754/仓颉.cj"), true)
        var fileinfo = Directory.readFrom(Path("0123354943754"))
        @Expect(fileinfo[0].name, "仓颉.cj")
    }

    @TestCase
    func test_directory_creat_readfrom_03(): Unit {
        Directory.create(Path("仓颉鸿蒙$"), recursive: false)
        @Expect(exists("仓颉鸿蒙$"), true)
        File.create("./仓颉鸿蒙$/$%^.cj").close()
        @Expect(exists("./仓颉鸿蒙$/$%^.cj"), true)
        var fileinfo = Directory.readFrom(Path("仓颉鸿蒙$"))
        @Expect(fileinfo[0].name, "$%^.cj")
    }

    @TestCase
    func test_directory_creat_readfrom_04(): Unit {
        Directory.create(Path("♫♬♪♩✲✳❃$"), recursive: false)
        @Expect(exists("♫♬♪♩✲✳❃$"), true)
        File.create("./♫♬♪♩✲✳❃$/012345").close()
        @Expect(exists("./♫♬♪♩✲✳❃$/012345"), true)
        var fileinfo = Directory.readFrom("♫♬♪♩✲✳❃$")
        @Expect(fileinfo[0].name, "012345")
    }

    @TestCase
    func test_directory_creat_readfrom_05(): Unit {
        Directory.create(Path("0123/01234"), recursive: true)
        @Expect(exists("0123/01234"), true)
        File.create("./0123/01234/012345").close()
        @Expect(exists("./0123/01234/012345"), true)
        var fileinfo = Directory.readFrom(Path("./0123/01234/"))
        @Expect(fileinfo[0].name, "012345")
        var fileinfo1 = Directory.readFrom("0123")
        @Expect(fileinfo1[0].name, "01234")
    }

    @TestCase
    func test_directory_creat_readfrom_06(): Unit {
        Directory.create(Path("仓颉/zps123435/♫♬♪♩✲"), recursive: true)
        @Expect(exists("仓颉/zps123435/♫♬♪♩✲"), true)
        File.create("./仓颉/zps123435/♫♬♪♩✲/$%").close()
        File.create("./仓颉/zps123435/♫♬♪♩✲/000000").close()
        File.create("./仓颉/zps123435/♫♬♪♩✲/&&&&&").close()
        @Expect(exists("./仓颉/zps123435/♫♬♪♩✲/$%"), true)
        @Expect(exists("./仓颉/zps123435/♫♬♪♩✲/000000"), true)
        var fileinfo = Directory.readFrom(Path("./仓颉"))
        @Expect(fileinfo[0].name, "zps123435")
        var fileinfo1 = Directory.readFrom(Path("./仓颉/zps123435/♫♬♪♩✲"))
        @Expect(fileinfo1.size, 3)
    }
}
