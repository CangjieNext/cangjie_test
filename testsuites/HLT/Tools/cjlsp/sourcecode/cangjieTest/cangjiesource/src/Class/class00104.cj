/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Class

// 类名高亮
class Baase3 {}

open class A3<T> {}
open class B3<T> <: A3<Baase3> {}
open class C3<T> <: B3<Baase3> {}
open class D3<T> <: C3<Baase3> {}
open class E3<T> <: D3<Baase3> {}
open class F3<T> <: E3<Baase3> {}

class Data4 <: F3<Int32> {}

var d1 = Data4()
