// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan macro import @When condition is only allowed per-item inside a `macro { ... }` block

// The single-form 'macro import' does not accept a leading @When condition;
// conditions are only allowed per item inside the block form.

macro package m

import std.ast.*

@When[os == "linux"] macro import pc

public macro Dummy(input: Tokens): Tokens {
    input
}
