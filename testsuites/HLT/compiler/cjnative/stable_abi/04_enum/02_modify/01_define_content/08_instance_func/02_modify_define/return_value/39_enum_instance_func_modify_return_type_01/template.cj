/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n

package test_stable_abi


public interface I {
    func f(): Int64
}

public interface Addable <: I {
    func add(other: Int64): Int64
}

public open class Subtractable <: Addable {

    public open func add(other: Int64): Int64 {
        return 0
    }

    public open func sub(other: Int64): Int64 {
        return 0
    }

    public open func f(): Int64 {
        return 0
    }
}

public class MyInt <: Subtractable {
    var value = 0
    public func add(other: Int64): Int64 {
        value + other
    }
    public func sub(other: Int64): Int64 {
        value - other
    }

    public func f(): Int64 {
        return 0
    }
}

public enum Rectangle {
    | Red | Green | Blue(UInt8)

    public func getWidth(): Int64{
        return 11
    }

    public func geta(): I {
        let a1: I = Subtractable()
        return a1
    }

    public func getb(): I {
        let a2: I = Subtractable()
        return a2
    }

    public func getc(): Addable {
        let a3: Addable = Subtractable()
        return a3
    }

    public func getd(): Subtractable {
        let a4 = Subtractable()
        return a4
    }

    public func gete(): Subtractable {
        let a5 = Subtractable()
        return a5
    }

    public func getf(): ToString {
        return "hello"
    }

    func getg(): ToString {
        return "hello"
    }

    @Frozen
    public func geth() {
        return getg()
    }

    func geti(): ToString {
        return "hello"
    }

    const func getj(): ToString {
        return "hello"
    }

    public const func getk() {
        return getj()
    }

    public func geta1(): Int16 {
        return 1
    }

    func geta2(): Int16 {
        return 1
    }

    @Frozen
    public func geta3() {
        return geta2()
    }

    const func geta4(): Int16 {
        return 1
    }

    public const func geta5() {
        return geta4()
    }

    func geta6(): Int16 {
        return 1
    }
}

