import std.fs.{File, OpenMode, remove}

class A{}

extend A{
  func foo(){
    try{
      var pathName = "/mye33rTMMPfrfTmp/doc.txt"
      var file: File = File(pathName, OpenMode.Append)
      print("This file already exists or created!")
    }catch(_){}
    return 0
  }
}

main(){
  return A().foo()
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
