class A<T> {
    A(let v: T) {}
}
main(): Int64 {
    let a = A<Int32>(3)
    return Int64(a.v)
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
