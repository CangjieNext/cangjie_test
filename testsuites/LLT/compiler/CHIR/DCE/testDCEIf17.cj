// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %f %enableO2 2>&1 > a.t
// (Linux) EXEC: [[ $(wc -l a.t | awk '{print $1}') -eq 0 ]]

import std.fs.File
import std.fs.FileInfo
import std.fs.Path
import std.fs

extend File {
    static func exists(path: Path): Bool {
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
    _ = File.exists(a)
    println(a)
}
