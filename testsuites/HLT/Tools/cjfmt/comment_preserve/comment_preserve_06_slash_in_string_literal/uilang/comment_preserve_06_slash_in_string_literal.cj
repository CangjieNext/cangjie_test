/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func strings(): Unit {
    let url = "http://example.com/a//b"
    let p = "/* not a comment"
    let q = "*/ still not a comment"
    println(url)
    println(p)
    println(q)
}

func blockWithSlash(): Int64 {
    /*
    // looks like a line comment but inside block
     */
    return 1
}

func lineWithStar(): Int64 {
    // line comment ends here */ not a block close
    return 2
}

main() {
    strings()
    println(blockWithSlash())
    println(lineWithStar())
}
