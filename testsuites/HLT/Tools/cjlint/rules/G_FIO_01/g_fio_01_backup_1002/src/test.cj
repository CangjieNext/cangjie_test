import std.fs.{File, OpenMode, remove}

let PATHNAME = "/mytemp/doc.txt"
let PATHNAME2 = "/mytemp/doc.txt"
let FILENAME: File = File(PATHNAME, OpenMode.Append)

main(){
  remove(PATHNAME2)
  return 0
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
