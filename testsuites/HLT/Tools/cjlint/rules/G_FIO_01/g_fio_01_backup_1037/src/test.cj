/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.fs.{File, OpenMode, remove}

main(){
  if (false) {
    return 1
  } else {
    var pathName = "/tmpmyteggmggp/doc.txt"
    var file: File = File(pathName, OpenMode.Append)
    remove(pathName)
  }
  return 0
}


