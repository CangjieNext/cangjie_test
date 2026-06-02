// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg

public func getBoolArray(): Array<Bool> {
    let res = Array<Bool>(5, repeat: false)
    return res
}

public func getString2dArray(): Array<Array<String>> {
    let res = Array<Array<String>>(2, {i => Array<String>()})
    return res
}

public func walkIteratorS(obj: Iterable<Array<String>>): Int64 {
    var i = 0
    for (v in obj) {
        i++
    }
    if (i != 2) {
        return 1
    }
    return 0
}

public func walkIteratorB(obj: Iterable<Bool>): Int64 {
    var i = 0
    for (v in obj) {
        i++
    }
    if (i != 5) {
        return 1
    }
    0
}
