/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

open class Base {}
class Derived <: Base {}

func g<X>(a: X, b: Derived): Unit {
    println(a)
    let _ = b
}

func g(a: Derived, b: Base): Unit {
    println(a)
    let _ = b
}

main() {
    g(Derived(), Derived())
}
