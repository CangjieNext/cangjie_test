import stdx.log.*
import stdx.logger.*
import std.io.*
import stdx.net.http.*
import std.console.*

class B{
  static var a: HttpResponse = ClientBuilder().build().get("http://127.0.0.1:10245/foo")
}

struct A{
  var s1 = SimpleLogger(Console.stdOut).log(LogLevel.ERROR, ({=> ([B.a],[B.a])}()[0][0].version).toString())
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
