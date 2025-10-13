/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// ASSERT: scan Compatible!

package test_stable_abi

public enum S1 {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 10
    }

    @OverflowThrowing
    public static func geta1() {
        return 0
    }

    public static func geta2() {
        return 0
    }

    public static func geta3() {
        return 0
    }
}

enum S2 {
    | Red | Green | Blue(UInt8)
}

public enum S3 {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 10
    }
}
