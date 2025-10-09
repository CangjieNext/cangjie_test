import std.fs.{File, OpenMode, remove}

var j = 0

interface A {
  mut prop i: Int64 {
    get() {
      j
    }
    set(v) {
      var pathName = "/mytemp/doc.txt"
      var file: File = File(pathName, OpenMode.Append)
      if (file.canWrite()) {
        print("This file already exists or created!")
      } 
      return j = v
    }
  }
}

class B <: A{}

main(){
  B().i = 3
  if (B().i == 3){
    return 0
  }else{
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
