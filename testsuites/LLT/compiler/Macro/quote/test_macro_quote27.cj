// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_macro %noColor %f
// ASSERT: scan invalid expression after the operator '$'
// ASSERT: scan expected '(', found 'true'
// ASSERT: scan unclosed delimiter: '{'
// ASSERT: scan expected '{', found ')'
// ASSERT: scan invalid expression after the operator '$'
// ASSERT: scan expected '(', found 'true'
// ASSERT: scan unclosed delimiter: '{'
// ASSERT: scan expected '{', found ')'

macro package define

internal import append_20104.*
internal import std.ast.*


public macro test(input:Tokens):Tokens{
    var x = quote($(while true{return quote(0)))  
    var y = quote($(while true{return quote(0)))  

    if (x.size == 1) {
        return quote(1)
    }
    if (x.get(0).value != y.get(0).value) {
            return quote(2)
    }

    return quote(3)
}


