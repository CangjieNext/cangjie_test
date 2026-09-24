/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

open class Base {}
class Derived <: Base {}

enum E1 {
    | A(Base)
}

func A(d: Derived): Unit {}

main() {
    let a = A(Derived())
}
