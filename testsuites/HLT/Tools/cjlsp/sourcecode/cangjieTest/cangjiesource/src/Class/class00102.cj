/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Class

// 类名高亮
open class A1 {}
open class B1 <: A1 {}
open class C1 <: B1 {}
open class D1 <: C1 {}
open class E1 <: D1 {}
open class F1 <: E1 {}

class Data2 <: F1 {}

var bb = Data2()
