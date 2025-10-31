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
  func foo(file!:File = File("/tmydsfdgh$tmp$%^t6566mp/doc.txt",OpenMode.Append)){
    remove("/tmydsfdgh$tmp$%^t6566mp/doc.txt")
    return 0
  }
}

main(){
  if (A().foo() == 0){
    return 0
  }else{
    return 1
  }
}


