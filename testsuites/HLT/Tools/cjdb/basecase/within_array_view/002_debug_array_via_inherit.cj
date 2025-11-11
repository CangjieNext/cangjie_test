/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */




var arrayInt32 : Array<Int32> = [321, 322, 10]
main() {
    let class_sub_ins = Class_sub_1()
    var v_main_1  =class_sub_ins.arrayUInt64_d //子类非静态成员变量:数组
    var v_main_2  =class_sub_ins.fun_sub01(20) //子类自有实例函数 Array<Array<UInt64>>
    var v_main_3  = class_sub_ins.f_001(arrayInt32) // 父类静态成员函数
    var v_main_4  = class_sub_ins.fun_1(-12) // 父类非静态成员函数
    var v_main_5  = class_sub_ins.arrayInt32_d // 父类非静态成员变量 ：二维数组
    let v_main_6  = Class_sub_1.fun_001(arrayInt32 , arrayInt32) //返回为Array<Array<Int32>> 子类自有静态函数



    return 0
}
open class Clazz_1 {

var arrayInt32_d : Array<Array<Int32>> = [arrayInt32,arrayInt32]
var width : Int32 = arrayInt32_d[0][0]
var length : Int32 = arrayInt32_d[0][2]
private var para_f1 : Int32 = arrayInt32_d[1][1]
public var para2:Int32 =0

func fun_f1(para_1: Int32) {
    var vf1 : Int32 = para_1
    vf1 += width
return vf1
}

public func fun_1(para_1: Int32 , para_2!: Int32 = arrayInt32_d[0][2]):Array<Array<Int32>> {
    var a1: Int32  = para_1
    var b1: Int32 = para_2
    var arrayInt32 : Array<Int32> = [a1,b1,-12]
    var arrayInt32_d : Array<Array<Int32>> = [arrayInt32,arrayInt32]
 return arrayInt32_d
}
    //主构造函数
 public Clazz_1(para_f1: Int32,length:Int32,para2!: Int32=10){
        this.para_f1 =para_f1
        this.length =length
    }
init(){}

  public func f_001(array :Array<Int32>, b!: Int32 = 1): Int32 {
       var v1 : Int32= 0
               if(array.size>0){
                    v1= array[array.size-1]
               }else{
                    v1=-1
               }
               return v1
   }

}

open class Class_sub_1 <: Clazz_1  {
  private var vP1 : Int32 =12
  public let para_sub1 : Int32 = 23
  public static var para_sub2 : Int32 = -90
  public Class_sub_1(){
          super(12,20,para2:20)
      }

  public var clazz_1_ins: Clazz_1 = Clazz_1() //父类的实例对象
  public let v1 : Int32 =clazz_1_ins.width

 public static func fun_001(array_1 :Array<Int32> , array_2 :Array<Int32>) : Array<Array<Int32>>{ //返回二维数组
    var array_d: Array<Array<Int32>> = [array_1,array_2]
  return array_d
}

 public var arrayUInt64 : Array<UInt64> = [41, 42, 43, 44, 45, 46, 47, 48]
 public var arrayUInt64_d : Array<Array<UInt64>> = [arrayUInt64,arrayUInt64]
 public var para :UInt64 =1
 public func fun_sub01(a: UInt64, b!: UInt64 = 1): Array<Array<UInt64>> {
       var a1: UInt64  = a
       var arrayUInt64_1 : Array<UInt64> = [41, 42,a1,b]
       var arrayUInt64_d : Array<Array<UInt64>> = [arrayUInt64,arrayUInt64_1]
     return arrayUInt64_d
   }

}

