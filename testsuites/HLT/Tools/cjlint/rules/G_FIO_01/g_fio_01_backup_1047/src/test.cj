/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.fs.{File, OpenMode, remove}

main(){
  let pathName = "/myttempp/doc.txt"

  func foo(){
    return File(pathName, OpenMode.Append)
  }

  foo()
  remove(pathName)
  return 0
}


