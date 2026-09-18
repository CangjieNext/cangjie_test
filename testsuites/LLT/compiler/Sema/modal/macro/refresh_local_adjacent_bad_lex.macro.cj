// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package refresh_local_adjacent_bad_lex_macro

internal import std.ast.*

public macro EmitSpacedSuffix(_: Tokens): Tokens {
    cangjieLex(
        """
func badBang() {
    let x: Int64 @local ! = 0
}
func badTilde() {
    let y: Int64 @~ local = 0
}
main() {}
""")
}
