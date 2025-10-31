/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.fs.{File, OpenMode, remove}

let pathName = "/myTetEmp/doc.txt"

func f2(a: (File)->Int64){
  a(File(pathName, OpenMode.Append))
}

func f3(a: ((File)->Int64) -> Int64){
  a(f1)
}

func f1(a: File){
  remove(pathName)
  return 0
}

main(){
  if (f3(f2) == f2(f1)){
    return 0
  }
  return 1
}


