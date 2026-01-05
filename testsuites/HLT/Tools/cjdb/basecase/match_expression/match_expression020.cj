/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

enum Expr {
    | Num(Int64)
    | Add(Expr, Expr)
    | Sub(Expr, Expr)
}

main() {
    let x = Add(Num(1),Num(2))
    let s = match (x) {
        case Num(y) => "aa"
        case Add(m,n) => "ss"
        case Sub(m,n) => "gg"
    }
    println(s)
}
