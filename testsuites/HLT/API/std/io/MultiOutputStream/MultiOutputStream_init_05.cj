/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt -o %output %f
// RUN-EXEC: %run %run_opt %output %run_args
import std.io.*
import std.fs.*

main() {
    var arr = Array<Byte>(1024 * 1024, {i => UInt8(i % 256)})
    var fileName1 = "test_File1.txt"
    var fileName2 = "test_File2.txt"
    var fileName3 = "test_File3.txt"
    var file1 = File(fileName1, Write)
    var file2 = File(fileName2, Write)
    var file3 = File(fileName3, Write)
    var fileArr: Array<OutputStream> = [file1, file2, file3]
    var multiOutputStream = MultiOutputStream(fileArr)
    multiOutputStream.write(arr.slice(0, 256 * 1024).toArray())
    multiOutputStream.write(arr.slice(256 * 1024, 256 * 1024).toArray())
    multiOutputStream.write(arr.slice(512 * 1024, 512 * 1024).toArray())
    multiOutputStream.flush()
    file1.close()
    file2.close()
    file3.close()
    var dataArray = File.readFrom(fileName1)
    var dataArray1 = File.readFrom(fileName2)
    var dataArray2 = File.readFrom(fileName3)
    remove(fileName1)
    remove(fileName2)
    remove(fileName3)
    if (dataArray != arr) {
        return 1
    }
    if (dataArray1 != arr) {
        return 1
    }
    if (dataArray2 != arr) {
        return 1
    }
    return 0
}
