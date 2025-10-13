// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %cmp_macro %f

// EXEC: %run_macro %compiler %incrementalCompile %cmp_opt %compile_exe_opt %macro_lib %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args

// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC: %run_macro %compiler %cmp_opt %incrementalCompile %compile_exe_opt %macro_lib %n.old.cj -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args

// ASSERT: scan incremental compilation triggered

macro package A 

import std.ast.*

public macro M(input:Tokens):Tokens{
    return input
}

public macro N(input:Tokens):Tokens{
    var variableToken = input.get(1)
    var newVariableToken = Token(TokenKind.IDENTIFIER, "test" + variableToken.value)
    var resultTokens = input.get(0) + newVariableToken
    for(i in 2..input.size){
        resultTokens.append(input.get(i))
    }
    return resultTokens
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
