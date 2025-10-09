/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */



main() {

    //基本类型变量:Int8 var_int8 值改为 -2 时 f_int8 值为 10
    var var_int8: Int8 = 1
    var f_int8: Int8 = var_int8 + 12

    //基本类型变量:Int16 var_int16 值改为 2 时 f_int16 值为 10
    var var_int16: Int16 = 1
    var f_int16: Int16 = 12 - var_int16

    //基本类型变量:Int32 var_int32 值改为 2 时 f_int32 值为10
    var var_int32: Int32 = 1
    var f_int32: Int32 = var_int32 * 5

    //基本类型变量:Int64 var_int64 值改为 2 时 f_int64 值为 10
    var var_int64: Int64 = 1
    var f_int64: Int64 = 20 / var_int64

    //基本类型变量:UInt8 var_uint8 值改为 2 时 f_uint8 值为 10
    var var_uint8: UInt8 = 1
    var f_uint8: UInt8 =  var_uint8 + 8

    //基本类型变量:UInt16 var_uint16 值改为 2 时 f_uint16 值为 10
    var var_uint16: UInt16 = 1
    var f_uint16: UInt16 =  var_uint16 + 8

    //基本类型变量:UInt32 var_uint32 值改为 2 时 f_uint32 值为10
    var var_uint32: UInt32 = 1
    var f_uint32: UInt32 =  var_uint32 + 8

    //基本类型变量:UInt64 var_uint64 值改为 2 时 f_uint64 值为 10
    var var_uint64: UInt64 = 1
    var f_uint64: UInt64 =  var_uint64 + 8


    //基本类型变量:Float16 var_float16 值改为 2.0 时 f_float16 值为 10.0 暂时不支持
    var var_float16: Float16 = 1.0
    var f_float16: Float16 =  var_float16 + 8.0

    //基本类型变量:Float16 var_float32 值改为 2.0 时 f_float32 值为 10.0
    var var_float32: Float32 = 1.0
    var f_float32: Float32 =  var_float32 + 8.0

    //基本类型变量:Float64 var_float64 值改为 2.0 时 f_float64 值为 10.0
    var var_float64: Float64 = 1.0
    var f_float64: Float64 =  var_float64 + 8.0

    //基本类型变量:Bool var_bool 值改为 false 时 f_bool 值为 2
    var var_bool: Bool = true
    var f_bool: Int64
    if (var_bool) {
        f_bool = 1
    } else {
        f_bool = 2
    }


    //基本类型变量:Rune var_char 值改为 '7' 时 var_charbool 值为 false
    var var_char: Rune = r'5'
    var var_charbool: Bool = var_char<r'6'


    //不可变变量：let var_let 值改为 2 时 f_let 值为 10
    let var_let: Int64 = 1
    var f_let: Int64 = var_let + 8

    //变量遮盖： 执行到whlie时，将var_cover 值改为 5 ，最终var_cover 为10
    var var_cover: Int64 = 1
    var_cover = 2
    while (var_cover == 5) {
        var_cover = 10
    }

    //修改5个变量：var_one到var_five 值都改为 2 时，f_sum 值为10
    var var_one: Int64 = 1
    var var_two: Int64 = 1
    var var_three: Int64 = 1
    var var_four: Int64 = 1
    var var_five: Int64 = 1
    var f_sum: Int64 = var_one + var_two + var_three + var_four + var_five



    //变量值修改为变量：var_variable 值修改为 var_variabl1 时，f_variable 为 10
    var var_variable1: Int64 = 2
    var var_variable: Int64 = 1
    var f_variable: Int64 = var_variable + 8

    //变量值修改为表达式：var_expression 值修改为 1+1 时，f_expression 为 10；
    //var_expression 值修改为 1+ var_expression1 时，f_expression 为 11；
    var var_expression1: Int64 = 2
    var var_expression: Int64 = 1
    var f_expression: Int64 = var_expression + 8

    //变量值修改后continue：var_continue 值修改为 2 时，f_continue 为 10 //var f_stepinto设置行断点
    var var_continue: Int64 = 1
    var f_continue: Int64 = var_continue + 8

    //变量值修改后stepinto：var_stepinto 值修改为 2 时，f_stepinto 为 10
    var var_stepinto: Int64 = 1
    var f_stepinto: Int64 = var_stepinto + 8



    //变量值修改后stepout：funcstepout()函数体中的 var_stepout 值 改为 10 ，f_stepout 值为20
    var f_stepout: Int32 = funcstepout()

    //同类型同名变量修改：funcsamename()函数体中的 var_samename 值 改为 10 ，f_var_samename 值为60
    var var_samename: Int64 = 50
    var f_samename: Int64 = funcsamename() + var_samename

    //函数体中变量值修改后：func001()函数体中的 var_func001 值 改为 20 ，f_func001 值为50
    var f_func001: Int64 = func001(10,20)

    //函数体中默认值变量值修改后：func002()函数体中的 b 值 改为 2 ，f_func002 值为11
    var f_func002: Int32 = func002(8)

    //嵌套函数体变量值修改后：func003()函数体中的 a 值 改为 20 ，f_func003 值为70
    //func005()函数体中的 a 值 改为 20 ，f_func003 值为60
    var f_func003: Int64 = func003()

    var var_return : Int64 = 1
    return var_return
}

func funcstepout(): Int32 {
    var a: Int32 = 10
    var var_stepout: Int32 = 20
    return a + var_stepout
}

func funcsamename(): Int64 {
    var var_samename: Int64 = 20
    return var_samename
}


func func001(a: Int64, b: Int64 ): Int64 {
    var var_func001: Int64 = 10
    return a + b + var_func001
}

func func002(a: Int32, b!: Int32 = 1): Int32 {
    var var_func002: Int32 = b
    return a + b + var_func002
}

func func003(): Int64 {
    var a: Int64 = 10
    var b: Int64 = func004(a)
    return a + b
}

func func004(aa: Int64): Int64 {
    var a: Int64 = 10
    var b: Int64 = func005(a)
    return aa + b
}

func func005(aa: Int64): Int64 {
    var a: Int64 = 10
    var b: Int64 = func006(a)
    return aa + b
}

func func006(aa: Int64): Int64 {
    var b: Int64 = 10
    return aa + b
}
