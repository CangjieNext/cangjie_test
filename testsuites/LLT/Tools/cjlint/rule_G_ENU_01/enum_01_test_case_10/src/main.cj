// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

import cmp.A

main() {
    let a = A.ELEMENT
    a.foo()
}

public enum A {
    | ELEMENT
    public platform func foo(): Unit {
        println("I am nothing")
    }
}