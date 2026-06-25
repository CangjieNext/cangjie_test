// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %cmp_opt %compile_lib_opt %f -o %output

public func foldx<T, R>(initial: R, operation: (R, T) -> R): (T) -> R {
    return {it: T => initial}
}

public func g(b: Bool): String {
    return "text"
}

public func splitSlow(): Unit {
    let f = g ~> foldx(false) {
        state, e => true
    }
}