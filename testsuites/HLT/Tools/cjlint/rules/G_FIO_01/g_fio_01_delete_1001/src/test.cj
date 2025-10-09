import std.fs.{File, OpenMode, remove}

let pathName = "/mytemp/doc.txt"
let fs: File = File(pathName, OpenMode.Append)

main(){
    if (fs.canWrite()) {
        fs.flush()
        fs.close()
        print("This file already exists or created!")
        remove(pathName)
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
