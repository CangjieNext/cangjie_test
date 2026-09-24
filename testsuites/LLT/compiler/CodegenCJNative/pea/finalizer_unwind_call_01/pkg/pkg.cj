// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg

// Cross-package throw: the caller sees only a declaration, so this cannot
// be inlined into work() (inlining would put throw+unreachable in the CFG
// and PEA would reject without exercising the call-unwind leak).
public var shouldThrow = false

public func riskyUse(h: Int64, x: Int64): Int64 {
    if (shouldThrow) {
        throw Exception("boom")
    }
    return x + h
}
