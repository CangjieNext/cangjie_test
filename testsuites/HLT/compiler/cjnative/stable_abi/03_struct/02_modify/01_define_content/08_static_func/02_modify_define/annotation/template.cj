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

    @OverflowThrowing
    static public func geta1() {
        return 0
    }

    static public func geta2() {
        return 0
    }

    static public func geta3() {
        return 0
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

