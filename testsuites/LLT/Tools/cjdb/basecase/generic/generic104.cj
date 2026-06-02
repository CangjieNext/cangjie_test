// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class CT<T> {
    var x: T
    init(y: T) {
        x = y
    }
}

func foo<T>(para: T) {
    var a: T = para
    let b = CT<T>(para)
    a
}

main() {
    var a = foo("abcd")
    0
}
