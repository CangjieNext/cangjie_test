import std.fs.*

let PATHNAME = "/mytemp/doc.txt"
let FILE: File = File(PATHNAME, OpenMode.Append)// cjlint-ignore !G.FIO.01

main(){
  if (FILE.canWrite()) {
    FILE.flush()
    FILE.close()
    print("This FILE already exists or created!")
  } else {
    return 1
  }
  return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
