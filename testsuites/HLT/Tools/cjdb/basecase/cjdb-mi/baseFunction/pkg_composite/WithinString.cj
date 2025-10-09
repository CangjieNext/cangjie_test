/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg_composite

public class WithinString{
    public var arr_str1:String = ""
    public var arr_str17:String = "\"\""
    public let arr_str2:String = "0123456789"
    public var arr_str3:String = "abcdxyz"
    public var arr_str4:String = "`~!@#$%^&*()_+-=[{}]\\|:;'\",./? %……&*（）——+-={}【】、|：；‘“”“，。、？"
    public var arr_str5:String = "1 a #"
    public var arr_str6:String = "仓颉中文字符串测试"
    public var arr_str7:String = "1 + 1"  //打印 1 + 1
    public var arr_str8:String = "\"Hello Cangjie Lang\"" //打印 "Hello Cangjie Lang"
    public var arr_str9:String = "Hello Cangjie Lang\nthis is a new line"   //打印 Hello Cangjie Lang 然后换行打印
    public var arr_str10:String = String(Array<Rune>(360,repeat:'H')) //超长字符序列：360个
    //public var arr_str10:String =arr_str4  //超长字符序列 with doubt  +arr_str6+arr_str8

    public var arr_str11:String = """
    says:
    Hello
    CangJie!
     """
    // 多行原始字符串字面量
    public var arr_str12:String = ##"This is a "#\n"##    //打印 This is a "#\n
    public var arr_str13:String = ###"#######"###   //打印 #######
    public var arr_str14:String = ##"
        Hello
            CangJie!
        this is a test."##

    //插值字符串
    public var arr_str15:String = "${arr_str2}${arr_str3}"
    public var arr_str16:String = "${arr_str2.concat(arr_str4)}"


}


