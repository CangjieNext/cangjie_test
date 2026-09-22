/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func esc(): String {
    let a = "line1\nline2\t tab \\ backslash \" quote \u{4e2d}\u{6211}"
    let b = "\u{01}\u{00ff}"
    return a + b
}

main() {
    println(esc().size)
}
