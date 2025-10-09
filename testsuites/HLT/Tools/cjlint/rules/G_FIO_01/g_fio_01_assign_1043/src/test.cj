import std.fs.{File, OpenMode, remove}

struct A{
  func foo(){
    var pathName = "/mytssdsdetEmp/doc.txt"
    do{
      var file = File("temp", OpenMode.Append)
      file = File("dsjdhjf", OpenMode.Append)
    }while(!(File(pathName, OpenMode.Append) is File))
    return 1
  }
}

main(){
  if (A().foo() == 0) {
    return 0
  } else {
    return 1
  }
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
