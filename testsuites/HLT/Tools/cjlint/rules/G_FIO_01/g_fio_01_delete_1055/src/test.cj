/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.fs.{File, OpenMode, remove}

class A{
  var pathName = "/tEmPytHHHHemp/doc.txt"
  var file: File = File(pathName, OpenMode.Append)
}

main(){
  if (A().file is File){
    print("This file already exists or created!")
    remove(A().pathName)
    return 0
  }
  return 1
}

