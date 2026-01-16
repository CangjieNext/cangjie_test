/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package org2::pkgs

var array_empty: Array<Array<Int32>> = Array<Array<Int32>>()
var arrayInt32 : Array<Int32> = [321, 322, 10]

public struct Rectangle_ex {
    public var v1:Int32 =-20 //(arrayInt32.set(0,-20))
    public var arrayInt32_1 : Array<Int32> = [v1,arrayInt32[1],arrayInt32[2]]
    public var arrayInt32_d : Array<Array<Int32>> = [arrayInt32_1,arrayInt32]
    public var width : Int32 = arrayInt32_d[0][0]
    public var length : Int32 = arrayInt32_d[0][2]
    public init (width: Int32, length: Int32) {
        this.width = width
        this.length = length
    }

     public func fun_1(array :Array<Array<Int32>> , para_2!: Int32 = arrayInt32_d[0][2]):Int32 {
            var b1: Int32 = para_2
            var v1 : Int32= -2
                       if(array.size > 0){
                            v1= array[0][array[0].size-1] + b1
                       }else{
                            v1=-1
                       }
             return v1
           }
    }


public class Exter_C1 {
    public var v1:Int32 =-20 //(arrayInt32.set(1,-20))
    public var arrayInt32_1 : Array<Int32> = [arrayInt32[0],v1,arrayInt32[2]]
    public var arrayInt32_d : Array<Array<Int32>> = [arrayInt32_1,arrayInt32]
    public var width : Int32 = arrayInt32_d[0][0]
    public var length : Int32 = arrayInt32_d[0][2]
    public var rectangle_Ins: Rectangle_ex = Rectangle_ex(100, 100)
    public var para_1 :Int32 = rectangle_Ins.fun_1(arrayInt32_d)
    public init (width: Int32, length: Int32) {
        this.width = width
        this.length = length
    }

    public func fun_001(array_1 :Array<Array<Int32>>, array_2 :Array<Array<Int32>>) : Array<Array<Array<Int32>>>{
        var array_t: Array<Array<Array<Int32>>> = [array_1,array_2,array_empty]
      return array_t
    }
}

public var arr : Array<Int64> = Array<Int64>(5000, {i => i+1})
public var a_d :Array<Array<Int64>> = [Array<Int64>(2000, {i => i-1}),arr]
public  var arrayInt64_t : Array<Array<Array<Int64>>> = [a_d,a_d]
