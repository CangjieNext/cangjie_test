// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC:%frontendCompiler %typecheck %cmp_opt -Woff all %f
// TIMEOUT: 30

// Guard for issue #927 with the compose operator `~>`: ChkFlowExpr synthesizes
// foldx independently and cannot propagate the String context to the lambda.
// Before the fix this burned ~5s in retry storms and then failed with
// "parameters of this lambda expression must have type annotations". After
// filtering under-determined sum candidates, the only remaining candidate for
// `e[1]` is String, which supplies exactly the missing context: the lambda
// params are now correctly inferred (e: String, state: Bool) and this file
// compiles fast.

import std.collection.*

public func foldx<T, R>(initial: R, operation: (R, T) -> R): (T) -> R {
    return { it: T => return initial }
}

func g(b: Bool): String {
    return "text"
}

public func splitSlow(): Unit {
    let f = g ~> foldx(false) {
        state, e =>
            var current = "xxx".indexOf(e[1]).isNone()
            if (state != current) {}
            true
    }
    return
}
