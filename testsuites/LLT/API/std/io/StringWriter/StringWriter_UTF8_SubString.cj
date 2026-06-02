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
 * Test API:    public func write(v: SubString): Unit
 *              public func writeln(v: SubString): Unit
 */

internal import std.io.*
internal import std.fs.*

main() {
    var fileName = "./testFile_UTF8.txt"
    var file = File(fileName, ReadWrite)

    var strWriter = StringWriter(file)
    var str = "0123456789"
    strWriter.writeln(str[0..5])
    strWriter.write(str[5..10])
    strWriter.flush()

    file.seek(Begin(0))
    var readArr: Array<Byte> = readToEnd(file)
    file.close()
    remove(fileName)

    if (String.fromUtf8(readArr) != "01234\n56789") {
        return 1
    }
    println("ok")
    return 0
}
