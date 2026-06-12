/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.fs.{File, OpenMode, remove}
import std.posix.{creat, O_RDONLY}


class A{
  var pathName = "/mytemp/doc.txt"
  var file: Int32 = creat(pathName,UInt32(O_RDONLY))
}

main(){
  A().file = creat("!@#$%%^^&",UInt32(O_RDONLY))
  if (A().file != -1) {
    print("This file already exists or created!")
  } else {
    return 1
  }
  return 0
}


