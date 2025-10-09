import stdx.log.*
import stdx.logger.*
import std.posix.*
import std.console.*

class B{
  static var result = getuid()
}

struct A{
  let logger = SimpleLogger(Console.stdOut)
  var s1 = logger.log(LogLevel.ERROR, UInt8(UInt32(Int16(Int32({([B.result],[B.result])}()[0][0])))).toString())
}

main(): Int64 {
  A().s1
  0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
