/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// ASSERT: scan Compatible!

package test_stable_abi

public enum Rectangle {
    | Red | Green | Blue(UInt8)

    public func getWidth(): Int64 {
        return 11
    }

    static prop geta: Int64 {
        get() {
            0
        }
    }
}

public enum Rectangle1 {
    AB

    public static prop geta: Int64 {
        get() {
            1
        }
    }

    public static prop getb: Int64 {
        get() {
            1
        }
    }

    @Frozen
    public func f1() {
        getb
    }
}
