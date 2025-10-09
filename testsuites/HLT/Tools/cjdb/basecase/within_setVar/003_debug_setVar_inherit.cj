/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */



var arrayTopInt32 : Array<Int32> = [12, 23, 34]
main() {
    let class_sub_ins = Class_sub_1(20)
    var v_main_1  =class_sub_ins.para_sub1 //非泛型子类非静态成员变量
    let vm_1 = Class_sub_1.para_sub2 //非泛型子类静态成员变量
    var vm_2 = class_sub_ins.fun_sub1(52) //非泛型子类实例成员函数
    var vm_3 = Class_sub_1.fun_s1(-20,pa_2:54) //非泛型子类静态成员函数
    var vm_4 = Clazz_1<Int16>.para_f3 //泛型父类静态成员变量
    var vm_5 = Clazz_1<Int16>.f_001(56) //泛型父类静态成员函数
    var vm_6 = class_sub_ins.fun_f1(16) //泛型父类非静态成员函数
    var vm_7 = Clazz_1<Int16>(80).width //泛型父类非静态成员变量
    let class_sub_ins2 = Class_sub_2<Int64>(64)
    var vg_1 = class_sub_ins2.fc_sub() //泛型子类实例成员函数
    var vg_2 = class_sub_ins2.chlength //泛型子类实例成员变量
    var vg_3 = Class_sub_2<Int32>.sub_s1() //泛型子类静态成员函数
    var vg_4 = Class_sub_2<Float32>.var_s //泛型子类静态成员变量




    return 0
}

open class Clazz_1<T> {
var width :T
let length :T
private var para_f1 : T
static var para_f3 : Int32 = -90
public var para2:Int32 =0

func fun_f1(para_1: T) {
    var vf1 = para_1
return vf1
}
init (par_1: T){
    this(par_1,par_1)
}
init (width: T, length:T) {
        this.width = width
        this.length = length
        this.para_f1 = length
    }

  public static func f_001(a:T) :T {
       var par_re= a
    return par_re
   }

}

open class Class_sub_1 <: Clazz_1<Int32>  { //非泛型继承
  private var vP1 : Int32 =12
  public let para_sub1 : Int32 = 23
  public static var para_sub2 : Int32 = -90
  public Class_sub_1(a: Int32){
          super(a)
      }

  public var clazz_1_ins: Clazz_1<Int32> = Clazz_1<Int32>(21) //父类的实例对象
  public let v1 : Int32 =clazz_1_ins.width

  public func fun_sub1(para_1: Int32 , para_2!: Int32 = 1): Int32 {
    var a1: Int32  = para_1
        var b1: Int32 = para_2
        a1 = -5
        b1 = para_2 + 3
    return a1 + b1
  }

   public static func fun_s1(pa_1:Int32,pa_2!:Int32=10): Int32{
          var p_arr = arrayTopInt32.clone()
          var va1 =arrayTopInt32[1]
          return va1+pa_1
     }

}

class Class_sub_2<T1> <: Clazz_1<T1>  { //泛型继承
    public var chwidth: T1
    public let chlength: T1
    public init (a:T1) {
        super(a)
        this.chwidth = super.width
        this.chlength = super.length
    }
 public let clazz_1_ins: Clazz_1<UInt32> = Clazz_1<UInt32>(21) //父类的实例对象

func fc_sub(){
    var va1 =clazz_1_ins.length
  return va1
  }
static var var_s = para_f3
static func sub_s1(): Clazz_1<Bool> {
    var f_c1 = Clazz_1<Bool>(true)
    return f_c1
  }

}
