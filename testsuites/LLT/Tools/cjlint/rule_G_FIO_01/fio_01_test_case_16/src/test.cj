// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.fs.remove
internal import std.posix.{creat, close, S_IRWXU}

func test12() {
    var pathName = "/mytmp/doc.txt"
    var fd = creat(pathName, S_IRWXU)
    if(fd > 0){
        // Issue143: Interpolation String "${1}" will generate a block with a return.
        // Cjlint maybe report an error of G.FIO.01.
        print("1")
    }
    close(fd)
    remove(pathName)
    return 0
}