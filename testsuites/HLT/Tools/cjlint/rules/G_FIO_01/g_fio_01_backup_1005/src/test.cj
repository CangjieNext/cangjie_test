import std.fs.{File, OpenMode, remove}

let pathName = "/mytmp/doc.txt"

func temp(){
    var file: File = File(pathName, OpenMode.Append)
}

func temp2(){
  remove(pathName)
  return 0
}

main(){
    temp()
    temp2()
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
