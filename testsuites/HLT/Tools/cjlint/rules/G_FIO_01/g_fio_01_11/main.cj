// LEVEL: 1
// EXEC-PIPE: %lint -f ./  -c %cangjieDir/tools -m %cangjieDir 2>&1 | compare %f
// ASSERT: scan G.FIO.01
import std.fs.{File, OpenMode, remove}

enum E{
    T1
    func test(){
        let pathName = "tempdoc.txt"
        if (true){
                var a = File(pathName, OpenMode.Append)
            }
    }
}


main(){
  return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
