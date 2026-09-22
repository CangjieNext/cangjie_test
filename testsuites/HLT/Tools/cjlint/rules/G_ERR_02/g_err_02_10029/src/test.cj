/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.io.IOException

func exceptionExample(path: String): Unit {
    if (path.size == 0) {
        throw IOException("File does not exist")
    }
    println(path)
}

main() {
    exceptionExample("a")
}
