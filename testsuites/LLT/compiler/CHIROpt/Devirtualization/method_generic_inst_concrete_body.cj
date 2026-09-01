// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Positive: frozen C::compute after Instantiation for String uses Option<String>,
// not Option<Generic-Wrapper.run.V> leaked from the caller method generic.
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization --fno-chir-function-inlining %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CIN7default1C7computeIG_Hv\$RNat6StringE" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Enum-_CNat6OptionIG_E<Struct-_CNat6StringE>
// ASSERT: scan-not Enum-_CNat6OptionIG_E<Generic-_CN7default7Wrapper3runIG_HvE1VE>
// ASSERT: scan-not Generic-_CN7default7Wrapper3runIG_HvE1VE

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
    public open func run<V>(): Int64 {
        let obj: I = C()
        return obj.compute<V>()
    }
}

main() {
    let w = Wrapper()
    w.run<String>() - 0
}
