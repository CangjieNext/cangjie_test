/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

struct S1{
    static let tv = ("Alice", 24)
    static let s = match (tv) {
        case ("Bob", age) => "Bob is ${age} years old"
        case ("Alice", age) => "Alice is ${age} years old" // Matched, "Alice" is a constant pattern, and 'age' is a variable pattern.
        case (name, 100) => "${name} is 100 years old"
        case (_, _) => "someone"
    }
    var a = 0
}
main() {
    var a1 = S1()
    0
}
