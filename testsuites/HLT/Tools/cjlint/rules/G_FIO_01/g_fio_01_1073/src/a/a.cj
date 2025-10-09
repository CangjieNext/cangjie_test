macro package a

import std.ast.Tokens
import std.fs.{File, OpenMode, remove}

public macro M1(input:Tokens):Tokens {
    var pathName = "/mytemp/doc.txt"
    var file = File(pathName, OpenMode.Append)
    if (file.canWrite()) {
        file.flush()
        file.close()
    }
    return input
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
