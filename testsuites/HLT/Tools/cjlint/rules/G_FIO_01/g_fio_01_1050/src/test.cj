import std.fs.{File, OpenMode, remove}

open class A{
  var a: File
  init(a: File){
    this.a = a
  }
}

class B <: A{
  let pathName = "/myTTTTTeMppMMp/doc.txt"
  var b: Int64
  init(a: File,b: Int64){
    super(File(pathName, OpenMode.Append))
    this.a = a
    this.b = b
  }
  func foo(){
    print("This file already exists or created!")
    return 0
  }
}

main(){
  return B(File("pathName", OpenMode.Append),1).foo()
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
