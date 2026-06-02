// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

open class A {
    var a = 1
}

class B <: A {
    var b = 2
}


func foo<T>(para: T) {
    return 0
}

main() {
    foo<B>(B())
    0
}
