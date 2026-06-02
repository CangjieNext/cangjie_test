/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.fs.{File, OpenMode, remove}

interface A<T> {
    static func test<T>() {
        var pathName = "/mytmphhh/doc.txt"
        var file: File = File(pathName, OpenMode.Append)
        if (file.canWrite()) {
            file.flush()
            file.close()
            remove(pathName)
        } else {
            remove(pathName)
            return 1
        }
        return 0
    }
}

main(){
    A<Int64>.test<Int64>()
    return 0
}


