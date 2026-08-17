// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DT point#2 skip-policy branch2: interface non-static function.
// ShouldSkipAbstractFuncResolution returns true when ty.IsInterface() and fd is not STATIC.
// i.e. when the call target is a non-static (instance) function of the interface itself,
// the call target does not need to be rearranged to an implementation version -- interface
// dispatch is handled by vtable, the rearranger skips. This case calls an interface instance
// method and asserts the interface default implementation is used.
// EXEC: %compiler %cmp_opt %enableO2 %f -o %output
// EXEC: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan iface default
// ASSERT: scan-not rearranged

interface I1<T> {
    func foo(a: T) {
        println("iface default")
    }
}

class C <: I1<Int64> {}

func callViaInterface<T, U>(x: T, a: U) where T <: I1<U> {
    x.foo(a)
}

main() {
    callViaInterface(C(), 1)
    0
}
