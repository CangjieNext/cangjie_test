// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "WHOLE" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(Class-_CN7default1AE&->@_CN7default1A3fooHv
// ASSERT: scan-not Invoke(Class-_CN7default1AE&->@_CN7default1A3fooHv

interface I {
    func foo(): Int64 {
        1
    }
}

open class A <: I {
    public override func foo(): Int64 {
        return 1
    }
}

let global_a = A();

func f(): I {
    var aa: I = global_a
    aa.foo()
    return global_a
}

main() {
    f().foo() - 1
}
