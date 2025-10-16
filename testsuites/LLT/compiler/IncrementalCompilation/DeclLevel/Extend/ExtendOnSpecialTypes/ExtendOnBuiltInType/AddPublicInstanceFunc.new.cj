interface I {
    func f() {0}
}

extend<T> CPointer<T> {
    public func f() {1}
}

extend<T> CPointer<T> <: I {}

main() {
    let x = CPointer<Int64>()
    x.f()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
