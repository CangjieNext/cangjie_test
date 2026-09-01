// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(Class-_CN7defaultU00000001SNF523CA1E&->@_CN7defaultU00000001SNF523CA11aHv

private open class I {
    public open func a(): Int64 {
        0
    }
}

private open class CA1 <: I {
    public open func a(): Int64 {
        1
    }
}

private open class CA2 <: I {
    public open func a(): Int64 {
        0
    }
}

private func test(): I {
    return CA1()
}

main() {
    test().a() - 1
}
