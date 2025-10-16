// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.fs.*
internal import std.posix.*

func test11() {
    var pathName = "/mytmp/doc.txt"
    var fd = creat(pathName, S_IRWXU)
    if(fd > 0){
        print("${1}")
    }
    close(fd)
    return 0
}
