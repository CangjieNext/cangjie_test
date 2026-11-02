// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ALL form: 'macro import pa.*' shall inject a plain `import pa` into the
// expanded code of consumers, making every public symbol of pa visible.

macro package m

import std.ast.*

macro import pa.*

public macro Dummy(input: Tokens): Tokens {
    input
}
