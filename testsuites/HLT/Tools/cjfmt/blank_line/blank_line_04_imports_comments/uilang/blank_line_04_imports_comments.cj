/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.env.*


import std.sync.*


func f(): Int64 {

    // leading comment

    return 1

}


// comment between funcs


func g(): Int64 {
    return 2
}

main() {
    println(f())
    println(g())
}
