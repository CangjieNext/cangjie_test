internal import p1.*
interface I1 {}
interface I2<T> {}
main() {}

extend A <: I1 {}

extend B <: I2<B> {}

extend C {}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
