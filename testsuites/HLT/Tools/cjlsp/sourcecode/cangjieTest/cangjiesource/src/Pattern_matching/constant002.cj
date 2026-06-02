/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Pattern_matching

enum Foo {
    FooA | FooB | FooC
}
func f1() {
    let x = Foo.FooA
    match (x) {
        case FooA => 0
        case FooB => 1
        case FooC => 2
    }
}
