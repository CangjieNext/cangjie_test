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

class A{
    public func test(){
        var x = quote($this) 
        x.dump()
    }
}

append A with ToTokens {
    func toTokens(self:A) {
        return quote(1)
    }
}

main(){
    A().test()
    return 0
}
// ASSERT: scan lex_expected_identifier_after_dollar
