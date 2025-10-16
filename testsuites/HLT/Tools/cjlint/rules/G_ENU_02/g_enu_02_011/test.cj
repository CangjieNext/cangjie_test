/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

open class A {}
open class B <: A {}
open class C <: B {}
open class D <: B {}
enum E1 {
    | A1(A)
}
enum E2 {
    | A1(D)
}

main() {
    return 0
}

