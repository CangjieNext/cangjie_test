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
        return 11
    }
}

enum S2 {
    | Red | Green | Blue(UInt8)
}

public enum S3 {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 11
    }
}

private enum S4 {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 11
    }
}

internal enum S5 {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 11
    }
}

enum S6 {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 11
    }
}

protected enum S7 {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 11
    }
}

public enum S8 {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 11
    }
}

enum S9 {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 11
    }
}

enum S10 {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 11
    }
}
