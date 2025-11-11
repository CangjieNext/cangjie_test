/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.fs.{File, OpenMode, remove}

main(){
  var pathName = "/mytEmpdsfs%%%335362/doc.txt"
  var b: Bool = File(pathName, OpenMode.Append) is File
  if (b){
    print("This file already exists or created!")
    return 0
  }
  return 1
}

