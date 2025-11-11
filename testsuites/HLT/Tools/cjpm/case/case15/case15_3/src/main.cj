/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package test

import stdx.crypto.x509.*
import stdx.net.tls.*
import stdx.net.http.*
import std.fs.{File, OpenMode}
import std.io.*

func readPermFile(path: String): String{
    try (file = File(path, Read)){
        return String.fromUtf8(readToEnd(file))
    }
    ""
}

func loadTlsConfig(certFilePath: String, keyFilePath: String): Int64 {
    let certText = readPermFile(certFilePath)
    let keyText = readPermFile(keyFilePath)
    return 0
}

main() {
    println("hello")
}