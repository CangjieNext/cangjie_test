// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: %n.info
// EXEC: %compiler %f -o %output %enableO2 %dumpCHIRDebug
// RUN-EXEC-PIPE: %run %run_opt %output %run_args
// (Linux and CJNATIVE and DEBUG_OPTION) EXEC: sed -n -r '/\[internal\] \[noReflectInfo\] \[noInline\] Func @_CN7default6<main>Hv\(\)/,/^}$/p' devirt_CHIR/*_Devirtualization.chir | compare %n.info

open class A {
    public open func foo<T>(a: T) where T <: ToString {
        return a.toString()
    }
    public open func bar<T>(a: T) where T <: ToString {
        let k = a.toString()
        return k.size.toString() + k
    }
}

open class B <: A {
    public open override func foo<T>(a: T) where T <: ToString {
        return a.toString() + a.toString()
    }
}

main() {
    let a: A = B()
    println(a.foo(Int32(3)))
    println(a.bar("我们的路"))
    0
}

/* SCAN
33
12我们的路
*/
