/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan Compatible!

package test_stable_abi

public struct S1 {
    let x: Int64 = 0

    public func getX(): Int64 {
        return x
    }
}

struct S2 {
    let x: Int64 = 0

    public func getX(): Int64 {
        return x
    }
}


private struct S4 {
    let x: Int64 = 0

    public func getX(): Int64 {
        return x
    }
}

internal struct S5 {
    let x: Int64 = 0

    public func getX(): Int64 {
        return x
    }
}

struct S6 {
    let x: Int64 = 0

    public func getX(): Int64 {
        return x
    }
}

protected struct S7 {
    let x: Int64 = 0

    public func getX(): Int64 {
        return x
    }
}

public struct S8 {
    let x: Int64 = 0

    public func getX(): Int64 {
        return x
    }
}

struct S9 {
    let x: Int64 = 0

    public func getX(): Int64 {
        return x
    }
}


public func f(){
    var a = S2().getX() + S4().getX() + S5().getX() + S7().getX() + S6().getX() + S9().getX()
    return a
}