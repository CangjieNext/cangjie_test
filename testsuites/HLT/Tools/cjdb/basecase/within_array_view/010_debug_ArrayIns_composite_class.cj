/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


var array_top_str_1 : Array<String> =["string_test_001","0123456789","仓颉字符串测试"]
open class C1 {
    public var length : Int32           // 未初始化的非静态成员变量定义
    private var width : Int32 = 0       // 初始化的非静态成员变量定义
    protected let diagonalLength: Int32 = 0
    public var varBool: Bool = true
    public var varchar: Rune = '5'
    public var str:String = "strmao"
    public var arrayInt8: Array<Int8> = [10,20,30]
    public static var name : String = "Rec"    // 静态成员变量
    public static var sta_num : Int32 = 0    // 静态成员变量

    public init(length: Int32) {
        this.length = length
    }
    public static func fun_s1(pa_1:Array<String>,pa_2!:Array<String> = array_top_str_1){
       var fun_v1  = pa_1
       var multiArr_d1 : Array<Array<String>> = [fun_v1,pa_2]
     return multiArr_d1
    }
}


 open class C2<T> {
     public var width: T
     public var length: T
     public init (side: T) {
         this(side, side)
     }
     public init (par_1: T, par_2: T) {
         this.width = par_1
         this.length = par_2
     }

      public func fun_c1(par_1:T){
         let par_return = par_1
         return par_return
         }

    public static func fun_cs1(par_1:T){
         let par_return = par_1
         return par_return
       }
 }


let top_c1 = C1(100)
var top_c2 = C1(-321)
var arraytop_c01 : Array<C1> = [top_c1, top_c2] //无泛型class
let top_g1 = C2<UInt16>(16)
var top_g2 = C2<UInt16>(69)
var arraytop_c02 : Array<C2<UInt16>> = [top_g1, top_g2] //泛型class

open class Cla_sub_1 <: C1 {
    public var a1: Int32
    public init(){
        super(-32)
        a1 = super.length
    }
   public var superFun: Array<Array<String>> = C1.fun_s1(array_top_str_1,pa_2:array_top_str_1)
   public func fun_sub_1(){
     var multiArr_c_d1 : Array<Array<C1>> = [arraytop_c01,arraytop_c01.clone()]
   return multiArr_c_d1
   }

}

class Cla_sub_3 <: Cla_sub_1 {
    public var a2: Int32
    public init(){
        super()
        a2 = super.length
    }
 }

class Cla_sub_2<T> <: C2<T> {
   public var chwidth: T
   public let chlength: T
   public init (a:T) {
       super(a)
       this.chwidth = super.width
       this.chlength = super.length
   }

}
main() {
    let m_c1 = C1(3)
    var m_c2 = C1(4)
    var array_m_1 : Array<C1> = [m_c1, m_c2]
    var multiArr_m_d1 : Array<Array<C1>> = [array_m_1,arraytop_c01.clone()]
    var array_m_2 : Array<C1> = [Cla_sub_1(), m_c2]
    var array_m_3 : Array<Cla_sub_1> = [Cla_sub_1(), Cla_sub_3()]
    var array_m_4 : Array<Cla_sub_3> = [Cla_sub_3(), Cla_sub_3()]
    var multiArr_m_d2 : Array<Array<Cla_sub_1>> = [array_m_3,array_m_3] //非泛型继承类做数组元素
    var multiArr_m_d3 : Array<Array<Cla_sub_3>> = [array_m_4,array_m_4] //非泛型继承类做数组元素

    var newc1 = C2<UInt16>(89)
    var newc2 = C2<UInt16>(368)
    var multiArr_mg_1 : Array<C2<UInt16>> = [newc1,newc2]
    var multiArr_mg_d2 : Array<Array<C2<UInt16>>> = [arraytop_c02.clone(),multiArr_mg_1]  //泛型类数组
    var multiArr_mg_2 : Array<C2<UInt16>> = [Cla_sub_2<UInt16>(16),newc2]
    var multiArr_mg_3 : Array<Cla_sub_2<UInt16>> = [Cla_sub_2<UInt16>(16),Cla_sub_2<UInt16>(86)]
    var multiArr_mg_d3 : Array<Array<Cla_sub_2<UInt16>>> = [multiArr_mg_3,multiArr_mg_3]  //泛型继承类做数组元素

    var slicing1 = multiArr_m_d1[0][1..3]
    var fun_call = demofun001()



    return 0
}


func demofun001() {
    var arr_fun_1  = arraytop_c01.clone()
    var arr_fun_2 = C1.fun_s1(array_top_str_1)  // Array<Array<String>>

    return -1
}
