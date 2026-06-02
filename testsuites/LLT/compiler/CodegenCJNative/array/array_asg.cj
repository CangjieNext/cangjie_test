// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

class d {
    var i = 4
    var b: Unit = ()
}

func f() {
    [d().i++, d().i = 0]
}

main() {
    println(f()[0])
    println(f()[1])
    return 0
}
