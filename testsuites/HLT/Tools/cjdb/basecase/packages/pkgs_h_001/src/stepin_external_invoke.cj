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

main() {
    var newc = Exter_C1(100, 200)
    var main_Rect = newc.rectangle_Ins
    var main_c_area: Int32 = newc.area()
    var mian_year = newc.year
    main_c_area =  -89
    var mian_p =TimeUnit.Year(90).f2(TimeUnit.Year(23))  //引用扩展enum的成员函数
    var val_1 =f_001()
    var val_2 =f_002(-10)
    var val_3 = newc.fun_2(12) //类中实例成员函数扩展
    var val_4 = Exter_C1.fun_1() //类中静态成员函数扩展
    var val_5 = main_Rect.fun_2(10) //struct中实例成员函数扩展
    var val_6 = Rectangle_ex.fun_1() //struct中静态成员函数扩展
    var val_7 =f_003(-10)




    return val_1
}

func f_001(): Int32 {
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
var top_v1 = Exter_C1.f_static()
var top_v2 = top_var_2

var val_f1 :Int32 = -1
func f_002(val_f1 :Int32 ,para! :Int32 = Exter_C1.f_static()){
    return val_f1+para

}
func f_003(val_f1 :Int32 ,para! :Int32 = top_v1){
    return val_f1+para

}
