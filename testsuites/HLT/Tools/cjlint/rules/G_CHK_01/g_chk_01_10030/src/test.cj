import stdx.log.*
import std.fs.*
import std.io.*

class A{
  func foo(){
    var file: File = File("password", OpenMode.Append)
    var v1: Array<UInt8> = readToEnd(file)
    var v2: Array<UInt8> = Array<UInt8>(25, { i => 0 })
    
    if(v1 is Array<UInt8>){
      if (v1[0] is UInt8){
        return v1
      }
    }
    v2
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
