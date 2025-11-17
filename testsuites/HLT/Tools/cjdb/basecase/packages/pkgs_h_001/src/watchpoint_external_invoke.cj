/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */





import pkgs.*

var top_C = Exter_C1(5, 6)
let test: Int32 = top_C.width
 var test1: Int8 = 1

func f_001(): Int8 {
    var a: Int8 = 20
    var b: Int8 = 20
    return a + b
}

main() {
    var newc = Exter_C1(100, 200)
    var main_c_area: Int32 = newc.area()
    var mian_year = newc.year
    main_c_area =  -89
    var mian_p = newc.length
    var main_Rect = newc.rectangle_Ins
    mian_p = newc.year_1
    var main_re_area : Int32 = newc.c_area
    var val_1: Int8= f_001()
    var val_2 = f_002()
    return val_1
}

func f_002(): Int32 {
    var v1 = Exter_C1.vc_1
    var v2 = Exter_C1.f_static()
    let v3 = top_var_1 //跨包，定义在被调文件的top_level
    var v4 = Rectangle_ex.vc_1
    var v5 = Rectangle_ex.f_static()
    var vmatch:Int32 = top_var_2   // 79
    var matched_val:Int32 = match(vmatch){
        case 60 => 1
        case 79 => top_var_1
        case _ => -1
    }
    matched_val +=1
 return 32
}
var top_v1 = Exter_C1.vc_2
var top_v2 = top_var_2
