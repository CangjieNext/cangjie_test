/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.fs.{File, OpenMode, remove}

class A{
  func foo(){
    var pathName = "/mytssdsdetmp/doc.txt"
    while(File(pathName, OpenMode.Append) is File){
      if (File(pathName, OpenMode.Append) is File) {
        print("This file already exists or created!")
        remove(pathName)
        return 0
      } 
      break
    }
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

