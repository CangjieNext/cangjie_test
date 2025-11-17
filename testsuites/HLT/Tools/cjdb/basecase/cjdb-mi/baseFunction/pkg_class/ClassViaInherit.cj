/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg_class

public open  class ClassViaInherit{
    public var width: Int32 = 10
    public let length: Int32 = 20

    public init(){}
    public ClassViaInherit (par_1: Int32, par_2!: Int32=-32) {
        this.width = par_1
    }

    public func f_withoutBody(a:Int32): Unit {}
    public open func fun_f1(para_1: Int32): Int32 {
        var vf1 : Int32 = para_1
        vf1 += width
        return vf1
    }

    public static func fun_s1(a: Int32, b!: Int32 = 1): Int32 {
        var a1: Int32  = a << b
        return a1
    }

}

public interface I2 {
    func fun_I1(): Unit
    func fun_I1(para1:Float16): Float16{
        return para1
    }
    static func fun_Is1(a!: Int32) :Int32
}

public class subCla_1<: ClassViaInherit & I2{
    private var subVar1:Int32 = 1263
    public init(){
        super()
    }

    public override func fun_f1(para_1: Int32): Int32 {  //重写基类成员函数
        var vf1 : Int32 = para_1 >> 2
        vf1 += width
        return vf1
    }

    public static func fun_sub01(a: Int32, b!: Int32 = 1): Int32 {
        var a1: Int32  = a
        var b1: Int32 = b
        return a1 + b1
    }

    public func fun_I1(): Unit{}
    public static func fun_Is1(a!: Int32 =10) :Int32{
        var a1: Int32  = a & a << 3
      return a1
    }

    public  func fun_sub02(a!: Int32 =subCla_1.fun_Is1()): Unit {
        for (i in 0..4) {
          this.fun_f1(subCla_1.fun_Is1())
        }
    }

    public  static func fun_sub03(a: Int32) :ClassViaInherit {
       var res = ClassViaInherit(a)
    return  res
    }

}

public open  class ClaInsViaGenerices<T1,T2>{
    public var width: T1
    public var length: T2

    public ClaInsViaGenerices (par_1: T1, par_2: T2) {
        this.width = par_1
        this.length = par_2
    }

    public func f_withoutBody(a:T2): Unit {

    }

    public open func fun_f1(para_1: T1) :Unit {
        var vf1  = para_1
    }

    public static func fun_s1(a: T2): T2 {
            var a1 = a
            return a1
    }

}

public interface I3<T3> {
    func fun_I2(para1:T3): Unit
    static func fun_Is1(a: T3) :T3
}


public class SubClaViaViaGenerices<T1,T2,T3> <:ClaInsViaGenerices<T1,T2> & I3<T3>{
    public var subVar: T1
    public init(par_1: T1, par_2: T2){
        super(par_1,par_2)
        this.subVar = par_1
    }

    public func fun_sub1(para_1: T1):Unit{//子类调用基类的泛型函数
        return super.fun_f1(para_1)
    }

    public static func fun_sub2(para_1: T1,para_2: T2):ClaInsViaGenerices<T1,T2>{//子类函数返回泛型基类的实例
        var res = ClaInsViaGenerices(para_1,para_2)
        return res
    }

    public override func fun_f1(p1: T1):Unit {  //重写基类泛型函数
        var res:SubClaViaViaGenerices<T1,Int32,Float64> = SubClaViaViaGenerices<T1,Int32,Float64>(p1,-32)
    }

    public func fun_I2(para1:T3): Unit{
        var vf1 = para1
    }

    public static func fun_Is1(a: T3) :T3{
        var vf2:T3 = a
        return vf2
    }

}
