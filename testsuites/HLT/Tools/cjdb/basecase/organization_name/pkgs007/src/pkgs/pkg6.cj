/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package org6::pkgs

public enum TimeUnit {
    | Year|Year(Int32)
    | Month(Int32, Int64)
}

public enum TimeUnit_1 {
    Year|Month|Day
}

public struct Rectangle_ex {
    public var width: Int32 = 10
    public var length: Int32 = 20
    public static var vc_1: Int32 = 79
    public static let vc_2: Int32 = 3
    private static var var_pri :Int32 =21
    public init (width: Int32, length: Int32) {
        this.width = width
        this.length = length
    }
    public static func f_static(): Int32 {
        var vf_1: Int32 = vc_1 +vc_2
        return  vf_1
    }
    public func area(): Int32 {
        var vf_1: Int32 = width * length
        return  vf_1
    }
}


public class Exter_C1 {
    public var width: Int32 = 10
    public var length: Int32 = 20
    public static var vc_1: Int32 = 79
    public static let vc_2: Int32 = 3    //静态成员变量
    private static var var_pri :Int32 =21
    public var year: TimeUnit = TimeUnit.Year(19)
    public var month: TimeUnit_1 = TimeUnit_1.Month
    public var year_1: Int32 = TimeUnit.Year(90).f2(TimeUnit.Year(23))
    public var rectangle_Ins: Rectangle_ex = Rectangle_ex(100, 100)  //构造Rectangle_ex的实例对象
    public var c_area: Int32 = rectangle_Ins.area()

    public init (width: Int32, length: Int32) {
        this.width = width
        this.length = length
    }
    public static func f_static() : Int32{
        var vf_1: Int32 = vc_1 +vc_2
        return  vf_1
    }
    public func area(): Int32 {
        var vf_1: Int32 = width * length
       return  vf_1
    }

}
public var top_var_1: Int32 =Rectangle_ex(100, 100).length
public let top_var_2: Int32 = Exter_C1.vc_1

extend Exter_C1{
public static  func fun_1(): Int32 {
    var var_pri :Int32 =21
            return  10 + var_pri
        }

    public func fun_2(para_1: Int32): Int32 {
      var vf1 : Int32 = para_1
      vf1 += 2
      return vf1
      }

}

extend Rectangle_ex{
    public static  func fun_1(): Int32 {
    var var_pri :Int32 =21
            return  10 + var_pri
        }

    public func fun_2(para_1: Int32): Int32 {  //实例成员函数
      var vf1 : Int32 = para_1
      vf1 += 2
      return vf1
      }
}

extend TimeUnit{
    static func Month(){}
    static func Month(pa:Int32){
        return pa
    }
    public func f2(v: TimeUnit): Int32 {
        return match (v) {
            case Year => 0
            case Year(a) => a
            case _ => -1
        }
    }
}
