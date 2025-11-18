/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public platform class C<X> where X <: C<X> {
    public platform func foo() {
        var a = 1
    }
    public platform init(input: X) {
        var b = 3
        let a: Unit = input.foo()
    }
}