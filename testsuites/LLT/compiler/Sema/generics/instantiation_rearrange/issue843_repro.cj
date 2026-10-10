// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DT point#6 / spec#11 issue #843 GetInstantiatedTarget empty-fallback repro.
// Cross-interface inheritance: I1<T> declares a default instance method, I2<T> <: I1<T>
// overrides it, and class A implements both I1<A0> and I2<B0> (same generic interface family
// instantiated with different type arguments).
// The original issue #843 manifested as GetInstantiatedTarget empty-falling-back to the
// un-instantiated target on cross-interface inheritance with mixed type-arg instantiation,
// causing a link-time "undefined symbol". After the fix it should rearrange to the correct
// instantiated version. This case asserts the instance method is called correctly and no
// "undefined symbol" appears (the B0 argument routes to the I2<B0> version, output "inst in I2").
// EXEC: %compiler %cmp_opt %enableO2 %f -o %output
// EXEC: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan inst in I2
// ASSERT: scan-not inst in I1

class A0 {}
class B0 {}

interface I1<T1> {
    func func1(t: T1) {
        println("inst in I1")
    }
}

interface I2<T2> <: I1<T2> {
    func func1(t: T2): Unit {
        println("inst in I2")
    }
}

// Implement both I1<A0> and I2<B0>: cross-interface inheritance + different type-arg instantiation.
class A <: I1<A0> & I2<B0> {}

main() {
    let a = A()
    let b0 = B0()
    a.func1(b0)       // instance call, B0 routes to the I2<B0> version
    0
}
