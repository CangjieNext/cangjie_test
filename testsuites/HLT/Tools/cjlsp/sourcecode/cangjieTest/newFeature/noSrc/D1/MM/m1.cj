/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

macro package AAA 

import std.ast.*

public macro A(input:Tokens){
    input
}

public macro B(input:Tokens){
    return quote($input)
}

public macro X(input1:Tokens){
    return input1
}


public macro D(attr:Tokens, input:Tokens){
    input
}
