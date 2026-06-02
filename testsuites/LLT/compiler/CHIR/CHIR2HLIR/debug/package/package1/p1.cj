// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package p1

public class C1<T> {
    public var width: T
    public var length: T
    public init(side: T) {
        this(side, side)
    }
    public init(par_1: T, par_2: T) {
        this.width = par_1
        this.length = par_2
    }

    public func fun_c1(par_1: T) {
        var par_c1 = C1<UInt16>(200).length
        let par_return = par_1
        return par_return
    }

    public static func fun_cs1(par_1: T) {
        let par_return = par_1
        return par_return
    }

    public static func fun_cs1(par_1: T, par_2: T): C1<T> {
        var res = C1<T>(par_1, par_2)
        return res
    }
}

public func test1() {
    return 0
}
