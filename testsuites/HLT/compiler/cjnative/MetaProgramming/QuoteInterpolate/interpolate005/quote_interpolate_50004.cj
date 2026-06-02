/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// RUN-EXEC: %run %run_opt %output  %run_macro_opt %run_macro_opt %run_args

import std.ast.*

open class I {
    public var a: String = 'a'
}

class A <: I {
    public func test() {
        super.a
        var x = quote($(super.a))
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
main() {
    A().test()
    return 0
}
