/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package justtest

import std.fs.Path
import std.fs
import justtest.aoo

main(): Unit {
    let a = Path("./src/")
    println(fs.exists(a))

    let b = aoo.fileExists()
    println(b)
}
