import std.fs.{File, OpenMode, remove}

var j = 0

class A {}

extend A{
  public mut prop i: Int64 {
    get() {
      j
    }
    set(v) {
      var pathName = "/myytteemmpp*mpmtemp/doc.txt"
      var file: File = File(pathName, OpenMode.Append)
      remove(pathName)
      return j = v
    }
  }
}

main(){
  A().i = 3
  if (A().i == 3){
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
