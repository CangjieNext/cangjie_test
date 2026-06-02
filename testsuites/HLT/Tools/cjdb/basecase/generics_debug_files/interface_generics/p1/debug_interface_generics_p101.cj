/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package p1

public interface I1<T> {
    func foo1(a:T): Int64 {
        return 1
    }
}

public interface I2<U> <: I1<U> {
    func foo2(a:U): Int64 {
        return 2
    }
}

public interface I3<T1,T2> {
    func foo3(a: T1): Int64 
    func foo1(a:T1): Int64
    {
        return 1
    }
}

public open class C1<T> <:I1<T> & I2<T> { 
    public var width: T
    public var length: T
    
    public init (width: T, length: T) {
        this.width = width
        this.length = length
    }

    public open func foo1(a:T): Int64 {
        print("I am in class C1: foo1.\n")
        return 4
    }
    public func foo2(a:T): Int64 {
        print("I am in class C1: foo2.\n")
        return 5
    } 
}

public class CHC1<T> <: C1<T> & I3<T,T> {
    public init (a: T) {
        super(a,a)
    }
    public override func foo1(a: T): Int64 {
        super.foo1(a)
        print("I am in class CHC1: foo1.\n")
        return 6
    }

    public func foo3(a:T): Int64 {
        print("I am in class CHC1: foo3.\n")
        return 7
    } 

}

public enum TimeUnit1<T> <: I1<T> {
    Year(T) | Month(T)
    public func foo1(a:T): Int64 {
        return 8
    }
}

public struct R1<T> <: I1<T> {
    // 成员变量
    public var width: T
    public var length: T

    public init (width: T, length: T) {
        this.width = width
        this.length = length
    }

    public func foo1(a:T): Int64 {
        return 1
    }

}








