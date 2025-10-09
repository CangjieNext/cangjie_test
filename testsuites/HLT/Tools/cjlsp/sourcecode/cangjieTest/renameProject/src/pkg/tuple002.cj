/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.pkg

func test9() {
    let tv = ("Alice", 24)
    let s = match (tv) {
        case ("Bob", age) => "Bob is ${age} years old"
        case ("Alice", age) => "Alice is ${age} years old"
        case (name, 100) => "${name} is 100 years old"
        case _ => ""
    }
}
