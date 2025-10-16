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

@Deprecated["this enum is deprecated", strict: false]
enum S2 {
    | Red | Green | Blue(UInt8)
}


@Deprecated["this enum is deprecated", strict: false]
public enum S3 {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 10
    }
}

enum S4 {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 11
    }
}

@Deprecated["this enum is deprecated", strict: true]
public enum S5 {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 11
    }
}

@Deprecated["this enum is deprecated", strict: true]
enum S6 {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 11
    }
}

public enum S7 {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 11
    }
}

enum S8 {
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

public class C1 {
    let v1 = S8.Red

    const init() {
        let v3 = 0
    }

    public const func f1() {
        let v2 = S9.Green
    }
}

@Deprecated["this enum is deprecated", strict: false]
public enum S10 {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 11
    }
}

@Deprecated["this enum is deprecated", strict: false]
enum S11 {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 11
    }
}

@Deprecated["this enum is deprecated", strict: false]
enum S12 {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 11
    }
}

@Deprecated["this enum is deprecated", strict: false]
public class C2 {
    let v1 = S11.Red

    const init() {
        let v3 = 0
    }

    public const func f1() {
        let v2 = S12.Green
    }
}

