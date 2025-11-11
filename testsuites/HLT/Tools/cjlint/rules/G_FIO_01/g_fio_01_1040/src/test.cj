/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.fs.{File, OpenMode, remove}

func foo(){
  var pathName = "/te!@#@$#%^$%^mpmyte$^$^$^$mpggmggp/doc.txt"
  var a:Unit = match(File(pathName, OpenMode.Append)) {
    case _ => ()
  }
  if (true){
    print("This file already exists or created!")
  }
  return 0
}

main(){
  foo()
}


