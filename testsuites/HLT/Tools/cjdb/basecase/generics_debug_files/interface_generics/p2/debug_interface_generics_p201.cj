/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package p2
import p1.*

public class C202_1<T> <: C1<T>{
    public init (a: T) {
        super(a,a)
    }
}

public interface I201<T1,T2> <: I3<T1,T2>{
    func foo4(a: T1): Int64 
}

public class C201_1<T> <: C1<T> & I201<T,T> {

    public init (a: T) {
        super(a,a)
    }

    public override func foo1(a:T): Int64 {
        print("I am in class C201_1: foo1.\n")
        return 11
    }

    public func foo3(a:T): Int64 {
        print("I am in class C201_1: foo3.\n")
        return 12
    }

    public func foo4(a:T): Int64 {
        print("I am in class C201_1: foo4.\n")
        return 13
    }

}

