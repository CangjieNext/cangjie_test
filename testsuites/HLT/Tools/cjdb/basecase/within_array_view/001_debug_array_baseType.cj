/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */




var arrayTopInt8 : Array<Int8> = [1, 2, 3]
var arrayTopcopy =  arrayTopInt8.clone()
var array_empty: Array<Array<Int64>> = Array<Array<Int64>>()  //空array
main() {
        var arrayInt8 : Array<Int8> = [8,-10,-2]
        var arrayInt8_d : Array<Array<Int8>> = [arrayInt8,arrayInt8.clone()]

        var arrayInt64 : Array<Int64> =[641, 642, 643, 644]
        var arrayInt64_d : Array<Array<Int64>> = [arrayInt64,arrayInt64.clone()]

        var arrayUInt8 : Array<UInt8> = [11, 12, 13, 14, 15]
        var arrayUInt8_d : Array<Array<UInt8>> = [arrayUInt8,arrayUInt8]

        var arrayUInt64 : Array<UInt64> = [41, 42, 43, 44, 45, 46, 47, 48]
        var arrayUInt64_d : Array<Array<UInt64>> = [arrayUInt64,arrayUInt64]

        var arrayFloat16 : Array<Float16> = [1.1, 2.2]
        var arrayFloat16_d : Array<Array<Float16>> = [arrayFloat16,arrayFloat16]

        var arrayFloat32 : Array<Float32> = [32.1, 32.2, 32.3]
        var arrayFloat32_d : Array<Array<Float32>> = [arrayFloat32,arrayFloat32,[0.1, 12.2]]

        var arrayFloat64 : Array<Float64> = [64.1, 64.2, 64.3, 64.4]
        var arrayFloat64_d : Array<Array<Float64>> = [arrayFloat64,arrayFloat64]

        var arrayChar : Array<Rune> =[r'a', r'b', r'c', r'd', r'e', r'f', r'g', r'h', r'i', r'j']
        var arrayChar_d : Array<Array<Rune>> = [arrayChar,arrayChar]

        var arrayBool : Array<Bool> = [true, true, false, true, true, false, true, true, false, true]
        var arrayBool_d : Array<Array<Bool>> = [arrayBool,arrayBool]

        array_empty= arrayInt64_d.clone()
        var q = array_empty[0][1]
        var a : Array<Int64> = Array<Int64>(5, {i => i - 10}) //给定数组大小和构造元素的函数创建Array
        var a_d :Array<Array<Int64>> = [arrayInt64_d[0],a]
        array_empty[0][0] = -12
            q = array_empty[0][2]
        let clazz_ins = Clazz_1()
        var var_m1 =clazz_ins.fun_1(clazz_ins.arrayInt32_d[0]) //参数为array 非空
        var var_m2 =clazz_ins.fun_1(Array<Int32>()) //参数为空array
        var var_m3 = Clazz_1.fun_s1(10)
        let struct_ins = Rectangle_ex(10,12)
        var var_m4 =struct_ins.fun_2() //struct实例函数
        var var_m5 =fun_2()



    return 1
}

var arrayInt32 : Array<Int32> = [321, 322, 10]
class Clazz_1 {
var arrayInt32_d : Array<Array<Int32>> = [arrayInt32,arrayInt32]
var width : Int32 = arrayInt32_d[0][0]
var length : Int32 = arrayInt32_d[0][1]
private var para_arr_1 : Int32 = arrayInt32_d[1][1]
init (width: Int32, length:Int32) {
        this.width = width
        this.length = length
    }
init(){}

    public func fun_1(array :Array<Int32>){
    var v1 : Int32= 0
        if(array.size>0){
        v1= array[array.size-1] + para_arr_1
        }else{
             v1=-1
        }
        return v1
    }

static func fun_s1(a: Int8, b!: Int8 = arrayTopInt8[0]): Int8 {
           var v1 :Array<Array<Int8>> = [arrayTopInt8.clone(),arrayTopInt8]
           var vp_1:Int8 = v1[v1.size-1][0]
          return vp_1 +a
       }

}

func fun_2(): Int16 {
    var arrayInt16 : Array<Int16> = [161, 162,-190,50]
    var arrayInt16_d : Array<Array<Int16>> = [arrayInt16,arrayInt16]
    var sum :Int16 = 0
       for (i in arrayInt16_d[0]) {
           sum = sum+ i
       }
    return sum
}

struct Rectangle_ex {
var arrayUInt32 : Array<UInt32> = [31, 32, 33, 34, 35, 36, 37]
var arrayUInt32_d : Array<Array<UInt32>> = [arrayUInt32,arrayUInt32]
    public var width: UInt32 = arrayUInt32_d[0][3]
    public var var_m1: UInt32 =arrayUInt32_d[1][2]
    public var para2 :UInt32 = 0
    private  var var_pri :UInt32 =arrayUInt32[1]
    //主构造函数
    public Rectangle_ex(width: UInt32,var_m1:UInt32,para2!: UInt32=10){
        this.width =width
        this.var_m1 =var_m1
    }
     public init(){}

func fun_2(): UInt16 {
         var arrayUInt16 : Array<UInt16> = [21, 22, 23, 24, 25, 26]
         var arrayUInt16_d : Array<Array<UInt16>> = [arrayUInt16,arrayUInt16]
        var sum :UInt16 = 0
           for (i in arrayUInt16_d[1]) {
               sum = sum+ i
           }
        return sum
    }
}
