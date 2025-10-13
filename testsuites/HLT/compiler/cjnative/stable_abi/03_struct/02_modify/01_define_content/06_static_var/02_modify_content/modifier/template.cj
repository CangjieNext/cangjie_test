/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// ASSERT: scan Compatible!

package test_stable_abi

public struct Rectangle {
    static let width = 10
    public static let a1 = 20
    static let a2 = 20
    public static let a3 = 20
    private static let a4 = 20
    internal static let a5 = 20
    static let a6 = 20
    protected static let a7 = 20
    public static let a8 = 20
    static let a9 = 20
    static let a10 = 20

    public func getWidth(): Int64 {
        return width
    }
}

public struct Rectangle1 {
    static let width = 10
    public static let a1 = 20
    public static let a2 = 20
    public static let a3 = 20

    public func getWidth(): Int64 {
        return width
    }
}

public struct Rectangle2 {
    static var width = 10
    public static var a1 = 20
    static var a2 = 20
    public static var a3 = 20
    private static var a4 = 20
    internal static var a5 = 20
    static var a6 = 20
    protected static var a7 = 20
    public static var a8 = 20
    static var a9 = 20
    static var a10 = 20

    public func getWidth(): Int64 {
        return width
    }
}

public struct Rectangle3 {
    static let width = 10
    static var a11 = 20

    static init() {
        let degree = 180
    }

    @Frozen
    public func getWidth(): Int64 {
        return a11
    }
}

public struct Rectangle4 {
    static let width = 10
    public static var a12 = 20

    public func getWidth(): Int64 {
        return width
    }
}

public struct Rectangle5 {
    static let width = 10
    static var a13 = 20

    static init() {
        let degree = 180
    }

    @Frozen
    public func getWidth(): Int64 {
        return a13
    }
}

public struct Rectangle6 {
    static let width = 10
    public static const a14 = 20

    public func getWidth(): Int64 {
        return width
    }
}

public struct Rectangle7 {
    static let width = 10
    static const a15 = 20

    static init() {
        let degree = 180
    }

    @Frozen
    public func getWidth(): Int64 {
        return a15
    }
}

public struct Rectangle8 {
    static let width = 10
    public static const a16 = 20

    public func getWidth(): Int64 {
        return width
    }
}

public struct Rectangle9 {
    static let width = 10
    static const a17 = 20

    static init() {
        let degree = 180
    }

    @Frozen
    public func getWidth(): Int64 {
        return a17
    }
}

public struct Rectangle10 {
    static let width = 10
    public static let a20 = 20

    public func getWidth(): Int64 {
        return width
    }
}

public struct Rectangle11 {
    static let width = 10
    static var a21 = 20

    static init() {
        let degree = 180
    }

    @Frozen
    public func getWidth(): Int64 {
        return a21
    }
}
