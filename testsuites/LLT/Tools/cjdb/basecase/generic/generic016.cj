// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class CT<T> {
    var x: T
    var z: Int64
    init(y: T) {
        x = y
        z = 12
    }
}

func foo<T>(para: T) {
    var a: T = para
    let b = CT<T>(para)
    var c = CT<Int64>(50)
    a
}

main() {
    var a = foo<Int16>(52)
    0
}
