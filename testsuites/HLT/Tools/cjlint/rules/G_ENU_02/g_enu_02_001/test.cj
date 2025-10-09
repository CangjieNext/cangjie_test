open class Base {}
open class Derived <: Base {}
class A <: Derived{}
enum E1 {
    | A1(Base)
}
enum E2 {
    | A1(A)
}

main() {
    let a1 = A1(Derived())
    let a2 = A1(Derived())
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
