import std.fs.{File, OpenMode, remove}

main(){
  var pathName = "/mytEmpdsfs%%%335362/doc.txt"
  var b = File(pathName, OpenMode.Append) as File
  var c:File = match(b){
    case Some(x) => x
    case _ => File("pathName", OpenMode.Append)
  }
  remove(pathName)
  return 0
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
