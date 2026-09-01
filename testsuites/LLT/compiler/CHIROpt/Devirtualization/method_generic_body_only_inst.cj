// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Positive: I::compute<T> only uses T in body; after exact C cast, Apply must keep
// Wrapper.run's U as inst type arg, and frozen compute uses Option<Int64> not leaked U.
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization --fno-chir-function-inlining %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default7Wrapper3runIG_Hv<Generic-_CN7default7Wrapper3runIG_HvE1UE>" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(Class-_CN7default1CE&->@_CN7default1C7computeIG_Hv<Generic-_CN7default7Wrapper3runIG_HvE1UE>
// ASSERT: scan-not Invoke(Class-_CN7default1IE&->@_CN7default1I7computeIG_Hv

interface I {
    func compute<T>(): Int64
}

class C <: I {
    public func compute<T>(): Int64 {
        let x: Option<T> = Option<T>.None
        match (x) {
            case None => return 0
            case Some(_) => return 1
        }
    }
}

public open class Wrapper {
    public open func run<U>(): Int64 {
        let obj: I = C()
        return obj.compute<U>()
    }
}

main() {
    let w: Wrapper = Wrapper()
    w.run<Int64>() - 0
}
