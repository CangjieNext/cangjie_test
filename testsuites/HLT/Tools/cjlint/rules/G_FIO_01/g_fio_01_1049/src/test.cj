/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.fs.{File, OpenMode, remove}

var arr = [1,2]
class A{}

extend A{
  func foo(){
    try{
      var a = arr[3]
    }catch(_){}finally{
      var pathName = "/mye33rTMMPfrftm!@!@#!$#%^&p/doc.txt"
      var file: File = File(pathName, OpenMode.Append)
      print("This file already exists or created!")
    }
    return 0
  }
}

main(){
  return A().foo()
}


