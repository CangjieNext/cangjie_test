/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg_class

var arrayTopInt64 : Array<Int64> =[12, 23, 34]

public open class ClassViaOverLoad{
    public var width: Int32 = 10
    public var length: Int32 = 20

    public init(){}
    public init (par_1: Int32, par_2: Int32) {
        this.width = par_1
        this.length = par_2
    }
    public func f_withoutBody(): Unit {}
    public func f_withoutBody(para_1!: Int32): Unit {}

    public func fun_1(para_1: Int32 , para_2!: Int32 = 1): Int32 {
        var a1: Int32  = para_1
        var b1: Int32 = para_2
        b1 = para_2 + 3
        return a1 + b1
    }

     public func fun_1(para_1: Int32, para_2: Int32 ,para_3!: Int32 =-10): Int32 {
        var pri_v1: Int32 = para_1
        var pri_v2: Int32 = para_2
        var pri_v3: Int32 = para_3
        return pri_v1 + pri_v2+para_3
    }

    public static func fun_s1(pa_1:Int64): Int64{
       var p_arr = arrayTopInt64.clone()
       var va1 =arrayTopInt64[1]
       return va1+pa_1
    }

    public static func fun_s1(pa_1:Int32,pa_2!:Int32,pa_3!:Int32 =19): Int32 {
       var va1 =pa_1
       return va1+pa_2+pa_3
    }

}

