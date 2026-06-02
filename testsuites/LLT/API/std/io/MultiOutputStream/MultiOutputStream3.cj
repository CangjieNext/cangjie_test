/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// EXEC: %run %run_opt %n.%suffix %run_args | compare %f
// ASSERT: scan ok

internal import std.io.*
internal import std.fs.*

main() {
    var arr = Array<Byte>(300, {i => UInt8(i % 256)})

    var fileName1 = "test_File1.txt"
    var fileName2 = "test_File2.txt"
    var fileName3 = "test_File3.txt"

    var file1 = File(fileName1, Write)
    var file2 = File(fileName2, Write)
    var file3 = File(fileName3, Write)

    var fileArr: Array<OutputStream> = [file1, file2, file3]
    var multiOutputStream = MultiOutputStream(fileArr)
    multiOutputStream.write(arr.slice(0, 150).toArray())
    multiOutputStream.write(Array<Byte>())
    multiOutputStream.write(arr.slice(150, 150).toArray())
    multiOutputStream.flush()

    file1.close()
    file2.close()
    file3.close()

    if (File.readFrom(fileName1) != arr) {
        return 1
    }

    if (File.readFrom(fileName2) != arr) {
        return 1
    }

    if (File.readFrom(fileName3) != arr) {
        return 1
    }

    remove(fileName1)
    remove(fileName2)
    remove(fileName3)

    println("ok")
    return 0
}
