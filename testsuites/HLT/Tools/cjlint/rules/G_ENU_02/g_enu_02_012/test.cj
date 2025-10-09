open class A {}
interface I {}
open class B <: A & I {}
enum E1 {
    | A1(B)
}
enum E2 {
    | A1(A)
}

main() {
    let a1 = A1(B())
    return 0
}


/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
