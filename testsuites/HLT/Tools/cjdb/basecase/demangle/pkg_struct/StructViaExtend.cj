/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg_struct
import std.sort.*
import std.random.*


public struct StructViaExtend {
    public var width: Int32 = 10
    public var length: Int32 = 20
    public init (par_1: Int32, par_2: Int32) {
      this.width = par_1
      this.length = par_2
    }

}

extend  StructViaExtend{
    public static func fun_rs1(a: UInt32, b!: UInt32 = 1): UInt32 { //扩展静态成员函数
        var res: UInt32  = a + b
        return res
    }

    public func fun_r1(para_1: String,para_2!: Int64 =69) :Int64{  //实例成员函数
       var vf1 : String = para_1
       var res:Int64 = vf1.size+para_2
       do{
            res -= 1
            continue
            if (res % 3 == 0) {
                break
            }
        }while (res > 0)
       return res
    }

    public static prop v1: Int64 { //静态成员属性
        get() { -1 }
    }
    public prop v2: Int64 { //实例成员属性
        get() { -2 }
    }

    //lambda表达式
    public func fun_lambda():Int64{
    var srcArr : Array<Int64> = Array<Int64>(20,{ i => Random(123).nextInt64() }
    )
    var comparator:(Int64,Int64) -> Ordering =
                                                { rht: Int64, lht: Int64 =>
                                                   if (rht < lht) {
                                                   return Ordering.LT
                                                   }
                                                   if (rht > lht) {
                                                   return Ordering.GT
                                                   }
                                                   return Ordering.EQ
                                                }
    srcArr.sortBy(comparator: comparator,stable:true)
    return srcArr[0]
    }
}

public interface I1 {
    func fun_I1(a: Int32 ):Int32

}

extend  StructViaExtend <: I1  {
    public func fun_I1(a:Int32 ):Int32 {
    var res:Int32 =0
    for (i in 0..4) {
        if(i <1){
            res+=1
            continue
        }
        else if(i == 2){
            res = -2
            break
        }
    }
    return  res + a
    }

    public func fun_extend_I1(i: I1): Unit { //接口扩展
        i.fun_I1(12)
        var v_a1 = StructViaExtend(100,236).width
        while (v_a1 > 95) {
            v_a1 -= 1
            continue
            if (v_a1 % 3 == 0) {
                break
            }
        }
    }

}
