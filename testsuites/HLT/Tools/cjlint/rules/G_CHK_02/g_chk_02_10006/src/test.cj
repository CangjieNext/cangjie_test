/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import stdx.log.*
import stdx.logger.*
import std.fs.*
import std.io.*
import std.console.*

class A{
  func foo(){
    var fs: File = File("password", ReadWrite)
    var v1: Array<UInt8> = readToEnd(fs)
    fs.read(v1)
    SimpleLogger(Console.stdOut).log(LogLevel.ERROR, v1[0].toString())
    fs.close()
  }
}

main(): Int64 {
  A().foo()
  0
}

