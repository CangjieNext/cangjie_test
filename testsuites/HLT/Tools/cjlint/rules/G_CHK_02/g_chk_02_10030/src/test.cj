import stdx.logger.*
import std.net.*
import std.console.*

func foo(){
  var server = TcpSocket("127.0.0.1", UInt16(0))
  var buf: Array<UInt8> = [1]
  var buf1 = server.read(buf)
  let logger = SimpleLogger(Console.stdOut)
  logger.info(buf[0].toString())
  0
}

main(): Int64 {
  foo()
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
