// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC:%compiler %n.cj -o %output
// EXEC: %run %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

enum Expr <: ToString {
    | BOOL(Bool)
    | STR(String)
    | None
    | Add(Expr, Expr)

    public func toString(): String {
        match (this) {
            case STR(s) where s == "abc" => s
            case Add(e1, e2) => "ADD ${e1} ${e2}"
            case _ => "Not supported"
        }
    }
}

main() {
    var e = Expr.None
    print(e)
}
