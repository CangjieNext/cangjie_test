/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %stdx-package -o %n.%suffix %f
// EXEC: %run %run_opt %n.%suffix %run_args | compare %f
// ASSERT: scan ok

/*
 * Test description: Test the func for calss StringWriter
 * Test API:    public func write(v: Int64): Unit
 *              public func writeln(v: Int64): Unit
 */

internal import std.io.*
internal import std.fs.*

main() {
    var fileName = "./testFile_UTF8.txt"
    var file = File(fileName, ReadWrite)

    var strWriter = StringWriter(file)
    strWriter.write(Int64(-9223372036854775808))
    strWriter.write(Int64(0))
    strWriter.writeln(Int64(9223372036854775807))
    strWriter.flush()

    file.seek(Begin(0))
    var readArr: Array<Byte> = readToEnd(file)
    file.close()
    remove(fileName)

    if (String.fromUtf8(readArr) != "-922337203685477580809223372036854775807\n") {
        return 1
    }
    println("ok")
    return 0
}
