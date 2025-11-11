/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan Compatible!

package test_stable_abi


open class Base {}
public class c1 <: Base {}

interface I {
    func f(): Base
}

interface Addable {
    func add(other: Int64): Int64 {
        return 0
    }
}

interface Subtractable {
    func sub(other: Int64): Int64 {
        return 0
    }
}

public enum MyInt <: Addable & Subtractable {
    | Red | Green | Blue(UInt8)
    public func add(other: Int64): Int64 {
        10 + other
    }
    public func sub(other: Int64): Int64 {
        10 - other
    }

}

public enum S7 <: Addable {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 11
    }
}

enum S8 <: Addable {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 11
    }
}

enum S9 <: Addable {
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



