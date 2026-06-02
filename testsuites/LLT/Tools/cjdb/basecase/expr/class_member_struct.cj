// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

public struct Arraya<T> {
    let value: T
    public init(v: T) {
        this.value = v
    }
}

class AA {
    var arr = Arraya<Int8>(1)
    var arr2 = Arraya<Int32>(3)
    var range = 0..10 : 1
}

var arr = Arraya<Int8>(1)
main() {
    var aa = AA()
    aa.arr
    0
}
