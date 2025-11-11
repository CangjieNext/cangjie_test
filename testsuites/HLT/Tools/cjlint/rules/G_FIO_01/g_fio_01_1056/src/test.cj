/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.fs.{File, OpenMode, remove}

let PATHNAME = "/myte$%^^&$&***mp/doc.txt"

func f1(a: File){
  if (a.canWrite()) {
    a.flush()
    a.close()
    print("This file already exists or created!")
  } else {
    return 1
  }
  return 0
}

main(){
  if (f1(File(PATHNAME, OpenMode.Append)) == 0 ){
    return 0
  }
  return 1
}


