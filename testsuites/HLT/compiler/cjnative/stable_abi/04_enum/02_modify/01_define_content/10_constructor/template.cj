/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan Compatible!

package test_stable_abi

public enum RGBColor {
    | Red | Green | Blue(UInt8)

    public static func printType() {
        print("RGBColor")
    }
}

enum Testb {
    | Red | Green | Blue(UInt8)

    public static func printType() {
        print("RGBColor")
    }
}

public enum Testc {
    | Red | Green | Blue(UInt8)
    
    public static func printType() {
        print("RGBColor")
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


public enum SS7 {
    | Red | Green | Blue | ...

    public func getX(): Int64 {
        return 11
    }
}

enum SS8 {
    | Red | Green | Blue | ...

    public func getX(): Int64 {
        return 11
    }
}

enum SS9 {
    | Red | Green | Blue | ...

    public func getX(): Int64 {
        return 11
    }
}

public class CC1 {
    let v1 = SS8.Red

    const init() {
        let v3 = 0
    }

    public const func f1() {
        let v2 = SS9.Green
    }
}


