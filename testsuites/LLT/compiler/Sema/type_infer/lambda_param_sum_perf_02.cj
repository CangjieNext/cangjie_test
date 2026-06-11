// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC:%frontendCompiler %typecheck %cmp_opt -Woff all %f
// TIMEOUT: 30

// Self-contained performance guard for issue #927 (no stdlib import needed).
// A user-defined generic type whose subscript operator's return type V is not
// determined by its parameters is enough to trigger the blowup (~8s before the
// fix): once MyMap<K, V> enters the lambda param's sum constraint, the free
// placeholder for V keeps all dependent constraints unsolvable. Changing the
// return type to K (v7 experiment) restores normal compile time, which pins
// the root cause to the under-determined type argument.

public class MyMap<K, V> {
    public operator func [](key: K): V {
        throw Exception("stub")
    }
}

public func foldx<T, R>(initial: R, operation: (R, T) -> R) : (T) -> R {
    return { it: T => return initial }
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
