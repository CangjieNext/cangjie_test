/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

interface I1<T> {
    func fi1(): Int64 {
        return 1
    }
}

open class C1<T> <: I1<T> {
    public func fc1(): Int64 {
        var y: Int64 = fi1()
        return y
    }
}

main() {
    var data1 = C1<Int64>().fc1()
    return 0
}
