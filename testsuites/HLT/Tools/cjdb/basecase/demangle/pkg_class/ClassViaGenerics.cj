/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg_class


public  class C1<T> {
    public var width: T
    public var length: T
    public init (side: T) {
        this(side, side)
    }
    public init (par_1: T, par_2: T) {
        this.width = par_1
        this.length = par_2
    }

    public func fun_c1(par_1:T): T {
        var par_c1 = C1<UInt16>(200).length
        let par_return = par_1
        return par_return
    }

    public static func fun_cs1(par_1:T): T{
        let par_return = par_1
        return par_return
    }

    public static func fun_cs1(par_1:T,par_2:T):C1<T>{
        var res = C1<T>(par_1,par_2)
        return res
    }
}

extend<T> C1<T> {
    public static func fun_cs2(par_1:T):C1<T>{
        var res = C1<T>.fun_cs1(par_1,par_1)
        return res
    }

    public static func fun_cs3(par_1:C1<T>):T{
        var res = par_1.length
        return res
    }

}

public class C2<T1,T2,T3> {
    public var num1: T1
    private var num2: T2
    protected var num3: T3
    public static var num11: Int8 = 10
    public init (pa_1: T1, pa_2: T2, pa_3: T3) {
        this.num1 = pa_1
        this.num2 = pa_2
        this.num3 = pa_3
    }

    public func fun_1():Unit{
         let mc_1 = C1<Int64>(10) //c1的实例
         let mc_2 = C2<Int64,UInt32,Rune>(-12,64,r'C') //c1的实例
         var arrayrec01 : Array<C1<Int64>> = [mc_1,C1<Int64>(-64)]
    }
}

extend<T1,T2,T3> C2<T1,T2,T3>{
    //为C2扩展此方法，与类中原有函数构成重载
    public func fun_1(p1: T1, p2: T2, p3:T3):C2<T1,T2,T3>{
        var res = C2<T1,T2,T3>(p1,p2,p3)
        return res
    }

}
