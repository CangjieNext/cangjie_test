// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %frontendCompiler %typecheck %cmp_opt %f -o %output 2>&1 | compare %f

macro package view

internal import std.ast.*

class Data <: ToTokens {
    public func toTokens(): Tokens {
        return quote(123)
    }

    public func getThis(): Data {
        return this
    }
}

public macro test(input: Tokens): Tokens {
    let data = Data()
    return quote($data) + quote($(data.getThis()))
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
