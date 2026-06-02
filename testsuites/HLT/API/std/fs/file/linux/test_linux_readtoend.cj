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
 * Test description: Test the File.readToEnd()
 * Test API: public func readToEnd(): Array<Byte>
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*
import std.io.*
import std.regex.*

@Test
class Test_File_ReadToEnd {
    public override func afterEach(): Unit {
        if (exists("file_create.txt")) {
            remove("file_create.txt")
        }
        @Assert(exists("file_create.txt"), false)
    }

    @TestCase
    func test_readtoend(): Unit {
        var file = File("file_create.txt", ReadWrite)
        var data = Array<Byte>(10, repeat: 40)
        var emp = Array<Byte>()
        file.seek(SeekPosition.Begin(0))
        file.write(data)
        file.seek(SeekPosition.Begin(0))
        @Expect(readToEnd(file), data)
        @Expect(readToEnd(file), emp)
        file.seek(SeekPosition.Begin(100))
        @Expect(readToEnd(file), emp)
        file.close()
    }

    @TestCase
    func test_illegal(): Unit {
        var sum = 0
        var file = File("file_create.txt", ReadWrite)
        file.close()
        try {
            readToEnd(file)
        } catch (e: FSException) {
            @Assert(Regex("^The file `.+` not opened, can not to read.$").matches(e.message))
            sum += 1
        }
        @Expect(sum, 1)
    }
}
