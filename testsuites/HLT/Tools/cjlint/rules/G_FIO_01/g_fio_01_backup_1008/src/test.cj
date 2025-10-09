import std.fs.{File, OpenMode, remove}

class A{
  static func foo(){
    var pathName = "/mytemp/doc.txt"
    var file: File = File(pathName, OpenMode.Append)
    remove(pathName)
    return 0
  }
}

main(){
  if (A.foo() == 0){
    return 0
  }else{
    return 1
  }
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
