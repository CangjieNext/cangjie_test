package default.Pattern_matching

enum Foo {
    A | B | C
}
func f1() {
    let x = Foo.A
    match (x) {
        case A => 0
        case B => 1
        case C => 2
    }
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
