// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

enum Foo {
    A | B | C
}

main() {
    func f() {
        let x = Foo.A
        match (x) {
            case A => 0 // enum pattern
            case B => 1 // enum pattern
            case D => 3 // binding pattern
            case C => 2 // enum pattern
        }
    }
}