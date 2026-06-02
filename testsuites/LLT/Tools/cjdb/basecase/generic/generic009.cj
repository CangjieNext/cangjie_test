// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

func foo<T>(para: T) {
    var a: T = para
    a
}
main() {
    var un = ()
    var unitf = foo<Unit>(un)
    0
}
