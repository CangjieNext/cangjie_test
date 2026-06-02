/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test extend: generic constraints
open public class Father {}

public class Son <: Father {}
public class Son1 <: Father {}

public class Generics_C<T, U> {
}

extend<T, U> Generics_C<T, U> where U <: Son {
    public func foo1() {1}
}

public struct Generics_S<T, U> {}

extend<T, U> Generics_S<T, U> where T <: Father, U <: Son {
    public func foo2() {2}
}


