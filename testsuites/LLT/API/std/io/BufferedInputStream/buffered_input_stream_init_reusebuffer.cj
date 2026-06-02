/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// EXEC: %run %run_opt %n.%suffix %run_args
/*
 * Test description: Test that the following funcs do not read data from InputStream.
 * Test API: public class BufferedInputStream <: InputStream {
 *             public init(input: InputStream)
 *             public init(input: InputStream, capacity: Int64)
 *           }
 */
import std.io.*
import std.fs.*

let buffer = Array<Byte>(100, repeat: 0)

main() {
    let arrSize: Int64 = 10000
    let dataArr: Array<Byte> = Array<Byte>(arrSize, {i => UInt8(i % 256)})

    let bas1: ByteBuffer = ByteBuffer(arrSize)
    bas1.write(dataArr)
    var bis1: BufferedInputStream<ByteBuffer> = BufferedInputStream(bas1, buffer)
    if (bas1.length != arrSize) {
        return 1
    }

    let bas2: ByteBuffer = ByteBuffer(arrSize)
    bas2.write(dataArr)
    var bis2: BufferedInputStream<ByteBuffer> = BufferedInputStream(bas2, buffer)
    if (bas2.length != arrSize) {
        return 2
    }

    let file1: File = File("tempFile.txt", ReadWrite)
    file1.write(dataArr)
    file1.seek(SeekPosition.Begin(0))
    var bis3: BufferedInputStream<File> = BufferedInputStream(file1, buffer)
    let file1_length = file1.length
    file1.close()
    remove("tempFile.txt")
    if (file1_length != arrSize) {
        return 3
    }

    let file2: File = File("tempFile.txt", ReadWrite)
    file2.write(dataArr)
    file2.seek(SeekPosition.Begin(0))
    var bis4: BufferedInputStream<File> = BufferedInputStream(file2, buffer)
    let file2_length = file2.length
    file2.close()
    remove("tempFile.txt")
    if (file2_length != arrSize) {
        return 4
    }

    return 0
}
