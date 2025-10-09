import std.fs.{File, OpenMode, remove}

class B {
  var a: File

  init(){
    this(File("/myTTTTTeMppMMp/doc.txt", OpenMode.Append))
    remove("/myTTTTTeMppMMp/doc.txt")
  }
  init(a: File){
    this.a = a
  }
}

main(){
  var x: B = B()
  return 0
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
