/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*


var set_top_uint32 : HashSet<UInt32> = HashSet<UInt32>([32,126,5,6978,13354])
var set_top_empty_uint32 : HashSet<UInt32> = HashSet<UInt32>()
main() {
    var set_int32 : HashSet<Int32> = HashSet<Int32>([-74,9,-6954])
	var set_uint32 : HashSet<UInt32> = HashSet<UInt32>([9458,625654,12])

    let cla_ins = Clazz_1()
	var set_string_1 : HashSet<String> = HashSet<String>([cla_ins.width, "collection",cla_ins.arr_str1, cla_ins.arr_str16])
	var set_string_2 : HashSet<String> = HashSet<String>([cla_ins.arr_str2,cla_ins.arr_str4,cla_ins.arr_str5, cla_ins.arr_str6,cla_ins.arr_str7,cla_ins.arr_str8]) //单行
	var set_string_3 : HashSet<String> = HashSet<String>([cla_ins.arr_str9, cla_ins.arr_str10,cla_ins.arr_str13]) //多行
	var set_string_4 : HashSet<String> = HashSet<String>([cla_ins.arr_str9, cla_ins.arr_str8,cla_ins.arr_str10])//单 多混排

	var set_class : HashSet<cla> = HashSet<cla>([cla(1), cla(2)])

	let cla_ins_1 = Cla_1(120,"help!")
	var set_cla_m1 : HashSet<Int32> = cla_ins_1.set_cint32
	var set_cla_fun_1 : HashSet<UInt32> = cla_ins_1.fun_c1(set_uint32) //class实例函数返回 默认值
	var set_cla_fun_2 : HashSet<UInt32> = cla_ins_1.fun_c1(set_uint32,par_2:set_top_empty_uint32) //class实例函数返回
	var set_cla_fun_s2 : HashSet<UInt8> = Cla_1.fun_cs1(18) //class静态函数返回

	let re_ins = rec_ex()
	var set_re_m1 : HashSet<UInt8> = re_ins.set_ruint8
	var set_re_fun_1 : HashSet<Int32> = re_ins.fun_r1(set_int32) //struct实例函数返回 默认值
	var set_re_fun_2 : HashSet<Int32> = re_ins.fun_r1(set_int32,par_2:HashSet<Int32>([-24,59,-754])) //struct实例函数返回
	var set_re_fun_s2 : HashSet<Int16> = rec_ex.fun_rs1(-903) //struct静态函数返回
	var set_re_empty : HashSet<UInt32> = set_top_empty_uint32 //空set
//	var set_set : HashSet<HashSet<Int32>> = HashSet<HashSet<Int32>>([cla(10).set_cla_int32])




  return -1
}

class cla <: Hashable & Equatable<cla>{
    public var x:Int64
    public init(x:Int64){this.x = x}
    public func hashCode() : Int64 {
        return Int64(x)
    }
     public operator func ==(right : cla) : Bool {
            return this.x == right.x
        }
    public operator func !=(right : cla) : Bool {
        return false
    }
   public var set_cla_int32 : HashSet<Int32> = HashSet<Int32>([-94,98,-6154])

}

//构造String
class Clazz_1 {
var width : String = "Cangjie"
var length : String = "Hello"
    public init (par_str_1: String, par_str_2:String) {
            this.width = par_str_1
            this.length = par_str_2
        }
    public init(){}
    public var arr_str1:String = ""
    public let arr_str2:String = "0123456789"
    public var arr_str3:String = "abcdxyz"
    public var arr_str4:String = "!@#$%"
    public var arr_str5:String = "1 a #"
    public var arr_str6:String = "仓颉字符串测试"
    public var arr_str7:String = "1 + 1"  //打印 1 + 1
    public var arr_str8:String = "\"Hello Cangjie Lang\"" //打印 "Hello Cangjie Lang"
    public var arr_str9:String = "Hello Cangjie Lang\nHello Cangjie Lang"   //打印 Hello Cangjie Lang 然后换行打印 Hello Cangjie Lang

    public var arr_str10:String = """
        says:
            Hello
            CangJie!
        """
    // 多行原始字符串字面量
    public var arr_str11:String = ##"This is a "#\n"##    //打印 This is a "#\n
    public var arr_str12:String = ###"#######"###   //打印 #######
    public var arr_str13:String = ##"
        Hello
            CangJie!
        this is a test."##

    //插值字符串
    public var arr_str14:String = "${arr_str2}${arr_str3}"
    public var arr_str15:String = "${arr_str2 + arr_str4}"
    public var arr_str16:String = "\"\""
}

class Cla_1 {
  public var intValue:Int32 = 18
  public var str : String = "@&%$huiji"
  public init() {}
  public init(value:Int32, str:String) {
    this.intValue = value
    this.str = str
  }
  public var set_cint32 : HashSet<Int32> = HashSet<Int32>([-74,9,-6954])
  public static func fun_cs1(par_1:UInt8):HashSet<UInt8>{
      var set_cuint8 : HashSet<UInt8> = HashSet<UInt8>([4,9,6])
      set_cuint8.add(par_1)
    return set_cuint8
  }

  public func fun_c1(par_1:HashSet<UInt32>,par_2!:HashSet<UInt32>=set_top_uint32 ):HashSet<UInt32>{
      var set_cuint32 : HashSet<UInt32> = par_1
      set_cuint32.add(all: par_2)
      set_cuint32.remove(5)
      set_cuint32.add(UInt32(par_2.size))
    return set_cuint32
  }

}


struct rec_ex {
    public var rec_par_1 :UInt32=21
    public var var_pri :UInt32 =110
    public var set_ruint32: HashSet<UInt32> = set_top_uint32
    public init(){}
init(p1:UInt32, p2:UInt32) {
    this.rec_par_1 = p1
    this.var_pri = p2
  }
   public var set_rbool : HashSet<Bool> = HashSet<Bool>([true,false,false,true])
   public var set_ruint8 : HashSet<UInt8> = Cla_1.fun_cs1(98)
  public static func fun_rs1(par_1:Int16):HashSet<Int16>{
      var set_rint16 : HashSet<Int16> = HashSet<Int16>([45,91,-56])
      set_rint16.add(par_1)
    return set_rint16
  }

  public func fun_r1(par_1:HashSet<Int32>,par_2!:HashSet<Int32>=HashSet<Int32>([458,931,-526])):HashSet<Int32>{
      var set_rint32 : HashSet<Int32> = par_2
      var set_size_1 : Int32 = Int32(par_1.size)
      set_rint32.add(all: par_1)
      var set_size_2 : Int32 = Int32(set_rint32.size)
      set_rint32.remove(458)
      var set_size_3 : Int32 = Int32(set_rint32.size)
    return set_rint32
  }

}
