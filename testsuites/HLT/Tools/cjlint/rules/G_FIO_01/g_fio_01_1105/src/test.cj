import std.fs.{File, OpenMode, remove}

struct A<T> {
    var pathName = "/tmphhh/doc.txt"
    var file: File = File(pathName, OpenMode.Append)
}

main() {
    if (A<Int64>().file.canWrite()) {
        A<Int64>().file.flush()
        A<Int64>().file.close()
        remove(A<Int64>().file)
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
