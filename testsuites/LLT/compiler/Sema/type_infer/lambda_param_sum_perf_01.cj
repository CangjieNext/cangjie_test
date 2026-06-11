// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC:%frontendCompiler %typecheck %cmp_opt -Woff all %f
// TIMEOUT: 30

// Performance guard for issue #927: an unused `import std.collection.*` made
// TypeCheck of this file blow up to ~16s (44678 LocalTypeArgumentSynthesis
// instances). Under-determined sum candidates (e.g. HashMap<K, V> matched via
// `operator [](key: K): V` where V is not constrained by any parameter) injected
// free placeholder type vars, so the literal-retry logic in binary expression
// checking re-resolved the member call chain combinatorially. With the fix the
// under-determined candidates are filtered out and TypeCheck finishes in ~0.1s.

import std.collection.*

public func foldx<T, R>(initial: R, operation: (R, T) -> R) : (T) -> R {
    return {
        it: T => return initial
    }
}

public func split(): Unit {
    "text" |> foldx(0) {
        state, e =>
            let current = "xxx".indexOf(e[1]).getOrThrow()
            if (state + current + current > 10) {}
            10i64
    }
    return
}
