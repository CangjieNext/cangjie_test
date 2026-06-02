// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_macro %noColor %f
// ASSERT: scan invalid expression after the operator '$'

macro package view
internal import std.ast.*

public macro test(input: Tokens):Tokens {
    quote($(return quote(0)))                       
    quote($(while (true) { quote(0) }))               
    quote($(do { quote(0) } while (true)))            
    let a = [0,1]
    quote($(for (a in arr) { quote(0) }))             
    quote($( throw IndexOutOfBoundsException() ))   
    quote($( try{ quote(0) } finally{quote(0)} ))

    input
}


