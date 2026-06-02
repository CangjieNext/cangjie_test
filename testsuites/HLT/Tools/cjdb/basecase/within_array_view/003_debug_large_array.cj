/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */




    var arr : Array<Int64> = Array<Int64>(5000, {i => i+1}) //给定数组大小和构造元素的函数创建Array
main() {
    var a_d :Array<Array<Int64>> = [Array<Int64>(2000, {i => i-1}),arr] //7000个元素
    var arrayInt64_t : Array<Array<Array<Int64>>> = [a_d,a_d] //3维

    var arrayInt32 : Array<Int32> = [321, 322, 10]
    var arrayInt32_d : Array<Array<Int32>> = [arrayInt32,arrayInt32]
    var arrayInt32_t : Array<Array<Array<Int32>>> = [arrayInt32_d,arrayInt32_d]


func getArray_t () :Array<Array<Array<Int64>>> { //返回三维数组
    var arrayInt64 : Array<Int64> =[641, 642, 643, 644]
    var arrayInt64_d : Array<Array<Int64>> = [arrayInt64,arrayInt64.clone()]
    var arrayInt64_t : Array<Array<Array<Int64>>> = [a_d,arrayInt64_d] //跨域
    return arrayInt64_t
 }

    var getArray :Array<Array<Array<Int64>>> = getArray_t()
    var arrayInt64_q : Array<Array<Array<Array<Int64>>>> = [arrayInt64_t,getArray] //4维


  return -1
}



