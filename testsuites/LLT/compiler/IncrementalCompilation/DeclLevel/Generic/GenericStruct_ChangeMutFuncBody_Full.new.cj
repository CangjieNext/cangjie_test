struct A<T> {
    mut func foo<U>(): Int64 { 3 }
}
main(): Int64 {
    var a = A<Int32>()
    return a.foo<(Int8, UInt64)>()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
