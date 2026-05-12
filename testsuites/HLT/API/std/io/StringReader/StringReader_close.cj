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
import std.unittest.*
import std.unittest.testmacro.*
import std.io.*
import std.fs.*
import std.regex.*

var file = File("./test.txt", ReadWrite)
var sr = StringReader(file)

@Test
class Test_StringReader_close {
    public override func beforeEach(): Unit {
        file = File("./test.txt", ReadWrite)
        sr = StringReader(file)
    }

    public override func afterEach(): Unit {
        remove("./test.txt")
    }

    @TestCase
    func test_stream_close(): Unit {
        var cnt = 0
        // check status before close
        sr.readToEnd()
        readToEnd(file)
        @Expect(sr.isClosed(), false)
        @Expect(file.isClosed(), false)

        sr.close()

        // check status after close
        try {
            readToEnd(file)
        } catch (e: FSException) {
            cnt++
            @Assert(Regex("^The file `.+` not opened, can not to read.$").matches(e.message))
        }
        @Expect(cnt, 1)

        @Expect(sr.isClosed(), true)
        @Expect(file.isClosed(), true)

        // multi close
        sr.close()
        file.close()
        @Expect(sr.isClosed(), true)
        @Expect(file.isClosed(), true)
    }

    @TestCase
    func test_file_close(): Unit {
        var cnt = 0
        // check status before close
        sr.readToEnd()
        readToEnd(file)
        @Expect(sr.isClosed(), false)
        @Expect(file.isClosed(), false)

        file.close()

        // check status after close
        try {
            readToEnd(file)
        } catch (e: FSException) {
            cnt++
            @Assert(Regex("^The file `.+` not opened, can not to read.$").matches(e.message))
        }
        @Expect(cnt, 1)

        @Expect(sr.isClosed(), true)
        @Expect(file.isClosed(), true)

        // multi close
        sr.close()
        file.close()
        @Expect(sr.isClosed(), true)
        @Expect(file.isClosed(), true)
    }
}
