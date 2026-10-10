// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization --no-sub-pkg %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan-not Apply(Class-_CN7default12ConcatTokensE&->@_CN7default12ConcatTokens3fooHv
// ASSERT: scan Invoke(Class-_CN7default6TokensE&->@_CN7default6Tokens3fooHv

open class Tokens {
    public func add(r:Tokens): Tokens {
        return ConcatTokens()
    }
    public open func foo(): Int64 {
        1
    }
}

class ConcatTokens <: Tokens {
    public func foo(): Int64 {
        2
    }
}

var x = 3

main() {
    var a = Tokens()
    if (x == 3) {
        a = a.add(Tokens())
    }
    // Negative: stays Invoke on Tokens; runtime is ConcatTokens.foo => 2
    a.foo() - 2
}
