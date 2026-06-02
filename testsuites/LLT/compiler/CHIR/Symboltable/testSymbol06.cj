// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC:%compiler %n.cj %compile_lib_opt

class Test {
    public func a() {
        let bbb = [[(1, 2), (3, 4), (5, 6)], [(1, 2), (3, 4), (5, 6)], [(1, 2), (3, 4), (5, 6)]]
        for (bb in bbb) {
            for ((x, y) in bb) {
                println(x)
                println(y)
            }
        }
    }
}

main() {
    var test = Test()
    test.a()
    var (a, _, _) = (3, 4, 5)
    let empty: String = String()
    var aa: String = ""
    let tv = ("Alice", 24)
    let s = match (tv) {
        case ("Bob", age) => "Bob is ${age} years old"
        case ("Alice", age) => "Alice is ${age} years old"
        case (name, 100) => "${name} is 100 years old"
        case (_, _) => "someone"
    }
    print(s)
}
