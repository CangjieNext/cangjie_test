/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.fs.{File, OpenMode, remove}

class A{}

extend A{
  static func foo(file!:File = File("/maytmtmmptmp/doc.txt",OpenMode.Append)){
    remove("/maytmtmmptmp/doc.txt")
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


