macro package mac 
import std.ast.*

public macro myself(a: Tokens): Tokens {
    return a 
}

public macro myself(attr: Tokens, a: Tokens): Tokens {
    let _ = attr 
    return a
}

// ASSERT: scan added myself 3mac6myselfM6Tokens6Tokens at 8,14
// ASSERT: scan incremental compilation triggered


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
