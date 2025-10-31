/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.fs.{File, OpenMode, remove}
import std.posix.{creat, O_RDONLY}


struct A{
  static func foo(){
    do{
      var pathName = "/mye33rTeMPfrfmp/doc.txt"
      var fs: Int32 = creat(pathName,UInt32(O_RDONLY))
      if (fs != -1) {
        print("This file already exists or created!")
      }else{
        return 1
      }
      break
    }while(false)
    return 0
  }
}

main(){
  if(A.foo() == 0){
    return 0
  }else{
    return 1
  }
}

