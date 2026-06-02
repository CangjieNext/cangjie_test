/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not Windows or OHOS)EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not Windows or OHOS)RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

/*
 * Test description: Test the Log read and write mode
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*
import std.io.*

@Test
class Test_Readmode {
    private var data = Array<Byte>(1000, repeat: 50)

    public override func beforeEach(): Unit {
        File.create("file.txt").close()
        @Assert(exists("file.txt"), true)
    }

    public override func afterEach(): Unit {
        remove("file.txt")
        @Assert(exists("file.txt"), false)
    }

    @TestCase
    func test_orederd(): Unit {
        for (i in 0..10) {
            File.appendTo("file.txt", data)
        }
        var arr = File.readFrom("file.txt")
        @Expect(arr.size, data.size * 10)
    }

    @TestCase
    func test_writeback(): Unit {
        var buf = Array<Byte>(10000, repeat: 0)
        for (i in 0..10) {
            var file = File("file.txt", ReadWrite)
            file.seek(Begin(0))
            file.write(data)
            file.close()
        }
        var file = File("file.txt", ReadWrite)
        file.read(buf)
        file.flush()
        file.close()
        @Expect(buf[999], UInt8(50))
        @Expect(buf[1000], UInt8(0))
    }
}
