/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkga

public var ext: Int32 = 1

public open class Base {
    protected var base_a1: Int32 = 0
    protected var a2: Int32 = 0
    private let b1: Int32 = 0
    private let b2: Int32 = 0
    public init(x: Int32) {
        a2 = x
    }
}

public class Data <: Base {
    public var a1: Int32 = 10
    public let b1: Int32 = 10
    public var m: Int32 = 1
    public static var n: Int32 = 1
    protected var p: Int32 = 1
    public init(x: Int32) {
        super(x) // Data(1),super.a2 = 1
        this.a1++
        this.a2++
        super.base_a1++
        super.a2++;
        Data.n++;
        n++
        print("this.a1:" + "${a1}" + "\n")
        print("this.a2:" + "${a2}" + "\n")
        print("super.base_a1:" + "${super.base_a1}" + "\n")
        print("super.a2:" + "${super.a2}" + "\n")
        print("n:" + "${n}" + "\n")
        m = this.a1 + this.a2 + super.base_a1 + super.a2 // 11 + 3 + 1 + 3 = 18
    }
    public func get(): Int32 {
        this.a1++
        super.base_a1++
        Data.n++;
        n++;
        var res = this.a1 + this.a2 + super.base_a1 + m + n // 12 + 3 + 2 + 18 + 5 = 40
        return res
    }
}
