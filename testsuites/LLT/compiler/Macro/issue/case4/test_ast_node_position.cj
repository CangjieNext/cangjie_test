// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import define.*

@CheckPos
func sayHi(x: String): String {
    match (x) {
        case "Bob" => "Hello Bob!"
        case "Alice" => "Hi Alice!"
        case _ => "Bye!"
    }
}

@CheckPos
func pick(x: Bool): String {
    match {
        case x => "yes"
        case _ => "no"
    }
}

main() {
    println(sayHi("Bob"))
    println(sayHi("Alice"))
    println(sayHi("Eve"))
    println(pick(true))
    println(pick(false))
}
