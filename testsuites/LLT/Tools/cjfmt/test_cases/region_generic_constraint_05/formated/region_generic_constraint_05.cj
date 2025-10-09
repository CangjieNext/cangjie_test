// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// REGION: 62:62
/**
 * Created on 2025/9/5
 */
package ohos_app_cangjie_entry

import std.collection.ArrayList
import ohos_app_cangjie_entry.macro_definition.Foo
import ohos_app_cangjie_entry.macro_definition.dprint

func funname() {
    var aa = 10
    var bb = 2
    var cc = aa + bb
    var cc1 = aa + 10
    return 2
}

func funname1() {
    var a1 = 10 + funname()
}

const CONST_VAR = 2
const CONST_STR = "STRING"
const bool1: Bool = true
const bool2: Bool = false
const i1 = 10
const i2 = 6

const func constfun1(a1: Int64) {
    return a1 + CONST_VAR
}

const func constfun2(a1: Int64) {
    return CONST_VAR + 10
}

//enum
@Foo[public]
enum Color1 {
    | Red | Green | Blue(Int64)

    func func1() {
        var aa: Int64 = 100
        var bb = gloable
        let r = RGBColor.Red
        let g = Green
        let b = Blue(aa)
    }
    @Foo[public]
    func myname() {
        var a = CONST_STR
        var b = gloable
        var c = constfun2
        let b1 = Blue(CONST_VAR)
        let r11 = {a: Int64, b: Int64 => a + b}(1, CONST_VAR) //提取字面量“1”，“2”
        let r12 = {a: String, b: String => a + b}("xx", CONST_STR)
        let r13 = {a: Bool, b: Bool => a && b}(true, bool1 || bool2)

        func funcbreak() {
            let numbers = [12, 18, 25, 36, 49, 55]
            for (number in numbers) {
                if (CONST_VAR % 5 == 0) {
                    println(number / CONST_VAR)
                    print("sxxxx${CONST_VAR}")
                    break
                }
            }

            for (number in numbers) {
                if (bool1) { //将给定整数数组中的奇数打印出来：
                    continue
                }
                println(CONST_STR)
                print("sxxxx${bool1 && bool2}")
                print("sxxxx${!true}")
                print("sxxxx${i1 << 1}")
            }
        }
    }
}

let r11 = {a: Int64, b: Int64 => a + b}(1, 2) //提取字面量“1”，“2”

func name11() {
    var bool3: Bool = false
    bool3 = bool2 && bool1
    bool3 ||= bool1

    var result2: Bool
    result2 = (i1 == 0) || (i2 > 0) //逻辑运算

    var aa = 0
    aa ^= i1

    var a = CONST_VAR + 10
    var b = CONST_STR + "xx"
    var c = constfun1(10) + CONST_VAR + 10
    return constfun2

    //
    if (true) {
        true == false; // return false
        true != false; // return true
        !false // logical NOT, return true
        true && false; // logical AND, return false
        false || false;
    }
}

//arraylist
func name3() {
    let list = ArrayList<Int64>([0, 1, 2])
    for (i in list) {
        println("The element is ${i}")
        print(bool1)
        print("bool2 is ${bool2}")
        println("i1 ^ i2 =  ${i1 ^ i2}")
        println("i1 < 1> =  ${i1 << 1}")
    }
    return 2
}
