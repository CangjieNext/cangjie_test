import stdx.log.*
import std.io.*
import stdx.net.http.*

func foo(a:HttpResponse){
  return a
}

class A{}

extend A{
  func foo1(){
    foo(ClientBuilder().build().get("http://127.0.0.1:10245/foo"))
    0
  }
}

main(): Int64 {
  A().foo1()
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
