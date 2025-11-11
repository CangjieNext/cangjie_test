/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %lint -f ./  -c %cangjieDir/tools -m %cangjieDir 2>&1 | compare %f
// ASSERT: scan G.FIO.01
import std.fs.{File, OpenMode, remove}

func temp(){
    
    let pathName = "/mytemp/doc.txt"
    let x = 0
    let file: File = match (x) {
        case 1 =>  File(pathName, OpenMode.Append)
        case _ => File(pathName, OpenMode.Append)
    }
    
}


main(){
  return 0
}

