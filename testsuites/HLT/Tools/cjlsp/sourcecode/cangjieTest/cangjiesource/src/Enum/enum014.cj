/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Enum

//递归
enum Expr1 {
    | Num(Int64)
    | Add(Expr1, Expr1)
    | Sub1(Expr1, Expr1)
}

var b1 = Expr1.Num(1)
var b2 = Expr1.Add(Expr1.Num(1), Expr1.Num(2))
