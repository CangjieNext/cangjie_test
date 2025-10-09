// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

open class A {
    let a = 1
}
class AA <: A {}

func foo(a: A) {
    a.a
}
func foo(a: AA) {
    a.a
}

main() {}