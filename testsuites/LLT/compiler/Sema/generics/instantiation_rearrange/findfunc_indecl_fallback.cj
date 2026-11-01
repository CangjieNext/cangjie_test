// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DT whitebox#19 FindFuncInGenericInstantiatedDecl no-match fallback.
// FindFuncInGenericInstantiatedDecl iterates instantiated outerDecls; if no matching
// instantiated version is found it falls back to the original implFunc (L735/747).
// This case: the interface generic method has a non-generic instance implementation in the
// subclass, and there is no dedicated version for the "matched instantiation type", so the
// iteration falls back to the original implFunc. Asserts the fallback implementation is
// correctly called (outputs "fallback impl").
// EXEC: %compiler %cmp_opt %enableO2 %f -o %output
// EXEC: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan fallback impl
// ASSERT: scan-not iface default

interface I1<T> {
    func foo(x: T) {
        println("iface default")
    }
}

// The subclass provides an instance (non-generic) implementation, with no separately
// instantiated version per T, so FindFuncInGenericInstantiatedDecl falls back to this implFunc.
class C <: I1<Int64> {
    public func foo(x: Int64) {
        println("fallback impl")
    }
}

func dispatch<T, U>(x: T, a: U) where T <: I1<U> {
    x.foo(a)
}

main() {
    dispatch(C(), 1)
    0
}
