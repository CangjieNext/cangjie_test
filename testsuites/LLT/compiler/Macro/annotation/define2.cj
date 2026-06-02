// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_opt %cmp_macro define2.cj
// ASSERT: scan redefinition of declaration 'M'
// ASSERT: scan 'M' is previously declared here
// ASSERT: scan '@Annotation' modifying non-'public' class is invisible at runtime

macro package define

internal import std.ast.*

public macro M(input: Tokens) {
    quote($(parseDecl(input)))
}

@Annotation
class M {}
