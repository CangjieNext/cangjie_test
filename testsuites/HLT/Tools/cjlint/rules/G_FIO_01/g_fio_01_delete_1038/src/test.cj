import std.fs.{File, OpenMode, remove}

main(){
  var pathName = "/tempmyteggmggp/doc.txt"
  var a:Int64 = match(File(pathName, OpenMode.Append)) {
    case x => 1
  } 
  if (a == 1){
    print("This file already exists or created!")
    remove(pathName)
    return 0
  }
  return 1
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
