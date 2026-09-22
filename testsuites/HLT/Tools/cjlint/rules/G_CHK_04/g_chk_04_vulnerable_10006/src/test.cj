/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.regex.*

let REGEX_PATTER: Regex = Regex("a(b|c+)+d")

func test(arg: String): Int64 {
    let m = REGEX_PATTER.matches(arg)
    return 0
}

main() {
    println(test("abcd"))
}
