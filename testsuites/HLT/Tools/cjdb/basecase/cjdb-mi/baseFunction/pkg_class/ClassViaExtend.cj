/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg_class

public class ClassViaExtend {
    public var width: Int32 = 10
    public var length: Int32 = 20
    public init (par_1: Int32, par_2: Int32) {
      this.width = par_1
      this.length = par_2
    }

}

extend  ClassViaExtend{
    public static func f_001(a: UInt32, b!: UInt32 = 1): UInt32 { //扩展静态成员函数
        var a1: UInt32  = a
        var b1: UInt32 = b
        a1 = 5
        b1 = b + 3
        return a1 + b1
    }

    public func fun_f1(para_1: String,para_2!: Int64 =64) :Int64{  //实例成员函数
       var vf1 : String = para_1
       var res:Int64 = vf1.size+para_2
    return res
    }

    public static func fun_f2(para_1: Int32,para_2!: Int32 =64) :ClassViaExtend{  //实例成员函数返回class
       var res = ClassViaExtend(para_1,para_2)
       return res
    }

    public static func fun_f2(para_1:Int16,para_2!: ClassViaExtend = ClassViaExtend(13,-63)) :Int32{  //实例成员函数入参为class
       var res = para_2.width +para_2.length + Int32(para_1)
       return res
    }

    public static prop v1: Int64 { //静态成员属性
        get() { 1 }
    }
    public prop v2: Int64 { //实例成员属性
        get() { 2 }
    }


}

public interface I1 {
    func fun_I1(a: Int32 ):Int32

}

extend  ClassViaExtend <: I1  {
    public func fun_I1(a:Int32 ):Int32 {
        return  a + 10
    }

    public func fun_extend_I1(i: I1):Int32 { //接口扩展
        i.fun_I1(12)
    }

}
