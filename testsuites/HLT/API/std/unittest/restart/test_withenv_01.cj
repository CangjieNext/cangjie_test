/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

/*
 * Test description:
 *      test @Timeout for env set-up and clean-up
 * Test API:
 *      @Timeout
 */

import std.process.*
import std.time.*
import std.fs.*

@Test
@Timeout[2 * Duration.second]
class Test_Env_01 {
    var data = Array<Byte>(100, repeat: 50)
    public override func beforeEach(): Unit {
        File.create("./file_temp").close()
    }

    public override func afterEach(): Unit {
        if (exists("./file_temp")) {
            remove("./file_temp")
        }
    }

    @TestCase
    func case01(): Unit {
        File.appendTo("./file_temp", data)
        @Expect(File.readFrom(Path("./file_temp")), data)
    }

    @TestCase
    func case02(): Unit {
        File.appendTo("./file_temp", data)
        @Expect(File.readFrom(Path("./file_temp")), data)
    }

    @TestCase
    @Timeout[Duration.second]
    func case03(): Unit {
        File.appendTo("./file_temp", data)
        @Expect(File.readFrom(Path("./file_temp")), data)
    }
}

@Test
@Timeout[2 * Duration.second]
class Test_Env_02 {
    var data = Array<Byte>(100, repeat: 50)
    public override func beforeEach(): Unit {
        File.create("./file_temp").close()
    }

    public override func afterEach(): Unit {
        if (exists("./file_temp")) {
            remove("./file_temp")
        }
    }

    @TestCase
    func case01(): Unit {
        File.appendTo("./file_temp", data)
        @Expect(File.readFrom(Path("./file_temp")), data)
    }

    @TestCase
    func case02(): Unit {
        File.appendTo("./file_temp", data)
        @Expect(File.readFrom(Path("./file_temp")), data)
    }

    @TestCase
    @Timeout[Duration.second]
    func case03(): Unit {
        File.appendTo("./file_temp", data)
        @Expect(File.readFrom(Path("./file_temp")), data)
    }
}

@Test
class Test_Env_03 {
    var data = Array<Byte>(100, repeat: 50)
    public override func beforeEach(): Unit {
        File.create("./file_temp").close()
    }

    public override func afterEach(): Unit {
        if (exists("./file_temp")) {
            remove("./file_temp")
        }
    }

    @TestCase
    func case01(): Unit {
        File.appendTo("./file_temp", data)
        @Expect(File.readFrom(Path("./file_temp")), data)
    }

    @TestCase
    func case02(): Unit {
        File.appendTo("./file_temp", data)
        @Expect(File.readFrom(Path("./file_temp")), data)
    }
}
