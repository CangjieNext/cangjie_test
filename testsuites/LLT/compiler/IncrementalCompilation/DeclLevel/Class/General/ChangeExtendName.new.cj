main(): Unit {}

class A {}
class B {}
interface IA {}
interface IB {}
interface IC {}

extend A <: IC {}
extend A <: IB {}
extend B <: IC & IA {}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
