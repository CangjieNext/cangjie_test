/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %use_ast %f -o %output

import std.ast.*

open class I{
    public var a: String = 'a'
}

class A <: I{
    public func test(){
        var x = quote($super.a) 
        x.dump()
    }
}
/*
append Rune with ToTokens {
    func toTokens(self:Rune) {
        return quote(1)
    }
}
*/

main(){
    A().test()
    return 0
}
// ASSERT: scan lex_expected_identifier_after_dollar
