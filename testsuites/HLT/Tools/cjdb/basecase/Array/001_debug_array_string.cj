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

    var main_str1:String = ""
    let main_str2:String = "0123456789"
    var main_str3:String = "abcdxyz"
    var main_str4:String = "!@#$%"
    var main_str5:String = "1 a #"
    var main_str6:String = "仓颉字符串测试"
    var main_str7:String = "1 + 1"  //打印 1 + 1
    var main_str8:String = "\"Hello Cangjie Lang\"" //打印 "Hello Cangjie Lang"
    var main_str9:String = "Hello Cangjie Lang\nHello Cangjie Lang"   //打印 Hello Cangjie Lang 然后换行打印 Hello Cangjie Lang
    var main_str10:String = """
Hello
CangJie!"""
    var main_str11:String = ##"This is a "#\n"##    //打印 This is a "#\n
    var main_str12:String = ###"#######"### //打印 #######
    var main_str13:String = ###"
Hello
    CangJie!"###


    //字符串相加
    main_str1 = top_str1 + main_str2 + main_str3

    //插值字符串
    var main_str14:String = "${main_str2}${main_str3}"
    var main_str15:String = "${main_str2 + main_str3}"

    var arrayMainString01 : Array<String> =[top_str1, main_str1, main_str2, main_str3, main_str4, main_str5, main_str6]
    var arrayMainString02 : Array<String> =[main_str7, main_str8, main_str9, main_str10, main_str11, main_str12, main_str13]

    var arrayMainString03 : Array<String> =[main_str1, main_str14, main_str15]

    var slicing1 = arrayMainString01[3..]
    var Functioncall001: Int8 = demofun001()

    return 1
}


func demofun001(): Int8 {
    var arrayfun  = arrayTopString.clone()
    var funstr1:String = "#$"
    var funstr2:String = "0123456789"
    var funstr3:String = "abcdxyz"
    var arrayfunString01 : Array<String> =[funstr1, funstr2, funstr3]
    var a = arrayfunString01[0]
    arrayfunString01[0] = "change"
    var b = arrayfunString01.get(0)
    return 2
}





