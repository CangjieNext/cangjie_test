interface IA {}

interface IB {}

class N <: IA & IB {

}
func foo<T>(): Int64 where T <: IA { 0 }
main(): Int64 { foo<N>() }

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
