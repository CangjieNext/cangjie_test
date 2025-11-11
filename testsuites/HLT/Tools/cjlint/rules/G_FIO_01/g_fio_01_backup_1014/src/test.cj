/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.fs.{File, OpenMode, remove}

struct A{
  var file: File = File("", OpenMode.Append)
}

main(){
  if (A().file.canWrite()) {
  } else {
    return 1
  }
  return 0
}

