/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


var array_top_str_1 : Array<String> =["string_test_001","\"Hello Cangjie Lang\"","仓颉字符串测试"]

let top_r1 = R1(100)
var top_r2 = R1(-321)
var arraytop_c01 : Array<R1> = [top_r1, top_r2] //无泛型struct
let top_g1 = R2<Rune>(r'K')
var top_g2 = R2<Rune>(r'F')
var arraytop_c02 : Array<R2<Rune>> = [top_g1, top_g2] //泛型struct

main() {
    let m_r1 = R1(3)
    var m_r2 = R1(4)
    var array_m_1 : Array<R1> = [m_r1, m_r2]
    var multiArr_m_d1 : Array<Array<R1>> = [array_m_1,arraytop_c01.clone()]

    var newr1 = R2<Rune>(r'a')
    var newr2 = R2<Rune>(r'c')
    var multiArr_mg_1 : Array<R2<Rune>> = [newr1,newr2]
    var multiArr_mg_d2 : Array<Array<R2<Rune>>> = [arraytop_c02.clone(),multiArr_mg_1]  //泛型数组

    var m_str:Array<String> =["func_arr","test"]
    var m_fun_r1 = m_r1.fun_r1(array_m_1,pa_2:m_str)
    var m_fun_r2 = m_r1.fun_r1(array_m_1) //形参默认值
    var m_fun_r3 = m_r2.fun_r2(array_m_1)




    return 0
}

 struct R1 {
    public let length : Int32
    private var width : Int32 = 0
    public let diagonalLength: Int32 = 0
    public var varBool: Bool = true
    public var varchar: Rune = '5'
    public var str:String = "strmao"
    public var arrayInt8: Array<Int8> = [10,20,30]
    public static var name : String = "Rec"
    public static var sta_num : Int32 = 0

    public init(length: Int32) {
        this.length = length
    }
  public func fun_r1(pa_1:Array<R1>,pa_2!:Array<String> = array_top_str_1){
       var fun_v1  = pa_1
       var multiArr_d1 : Array<Array<String>> = [["","empty_str"],pa_2]
     return multiArr_d1
    }

 public func fun_r2(par_1:Array<R1>) :Array<Array<R1>>{
     var par_return:Array<Array<R1>> = [par_1,par_1]
     return par_return
  }

}

 struct R2<T> {
     public var width: T
     public var length: T
     public init (side: T) {
         this(side, side)
     }
     public init (par_1: T, par_2: T) {
         this.width = par_1
         this.length = par_2
     }

      public func fun_rg1(par_1:T){
         let par_return = par_1
         return par_return
         }

    public static func fun_rs1(par_1:T){
         let par_return = par_1
         return par_return
       }
 }

