import std.collection.*


var map_top_k_int8 : HashMap<Int8, Int16> = HashMap<Int8, Int16>([(-3,-42), (2,12),(-72,1682)])
var map_top_empty_uint32 : HashMap<UInt32, UInt32> = HashMap<UInt32, UInt32>()
main() {
    let cla_ins = Clazz_1()
    var list_char : ArrayList<Rune> = ArrayList<Rune>([r'r', r'b', r'C'])
    var set_int32 : HashSet<Int32> = HashSet<Int32>([-74,92,-6954])
    var set_class : HashSet<cla> = HashSet<cla>([cla(110), cla(120)])
    var set_str_1 : HashSet<String> = HashSet<String>([cla_ins.width, "collection",cla_ins.arr_str1, cla_ins.arr_str16])

    var array_str_3 : Array<String> =[cla_ins.arr_str1, cla_ins.arr_str14, cla_ins.arr_str15]
   //单行拼接单行
    var array_str_4 : Array<String> =[cla_ins.arr_str5+cla_ins.arr_str14,cla_ins.arr_str8+cla_ins.arr_str6 , cla_ins.arr_str15]
   //多行字符串
    var array_str_5 : Array<String> =[cla_ins.arr_str10+cla_ins.arr_str10,cla_ins.arr_str11+cla_ins.arr_str12,cla_ins.arr_str10+cla_ins.arr_str13 , cla_ins.arr_str13+cla_ins.arr_str13]
   //混拼
    var array_str_6 : Array<String> =[cla_ins.arr_str6+cla_ins.arr_str10,cla_ins.arr_str11+cla_ins.arr_str13,cla_ins.arr_str3+cla_ins.arr_str13 , cla_ins.arr_str8+cla_ins.arr_str13]
	var multiArr_str_d1 : Array<Array<String>> = [array_str_3,array_str_4,array_str_5,array_str_6] //多维复合
    var array_set_class : Array<HashSet<cla>> = [set_class, set_class]

    var map_main_8 : HashMap<Float32, Float64> = HashMap<Float32, Float64>([(12.15654,1.7755560), (2.457563,1.2545836),(5.6,35.45778794)])
    var map_main_10 : HashMap<Int64, Bool> = HashMap<Int64, Bool>([(129,true), (-1560,false),(756,true)])
    var map_main_11 : HashMap<Rune, cla> = HashMap<Rune, cla>([(r'K',cla(10)), (r'Q',cla(12))])

    var map_str_1 : HashMap<Int16, String> = HashMap<Int16, String>([(3,array_str_3[1]), (-2,array_str_4[0]),(12,array_str_5[2]),(120,array_str_6[1])])

    var list_set_str : ArrayList<HashSet<String>> = ArrayList<HashSet<String>>([set_str_1, set_str_1])
    var list_map_cla : ArrayList<HashMap<Rune, cla>> = ArrayList<HashMap<Rune, cla>>([map_main_11, map_main_11])
	var map_list_1 : HashMap<UInt8, ArrayList<Rune>> = HashMap<UInt8, ArrayList<Rune>>([(3,list_char), (2,list_char)])  // map的value值是List
    var map_list_2 : HashMap<String, ArrayList<HashSet<String>>> = HashMap<String, ArrayList<HashSet<String>>>([("3",list_set_str), ("test_str",list_set_str)])
    var map_list_3 : HashMap<String, ArrayList<HashMap<Rune, cla>>> = HashMap<String, ArrayList<HashMap<Rune, cla>>>([("list",list_map_cla), ("_map",list_map_cla)])

	var map_set_1 : HashMap<Int8, HashSet<Int32>> = HashMap<Int8, HashSet<Int32>>([(3,set_int32), (2,set_int32)])  // map的value值是Set
	var map_set_2 : HashMap<Int16, HashSet<String>> = HashMap<Int16, HashSet<String>>([(13,set_str_1), (-62,set_str_1)])
	var map_set_3 : HashMap<String, HashSet<cla>> = HashMap<String, HashSet<cla>>([("13",set_class), ("key_str",set_class)])

	var map_array_4 : HashMap<String, Array<Array<String>>> = HashMap<String, Array<Array<String>>>([(array_str_6[0],multiArr_str_d1), (array_str_3[1],multiArr_str_d1)])  // map的value值是array
	var map_array_9 : HashMap<Bool, Array<HashSet<cla>>> = HashMap<Bool, Array<HashSet<cla>>>([(map_main_10[129],array_set_class), (false,array_set_class)])

	var map_map_1 : HashMap<Int64, HashMap<Float32, Float64>> = HashMap<Int64, HashMap<Float32, Float64>>([(-32689,map_main_8), (2548,map_main_8)])  // map的value值是Map
	var map_map_2 : HashMap<String, HashMap<String, Array<Array<String>>>> = HashMap<String, HashMap<String, Array<Array<String>>>>([("-32689",map_array_4), ("map_arr",map_array_4)])
	var map_map_3 : HashMap<UInt32, HashMap<Rune, HashSet<cla>>> = HashMap<UInt32, HashMap<Rune, HashSet<cla>>>([(768,HashMap<Rune, HashSet<cla>>([(r'H',set_class),(r'K',set_class)]))])  // map的value值是Map
	var map_map_4 : HashMap<Int64, HashMap<Bool,Array<HashSet<cla>>>> = HashMap<Int64, HashMap<Bool,Array<HashSet<cla>>>>([(-3278,map_array_9), (2536,map_array_9)])  // map的value值是Map





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
        var a = right
        return false
    }
}

//String
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




/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
