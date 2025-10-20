import std.fs.{File, OpenMode, remove}

struct R {
  public var a: File
  public init(a: File) {
    this.a = a
  }
}

main(){
  var pathName = "/mytEmpdsfs%%%335362/doc.txt"
  let r1 = Some(R(File(pathName, OpenMode.Append)))?.a
  return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
