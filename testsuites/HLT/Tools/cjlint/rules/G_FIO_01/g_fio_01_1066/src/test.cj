/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.fs.{File, OpenMode, remove}
import std.posix.{creat, O_RDONLY}


func temp(){
  var pathName1 = "/mytmp1/doc.txt"
  var pathName2 = "/mytmp2/doc.txt"
  var pathName3 = "/mytmp3/doc.txt"
  var pathName4 = "/mytmp4/doc.txt"
  var pathName5 = "/mytmp5/doc.txt"
  var pathName6 = "/mytmp6/doc.txt"
  var pathName7 = "/mytmp7/doc.txt"
  var pathName8 = "/mytmp8/doc.txt"
  var pathName9 = "/mytmp9/doc.txt"
  var pathName10 = "/mytmp10/doc.txt"
  var fs1: File = File(pathName1, OpenMode.Append)
  remove(pathName1)
  var fs2: File = File(pathName2, OpenMode.Append)
  var fs3: File = File(pathName3, OpenMode.Append)
  remove(pathName2)
  remove(pathName3)
  var fs4: Int32 = creat(pathName4,UInt32(O_RDONLY))
  var fs5: File = File(pathName5, OpenMode.Append)
  remove(pathName4)
  var fs6: File = File(pathName6,OpenMode.Append)
  var fs7: File = File(pathName7, OpenMode.Append)
  var fs8: File = File(pathName8, OpenMode.Append)
  var fs9: Int32 = creat(pathName9,UInt32(O_RDONLY))
  var fs10: File = File(pathName10, OpenMode.Append)
  remove(pathName6)
  remove(pathName7)
  remove(pathName8)
  remove(pathName9)
  remove(pathName10)
  return 0
}

main() {
  temp()
}


