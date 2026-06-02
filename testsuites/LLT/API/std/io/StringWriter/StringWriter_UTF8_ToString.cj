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
 * Test API:    public func write<T>(v: T): Unit where T <: ToString
 *              public func writeln<T>(v: T): Unit where T <: ToString
 */

internal import std.io.*
internal import std.fs.*

class A <: ToString {
    public func toString() {
        "ABCDEABCDEABCDE"
    }
}

main() {
    var fileName = "./testFile_UTF8.txt"
    var file = File(fileName, ReadWrite)

    var strWriter = StringWriter(file)
    strWriter.writeln(A())
    strWriter.write(A())
    strWriter.flush()

    file.seek(Begin(0))
    var readArr: Array<Byte> = readToEnd(file)
    file.close()
    remove(fileName)

    if (String.fromUtf8(readArr) != "ABCDEABCDEABCDE\nABCDEABCDEABCDE") {
        return 1
    }
    println("ok")
    return 0
}
