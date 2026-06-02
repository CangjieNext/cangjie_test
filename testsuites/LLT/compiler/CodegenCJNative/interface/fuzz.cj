// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-1: %compiler %f 2>&1

interface C<T> {}
class A<T> {}
extend class A<T> <: C<T> {}

func m() : C<int64> {
    A<int64>()
}
main() {
    var a : C<int64> = A<int64>()
    return 0
}