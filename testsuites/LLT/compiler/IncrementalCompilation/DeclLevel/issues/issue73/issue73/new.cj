internal import std.ast.* 


main() { 
    
    var input: Tokens = quote(
    var(a, b):(Int32, Rune) = a = b 
    ) 
    
    let expr = parseDecl(input) 
    if(!(expr is VarDecl)) { 
        return 0 
    } 
    return 1 
} 

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
