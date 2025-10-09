import std.fs.{File, OpenMode, remove}
import std.posix.{creat, O_RDONLY}


class A{
  var pathName = "/mytemp/doc.txt"
  var fs: Int32 = creat(pathName,UInt32(O_RDONLY))
}

main(){
  remove(A().pathName)
  return 0
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
