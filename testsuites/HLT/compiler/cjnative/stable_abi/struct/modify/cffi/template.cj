/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan Compatible!

package test_stable_abi

@C
public struct S1 {
    let x: Int64 = 0

    public func getX(): Int64 {
        return x
    }
}

struct S2 {
    let x: Int64 = 0
}


public struct S3 {
    let x: S2 = S2()

    public func getX(): Int64 {
        return x.x
    }
}

public struct S4 {
    let x: Int64 = 0

    public func getX(): Int64 {
        return x
    }
}

struct S5 {
    let x: Int64 = 0
}

public struct S6 {
    let x: S5 = S5()

    public func getX(): Int64 {
        return x.x
    }
}

@C
struct S7 {
    let x: Int64 = 0
}

@C
public struct S8 {
    let x: S7 = S7()

    public func getX(): Int64 {
        return x.x
    }
}

@C
struct S9 {
    let x: Int64 = 0
}

@C
public struct S10 {
    let x: S9 = S9()

    
    public func getX(): Int64 {
        return x.x
    }
}

