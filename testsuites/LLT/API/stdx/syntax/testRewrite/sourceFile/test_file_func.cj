/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// top-level decls
var a = 1
private var stop = a
var b = 1 + 1

func foo(a: Int64) {
    var a = 1
    println(a)
}

private func goo() {
    var a = 1
    println(a)
}

main() { // block
    let test = b // trailing comment
    0
}