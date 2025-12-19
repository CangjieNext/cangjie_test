// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %enableDevirtualization --no-sub-pkg -Woff all %f -o %n.%suffix 2>&1 | compare %f
// (DEBUG_OPTION)EXEC-PIPE-0: %run %run_opt %output %run_args
// ASSERT: scan-not [Devirtualization] The function call to foo at [31,5] was optimized.

open class Tokens {
    public func add(r:Tokens): Tokens {
        return ConcatTokens()
    }
    public open func foo(): Unit {
    }
}

class ConcatTokens <: Tokens {
    public func foo(): Unit {
    }
}

var x = 3

main() {
    var a = Tokens()
    if (x == 3) {
        a = a.add(Tokens())
    }
    a.foo()
    return 0;
}