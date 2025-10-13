/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test class: open/sealed modifier

public class A {}

public open class B {}

public abstract class C0 {}

public abstract sealed class D0 {}

public class C <: C0 {}

public class D <: D0 {}
