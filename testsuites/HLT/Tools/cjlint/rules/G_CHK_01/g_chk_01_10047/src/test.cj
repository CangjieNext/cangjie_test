import stdx.log.*
import std.fs.*
import std.io.*

class A{
  func foo(){
    var file: File = File("pathname", OpenMode.Append)
    var v1: Array<UInt8> = readToEnd(file)
    if(v1.size > 0){
      return 
    }else{
      ()
    }
    func foo2(a:Array<UInt8>){
      return a
    }
    foo2(v1)
  }
}

main(): Int64 {
  A().foo()
  0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
