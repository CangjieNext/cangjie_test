// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

open class Base {}
class Derived <: Base {}
enum E1 {
    | A1(Base)
}
enum E2 {
    | A1(Derived)
}
