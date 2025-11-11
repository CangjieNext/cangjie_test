/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.fs.{File, OpenMode, remove}

func foo(){
  var pathName = "/mytEmpdsfs%%%335362/doc.txt"
  var arr: Array<Int64> = [1,2]
  if (arr[{=> var a = File(pathName, OpenMode.Append);0}()] == 1) {
    print("This file already exists or created!")
  } else {
    return 1
  }
  return 0
}
main(){
   return foo() 
}

