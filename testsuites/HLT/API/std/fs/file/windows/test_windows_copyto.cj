/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (Windows and not OHOS)EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Windows and not OHOS)RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

/*
 * Test description: Test the copyTo()
 * Test API: public func copyTo(out: OutputStream): Unit
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*
import std.io.*

@Test
class Test_File_CopyTo {
    private var filepath = canonicalize(Path(".\\")).join("test_file.txt")
    private var filepath1 = "\\\\.\\" + filepath.toString()
    private var filepath2 = "\\\\?\\" + filepath.toString()

    public override func beforeAll(): Unit {
        if (!exists(filepath)) {
            File.create(filepath).close()
        }
        @Assert(exists(filepath), true)
    }

    public override func afterAll(): Unit {
        if (exists(filepath)) {
            remove(filepath)
        }
        @Assert(exists(filepath), false)
    }

    @TestCase
    func test_copyto(): Unit {
        var file = File(filepath1, ReadWrite)
        var outputstream = ByteBuffer()
        var data = Array<Byte>(10000, repeat: 50)
        file.write(data)
        file.write(data)
        file.seek(SeekPosition.Begin(10000))
        copy(file, to: outputstream)
        @Expect(readToEnd(outputstream), data)
        file.close()
        @Expect(File.readFrom(filepath), Array<Byte>(20000, repeat: 50))
    }

    @TestCase
    func test_illegal(): Unit {
        var sum = 0
        var file = File(filepath, Write)
        var outputstream = ByteBuffer()
        file.seek(SeekPosition.Begin(0))
        try {
            copy(file, to: outputstream)
        } catch (e: FSException) {
            @Expect(e.message.contains("does not have the read permission."))
            sum += 1
        }
        file.close()
        try {
            copy(file, to: outputstream)
        } catch (e: FSException) {
            @Expect(e.message.contains("not opened, can not to read."))
            sum += 1
        }
        @Expect(sum, 2)
    }
}
