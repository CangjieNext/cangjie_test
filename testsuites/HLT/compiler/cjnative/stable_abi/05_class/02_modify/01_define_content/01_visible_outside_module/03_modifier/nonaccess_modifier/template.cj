/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test class: open/sealed/abstract modifier

public class A {}

open public class B {}

public abstract class C0 {}

sealed abstract public class D0 {}

public class C <: C0 {}

public class D <: D0 {}

sealed abstract class E0 {}

public class E <: E0 {}

open public class F0 {}

class F <: F0 {}

open class G0 {}

public class G <: G0 {}

open abstract public class H0 {}

class H <: H0 {}

open abstract class I0 {}

public class I <: I0 {}

public func checker(): Int64 {
    A()
    B()
    C()
    D()
    E()
    F0()
    F()
    G0()
    G()
    H()
    I()
    0
}