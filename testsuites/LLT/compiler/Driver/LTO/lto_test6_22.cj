// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Linux and CJNATIVE) EXEC: %compiler %cmp_opt %f -o %output --lto=full
// (Linux and CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args

internal import std.fs.*

main() {
    let filePath: Path = Path("./tempFile.txt")
    if (exists(filePath)) {
        remove(filePath)
    }
    /* 以 只写模式 创建文件，并写入 "123456789\n" 并关闭文件 */
    var file: File = File.create(filePath)
    file.write("123456789\n".toArray())
    file.close()
    /* 以 追加模式 写入 "abcdefghi\n" 到文件 */
    File.appendTo(filePath, "abcdefghi".toArray())
    /* 直接读取文件中所有数据 */
    let allBytes: Array<Byte> = File.readFrom(filePath)
    remove(filePath)
    if (allBytes == "123456789\nabcdefghi".toArray()) {
        return 0
    }
    println(String.fromUtf8(allBytes))
    return 1
}
