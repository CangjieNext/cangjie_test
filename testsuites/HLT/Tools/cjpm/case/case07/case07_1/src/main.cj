/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package test

import std.fs.File
import std.fs.FileInfo
import std.fs.Path
import std.fs

extend File {
    protected static func exists(path: Path): Bool {
        if (!fs.exists(path)) {
            return false
        } else {
            if (FileInfo(path).isDirectory()) {
                return false
            } else {
                return true
            }
        }
    }
}

main(): Unit {
    let a = Path("./src/")
    println(a)
}
