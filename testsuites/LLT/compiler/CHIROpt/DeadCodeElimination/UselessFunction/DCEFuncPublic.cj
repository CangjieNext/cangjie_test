// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %dumpCHIRDebug -Woff unused %n.cj
// EXEC: %python pick_defination.py "default_CHIR/[0-9]*_UselessFuncElimination.chirtxt" WHOLE | compare %f
// RUN-EXEC-PIPE-0: %run main
// Unused public foo methods deleted; goo is used (may be inlined).
// ASSERT: scan srcCodeIdentifier: main
// ASSERT: scan-not srcCodeIdentifier: foo

public func goo(): Unit {
    print("2")
}

public func foo(): Unit {
    print("1")
}

public open class CA {
    public func foo(): Unit {
        print("a")
    }
}

public class CB {
    public func foo(): Unit {
        print("b")
    }
}

main() {
    goo()
    0
}
