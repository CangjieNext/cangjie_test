macro package test

import std.ast.{Tokens, ToBytes}
import std.fs.{File, OpenMode, remove}

public macro test(input: Tokens) {
    var pathName = "/mytemp/doc.txt"
    var file = File(pathName, OpenMode.Append)
    if (file.canWrite()) {
        file.flush()
        file.close()
    }
    return input
}

main() {
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
