// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.fs.*
internal import stdx.net.http.*
internal import std.regex.*
internal import std.io.*

class A{
  func foo1(){
    var file: File = File("pathname", OpenMode.Append)
    var v3 = readToEnd(file)
    if(v3.size == 0){
      Regex(v3.toString())
      ""
      // return Regex(v3.toString())
    }else{
      ""
    }
  }
}

main(): Int64 {
  A().foo1()
  0
}