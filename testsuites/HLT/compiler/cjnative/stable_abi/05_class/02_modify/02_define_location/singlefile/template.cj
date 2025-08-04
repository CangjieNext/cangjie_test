/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test class: class order
public open class Father {}

public open class Son <: Father {}

public class GrandSon <: Son {}

public open class GFather<T> {}

public open class GSon<T> <: GFather<T> {}

public class GGrandSon<T> <: GSon<T> {}

public class C1 {}

protected class C2 {}

internal class C3 {}

class C4 {}

private class C5 {}

public class GC1<T> {}

protected class GC2<T> {}

internal class GC3<T> {}

class GC4<T> {}

private class GC5<T> {}
