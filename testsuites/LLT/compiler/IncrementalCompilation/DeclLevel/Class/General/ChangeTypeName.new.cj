main(): Unit {}
public struct B1 {}
class B2 {}
enum B3 { A|B(Int32) }
interface B4 {}
extend B3 <: B4 {}
extend B3 {}
type B5 = Int32

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
