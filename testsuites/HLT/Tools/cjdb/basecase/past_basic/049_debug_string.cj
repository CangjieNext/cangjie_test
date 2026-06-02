/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */



var top_str1:String = "string_test_001"

main() {

    var main_str1:String = ""
    var main_str2:String = "0123456789"
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


    //字符串判等
    var s1 = "你好仓颉！"
    var s2 = "\u{4f60}\u{597d}\u{4ed3}\u{9889}\u{ff01}" // s1 对应的 Unicode 表示
    if (s1 == s2) {
        var s333 = "new s2"
    }

    //字符串相加
    main_str1 = top_str1 + main_str2 + main_str3

    //插值字符串
    var main_str14:String = "${main_str2}${main_str3}"
    var main_str15:String = "${main_str2 + main_str3}"

    //超长字符串
    var large_str:String = """
0 0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789#
1 0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789#
2 0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789#
3 0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789#
4 0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789#
5 0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789#
6 0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789#
7 0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789#
8 0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789#
9 0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789#
"""

    return 1
}





