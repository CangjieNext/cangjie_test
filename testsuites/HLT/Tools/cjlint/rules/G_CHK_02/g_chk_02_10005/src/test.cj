import stdx.logger.*
import stdx.net.http.*
import std.io.*
import std.console.*

class A <: OutputStream{
  public func write(buffer: Array<Byte>): Unit{var a = buffer}
  public func flush(): Unit{}
}

main(): Int64 {
  if(HttpResponseBuilder().build() is HttpResponse){
    SimpleLogger(Console.stdOut).warn(HttpResponseBuilder().build().toString())
  }else{
    SimpleLogger(Console.stdOut).warn("")
  }
  0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
