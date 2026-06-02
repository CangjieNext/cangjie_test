/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import p1.*
import p2.*

// func_1 overloading
func func_1<T1,T2>(a:T1,b:T2){
    var mydata = a
    var re_mydata = a
    return mydata
}

// func_2 overloading
func func_2<T1,T2>(a:T1,b:T2){
    let mydata_1 = a
    let mydata_2 = b
    return mydata_1
}

// top_level 调用包2内p201文件的func_p201方法
// 其中func_p201跨包调用包1内p101文件的func_3方法
// 以及 包1内p102文件的func_p102方法
var gobalValue = func_p201<Int64>(999)

main(){
    // 调用包1内p101文件的单类型单参函数
    var data_p101_1 = func_1<Int64>(100)
    // 同文件调用重载函数
    var data_here_1 = func_1<String,Int64>("Hello",101)
    // 同文件调用重载函数
    var data_p101_2 = func_2<String,Array<Int64>>("Cangjie",[1,2,3])
    // 调用包1内p101文件的双类型三参函数
    var data_p101_3 = func_3<Rune,String>(r'A',"Cangjie",r'A')
    // 调用包1内p101文件的三类型三参函数
    var data_p101_4 = func_4<Array<Int64>,Int32,Int64>([1,2,3],10,100)
    
    // 包1内p101文件的func_3函数放在if语句中，并调用包1内func_2函数
    if (func_3<Rune,String>(r'A',"Cangjie",r'A')==r'A'){
        func_2<String,Array<Int64>>("Cangjie",[1,2,3])
    }

    // 包1内p101文件的func_1函数放在for语句中，并循环调用func_1及func_1的本文件重载函数
    for (i in 0..func_1<Int64>(30)){
        func_1<Int64>(i)
        func_1<String,Int64>("Hello",i+1)
    }

    // p101文件的方法调用位于函数入参处
    func_1<Int64>(func_4<Array<Int64>,Int32,Int64>([1,2,3],10,500))
    
    // 调用包1内p102文件的func_p102方法
    // 其中func_p102调用同包不同文件p101文件的func_1方法
    var data_p102_1 = func_p102<Array<Int64>>([1,2,3])

    // 调用包2内p201文件的func_p201方法，
    // 其中func_p201跨包调用包1内p101文件的func_3方法
    // 以及 包1内p102文件的func_p102方法
    var data_p201_1 = func_p201<Int64>(99)

    print("data_p101_1: ${data_p101_1}\n")
    print("data_here_1: ${data_here_1}\n")
    print("data_p101_2: ${data_p101_2}\n")
    print("data_p101_3: ${data_p101_3}\n")
    print("data_p101_4: ${data_p101_4}\n")
    print("data_p102_1: ${data_p102_1}\n")
    print("data_p201_1: ${data_p201_1}\n")
    print("gobalVal: ${gobalValue}\n")

    return 0
}
