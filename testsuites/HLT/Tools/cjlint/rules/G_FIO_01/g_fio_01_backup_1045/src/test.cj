/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.fs.{File, OpenMode, remove}

main(){
  func foo(){
    for (i in 0..1){
      var pathName = "/mye33rTMMPfrfTmp/doc.txt"
      var fs: File = File(pathName, OpenMode.Append)
      remove(pathName)
    }
    return 0
  }

  if (foo() == 0){
    return 0
  }else{
    return 1
  }
}


