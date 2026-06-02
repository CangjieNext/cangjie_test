/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define_30026.cj main_30026.cj
// EXEC: %compiler define_30026.cj %macro_opt -o define_30026.%test_suffix
// ERRCHECK: %compiler %f %macro_opt -o use.%test_suffix

// ASSERT: scan cannot use 'public' on var declarations in a macro package



macro package use

import std.ast.*


var flag = 1
var count = 1

public macro X(attr:Tokens, input:Tokens):Tokens{
    if (flag != 0){
        print("first is ${flag}\n")
        flag = flag - 1
        return quote(@X[0](1))
    } else{
        print("count is ${count}\n")
        count = count + 1
        input.dump()
        print("second is ${flag}\n")
        return quote(@B[0](1))
    }
}

public var x: Tokens = quote(@X[0](0))

public func test(){
    var a = quote(@X[0](0))
    a.dump()
}
