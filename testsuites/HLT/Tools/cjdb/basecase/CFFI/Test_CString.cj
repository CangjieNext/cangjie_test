/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg_cstr


import std.collection.*

var top_str1 = unsafe { LibC.mallocCString("Hello cangjie!") }
var top_str2 = unsafe { LibC.mallocCString("!@#$%^&*()<<?>") }
let top_arr_str: Array<CString> = [top_str1,top_str2,unsafe { LibC.mallocCString("") }]

class Cla_1{
    var var_cla1 = unsafe { LibC.mallocCString("!@#$%^&*()_+<>?:H  e llo") }
    var var_cla2: Array<CString> = [top_str1,top_str2,var_cla1]
    var var_cla5 = var_cla1.toString()

    init(para_1 :CString){
        this.var_cla1 = para_1
    }

    public static func fun_cla_1(para_1 :String) :CString{
        var vf_1 = unsafe { LibC.mallocCString(para_1) }
        var str_size :UIntNative = UIntNative(vf_1.size())
        var vf_2 :CString
        if(str_size >= 3){
            vf_2 = vf_1.subCString(1,str_size -1)
        }
        else{
            unsafe { LibC.free(vf_1) }
            vf_1 = CString(CPointer<UInt8>())   // Need set to null after free.
            vf_2 = vf_1
        }
        return vf_2
    }

    func getUltraLargeStr() :String{
        var str : String = ""
        var arr : Array<Int64> = Array<Int64>(1000, {i => i+1000})
        for (i in 0..arr.size){
            str += arr[i].toString() + ":>"
        }
        return str
    }
}

public func fun_C1(para_1 : CString) :Unit{
    var vf_str1 = unsafe { LibC.mallocCString(" ") }
    var vf_str2 = unsafe { LibC.mallocCString("HZ") }
    var vf_str3 = para_1
    let vf_arr_str_1: Array<CString> = [vf_str1,vf_str2,vf_str3]
    let vf_arr_str_2: Array<Array<CString>> = [vf_arr_str_1,[top_str1,vf_str2,top_str2]]
}

main() :Int32{
    var str_1:CString = unsafe { LibC.mallocCString("a\"bc") }
    var b :String = str_1.toString()
    var str_2 = unsafe { LibC.mallocCString("\"a/'b\"c\"") }
    var str_3 = unsafe { LibC.mallocCString("仓颉与C互操作_CString(<>)") }
    var str_4 = str_1
    var arr_str_1 :Array<String> =[str_2.toString(),str_3.toString()]
    var arr_str_2: Array<CString> = [str_2,str_3]

    var cla_ins2 :Cla_1 = Cla_1(str_1)
    var vmf_1 = fun_C1(str_3) //入参CString
    var vmf_2 = Cla_1.fun_cla_1(b) //返回CString
    var vmf_3 = Cla_1.fun_cla_1("& ") //返回CString
    var str = cla_ins2.getUltraLargeStr()
    var str_5 = unsafe { LibC.mallocCString(str) }
    var arr_str_3: Array<CString> = [vmf_2,str_3]
    var arr_str_4 :Array<Array<CString>> = [arr_str_2,arr_str_3]
    var arr_str_5 :Array<Array<Array<CString>>> = [arr_str_4,[arr_str_2,cla_ins2.var_cla2]]




    return 120
}


