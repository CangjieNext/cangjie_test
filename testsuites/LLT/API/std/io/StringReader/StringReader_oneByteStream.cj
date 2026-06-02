/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: input.txt
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// EXEC: %run %run_opt %n.%suffix %run_args | compare %f
// (Unix)ASSERT: scan content length: 4097
// (Unix)ASSERT: scan content length: 4097
// (Windows)ASSERT: scan content length: 4098
// (Windows)ASSERT: scan content length: 4098

/*
 * Test descirption: Test the source stream of StringReader produces one byte at a time
 */

internal import std.fs.*
internal import std.io.*

class MockStream<T> <: InputStream where T <: InputStream {
    var inputStream: T

    public init(input: T) {
        inputStream = input
    }

    public func read(buffer: Array<Byte>): Int64 {
        var tmpBuf = Array<Byte>(1, repeat: 0)
        var len = inputStream.read(tmpBuf)
        if (len == 0) {
            return 0
        }
        buffer[0] = tmpBuf[0]
        return 1
    }
}

func test(out_name: String, in_stream: InputStream): Unit {
    var reader = StringReader(in_stream)
    var writer = StringWriter(File(out_name, Write))
    var count = 0
    while (true) {
        match (reader.read()) {
            case None => break
            case Some(c) =>
                writer.write(c)
                count++
        }
    }
    writer.close()
    println("content length: ${count}")
}

main() {
    let name = "input.txt"
    test("out1", File(name, Read))
    test("out2", MockStream(File(name, Read)))
}
