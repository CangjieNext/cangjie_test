import std.collection.*


var map_top_k_int8 : HashMap<Int8, Int16> = HashMap<Int8, Int16>([(-3,-42), (2,12),(-72,1682)])
var map_top_empty_uint32 : HashMap<UInt32, UInt32> = HashMap<UInt32, UInt32>()
main() {

	let cla_ins_1 = Cla_1(120,"help!")
    var map_c_f1 : HashMap<Int32, Rune> = HashMap<Int32, Rune>([(219,r'J'), (-120,r'B'),(86,r'G')])
	var map_cla_m1 : HashMap<Int32, Rune> = cla_ins_1.map_c_1 //成员变量
	var map_cla_fun_1 : HashMap<Int32, Rune> = cla_ins_1.fun_c1(HashMap<Int32, Rune>([(-249,r'L'), (850,r'A'),(71,r'p')])) //class实例函数返回 默认值
	var map_cla_fun_2 : HashMap<Int32, Rune> = cla_ins_1.fun_c1(HashMap<Int32, Rune>([(-279,r'L'), (150,r'A'),(941,r'D')]),par_2:map_c_f1) //class实例函数返回
	var map_cla_fun_s2 : HashMap<Int32, Rune> = Cla_1.fun_cs1(map_c_f1,r'Z') //class静态函数返回

	let re_ins = rec_1()
	var map_r_f1 : HashMap<UInt16, Int64> = HashMap<UInt16, Int64>([(132,1750), (203,18736),(516,35294)])
	var map_re_m1 : HashMap<Int32, Rune> = re_ins.map_rm
	var map_re_fun_1 : HashMap<UInt16, Int64> = re_ins.fun_r1(map_r_f1) //struct实例函数返回 默认值
	var map_re_fun_2 : HashMap<UInt16, Int64> = re_ins.fun_r1(map_r_f1,par_2:HashMap<UInt16, Int64>([(102,1350), (863,18736),(716,384)])) //struct实例函数返回
	var map_re_fun_s2 : HashMap<Int64, Bool> = rec_1.fun_rs1(-96,true,HashMap<Int64, Bool>([(119,true),(-130,false),(856,true)])) //struct静态函数返回
    var map_member_tuple = [([1,2],(1,"laji"),r'c',true),([4,5],(0,"魔鬼数字"),r'1',false)]  // List<Tuple<List<Int32>,Tuple<Int64,String>,Rune,Bool>>
  //  var map_Tuple : HashMap<Int32, List<Tuple<List<Int32>,Tuple<Int64,String>,Rune,Bool>>> = HashMap<Int32, List<Tuple<List<Int32>,Tuple<Int64,String>,Rune,Bool>>>([(32,map_member_tuple)])





  return -1
}

func getLargeMap(){
    var map_f1 : HashMap<UInt32, UInt32> = map_top_empty_uint32
    for(i in 0..120){
        map_f1.add(UInt32(i+1),UInt32(i+110))
    }
   return map_f1
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
        var a = right
        return false
    }
}


//class struct中定义map
class Cla_1 {
  public var intValue:Int64 = 23
  public var str : String = "cangjie_T"
  public init() {}
  public init(value:Int64, str:String) {
    this.intValue = value
    this.str = str
  }
  public var map_c_1 : HashMap<Int32, Rune> = HashMap<Int32, Rune>([(-29,r'C'), (-10,r'a'),(76,r'N')])
  public static func fun_cs1(par_1:HashMap<Int32, Rune>,par_2:Rune):HashMap<Int32, Rune>{
      var map_c_return : HashMap<Int32, Rune> = par_1
      map_c_return.add(Int32(12),r'F')
      map_c_return.add(Int32(12),r'Q')
      map_c_return[12] =par_2
    return map_c_return
  }

  public func fun_c1(par_1:HashMap<Int32, Rune>,par_2!:HashMap<Int32, Rune> = map_c_1):HashMap<Int32, Rune>{
       var map_c_return : HashMap<Int32, Rune> = par_1
        map_c_return.add(all: par_2)
        map_c_return.add(Int32(110),r'Q')
      return map_c_return
  }

}


struct rec_1 {
    public var rec_par_1 :UInt32=21
    public var var_pri :UInt32 =110
    public var map_rm :HashMap<Int32, Rune> = Cla_1().fun_c1(HashMap<Int32, Rune>([(19,r'n'), (90,r'p'),(46,r'J')]))
    public init(){}
    public init(p1:UInt32, p2:UInt32) {
    this.rec_par_1 = p1
    this.var_pri = p2
  }
   public var map_r_1 : HashMap<Int64, Bool> = HashMap<Int64, Bool>([(129,true), (-1560,false),(756,true)])
   public static func fun_rs1(par_1:Int64,par_2:Bool,par_3:HashMap<Int64, Bool>):HashMap<Int64, Bool>{
      var map_r_1 : HashMap<Int64, Bool> = par_3
      map_r_1.add(Int64(par_1),par_2)
      map_r_1.add(64,false)
      map_r_1.remove(64)
    return map_r_1
  }

  public var map_r_2 : HashMap<UInt16, Int64> = HashMap<UInt16, Int64>([(12,17750), (23,1836),(56,3594)])
  public func fun_r1(par_1:HashMap<UInt16, Int64>,par_2!:HashMap<UInt16, Int64> = map_r_2):HashMap<UInt16, Int64>{
      var map_r_return : HashMap<UInt16, Int64> = par_1
      var map_size_1 : UInt16 = UInt16(map_r_return.size)
      map_r_return.add(all: par_2)
      var map_size_2 : Int64 = Int64(map_r_return.size)
      map_r_return.add(map_size_1,map_size_2)
    return map_r_return
  }

}



/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
