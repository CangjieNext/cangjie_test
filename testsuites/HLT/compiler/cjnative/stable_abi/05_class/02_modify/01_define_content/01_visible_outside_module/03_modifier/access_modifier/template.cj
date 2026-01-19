/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test class: access modifier

public class A {}
class B {}
protected class C {}
internal class D {}
private class E {}

public func checker(): Int64 {
    A()
    B()
    C()
    D()
    E()
    0
}