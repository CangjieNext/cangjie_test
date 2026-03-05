// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cjworld

import interoplib.objc.*

// =========================================================
// Enum Definition: Enum with recursive construction (Expr)
// =========================================================
public enum Expr {
    | Num(Int64)
    | Add(Expr, Expr)
    | Sub(Expr, Expr)

    // To eval the expr. 
    public func eval(): Int64 {
        match (this) {
            case Num(n) => n
            case Add(left, right) => left.eval() + right.eval()
            case Sub(left, right) => left.eval() - right.eval()
        }
    }
}
