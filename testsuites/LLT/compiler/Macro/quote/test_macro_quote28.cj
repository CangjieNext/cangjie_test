// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_macro %noColor %f 
// ASSERT: scan the type 'Class-Data' should implement interface 'ToTokens' in the 'ast' package

macro package define

internal import std.ast.*

class Data {
    public func toTokens(): Tokens {
        return quote(123)
    }
}

public macro test(input: Tokens): Tokens {
    let data = Data()
    let ret = quote($data)
    return ret
}


