// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Positive: after instantiating Holder<S>::run, CastToConcrete(&S -> I&) becomes
// Load + Box (two exprs). Old code only moved Box, leaving Load after the terminator.
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CIN7default6HolderIG_E3runHv\$RN7default1SE" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan GetElementRef(
// ASSERT: scan Load(
// ASSERT: scan Box(
// ASSERT: scan-not Invoke(Generic-

interface I {
    mut func bump(): Int64
}

struct S <: I {
    var n: Int64 = 1
    public mut func bump(): Int64 {
        n = n + 1
        n
    }
}

interface Runner {
    func run(): Int64
}

class Holder<T> <: Runner where T <: I {
    var x: T
    init(x: T) {
        this.x = x
    }
    public func run(): Int64 {
        x.bump()
    }
}

func use(): Int64 {
    var r: Runner = Holder(S())
    try {
        r.run()
    } catch (_: Exception) {
        0
    }
}

main() {
    use() - 2
}
