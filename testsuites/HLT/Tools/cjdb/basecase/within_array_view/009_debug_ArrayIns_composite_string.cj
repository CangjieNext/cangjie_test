/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


var top_str1:String = "string_test_001"
var top_str2:String = "string_test_002"

var arrayTopString : Array<String> =[top_str1, top_str2]
main() {
    let cla_ins = Clazz_1()
    var array_str_1 : Array<String> =[cla_ins.arr_str1, cla_ins.arr_str16, cla_ins.arr_str2, cla_ins.arr_str3, cla_ins.arr_str4, cla_ins.arr_str5, cla_ins.arr_str6]
    var array_str_2 : Array<String> =[cla_ins.arr_str7, cla_ins.arr_str8, cla_ins.arr_str9, cla_ins.arr_str10, cla_ins.arr_str11, cla_ins.arr_str12, cla_ins.arr_str13]

    var array_str_3 : Array<String> =[cla_ins.arr_str1, cla_ins.arr_str14, cla_ins.arr_str15]
    //单行拼接单行
    var array_str_4 : Array<String> =[cla_ins.arr_str5+cla_ins.arr_str14,cla_ins.arr_str8+cla_ins.arr_str6 , cla_ins.arr_str15]
   //多行字符串
    var array_str_5 : Array<String> =[cla_ins.arr_str10+cla_ins.arr_str10,cla_ins.arr_str11+cla_ins.arr_str12,cla_ins.arr_str10+cla_ins.arr_str13 , cla_ins.arr_str13+cla_ins.arr_str13]
   //混拼
    var array_str_6 : Array<String> =[cla_ins.arr_str6+cla_ins.arr_str10,cla_ins.arr_str11+cla_ins.arr_str13,cla_ins.arr_str3+cla_ins.arr_str13 , cla_ins.arr_str8+cla_ins.arr_str13]

   //多维
   var multiArr_str_d1 : Array<Array<String>> = [array_str_1,array_str_2]
   var multiArr_str_d2 : Array<Array<String>> = [array_str_1,array_str_3,array_str_4,array_str_5]
   var multiArr_str_d3 : Array<Array<String>> = [array_str_4,array_str_5,array_str_6]
   var slicing1 = multiArr_str_d2[1][1..3]

   var multiArr_str_t1 : Array<Array<Array<String>>>= [multiArr_str_d1,multiArr_str_d2]
   var multiArr_str_t2 : Array<Array<Array<String>>>= [multiArr_str_d2,multiArr_str_d3]

   var multiArr_str_q : Array<Array<Array<Array<String>>>> = [multiArr_str_t1,multiArr_str_t2]




    return 1
}

class Clazz_1 {
var width : String = arrayTopString[0]
var length : String = arrayTopString[1]
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
    public var arr_str15:String = "${arr_str2 + arr_str3}"
    public var arr_str16:String = "\"\""
}

