// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Dependency of unresolved.cj: the macro package whose target does not exist.
// Compiling this file with %cmp_macro passes (the target is only resolved
// lazily), the diagnostic fires when a consumer expansion injects the import.

macro package m

import std.ast.*

macro import no_such_pkg

public macro Dummy(input: Tokens): Tokens {
    input
}
