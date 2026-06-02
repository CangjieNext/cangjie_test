/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg_struct


public  struct R1<T> {
    public var width: T
    public var length: T
    public init (side: T) {
        this(side, side)
    }
    public init (par_1: T, par_2: T) {
        this.width = par_1
        this.length = par_2
    }

    public func fun_r1(par_1:T) :T{
        var var_r1 = R1<UInt16>(200).length
        let par_return = par_1
        return par_return
    }

    public func fun_r1(par_1:T,par_2!:T):Unit{
        var par_r1 = R1(par_1,par_2).length
    }

    public static func fun_rs1(par_1:T):T{
        let par_return = par_1
        return par_return
    }
}

public struct R2<T1,T2> {
    public var num1: T1
    private var num2: T2
    public static var num11: Int8 = 10
    public init (pa_1: T1, pa_2: T2) {
        this.num1 = pa_1
        this.num2 = pa_2
    }

    public func fun_1():Unit{
         let mc_1 = R1<Int64>(10) //R1的实例
         let mc_2 = R2<Int64,UInt32>(-12,64) //R2的实例
    }
}

extend<T1,T2> R2<T1,T2> {
    //为R2扩展此方法，与类中原有函数构成重载
    public func fun_1(p1: T1, p2: T2):R2<T1,T2>{
        var res = R2<T1,T2>(p1,p2)
        return res
    }

    public func fun_1(p1: R1<T1>, p2!: Int32=32):R2<T1,Int32>{
        var res = R2<T1,Int32>(p1.width,p2)
        return res
    }

}
