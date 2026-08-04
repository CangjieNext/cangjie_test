/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


import std.convert.*
import std.collection.*
import std.time.*
import std.math.*
import std.regex.*
import std.core.*

let gprs = 
[
    "t0",
    "t1",
    "t2",
    "t3",
    "t4",
    "t5",
    "cfr",
    "a0",
    "a1",
    "a2",
    "a3",
    "r0",
    "r1",
    "sp",
    "lr",
    "pc",
    // 64-bit only registers:
    "csr0",
    "csr1",
    "csr2",
    "csr3",
    "csr4",
    "csr5",
    "csr6",
    "csr7",
    "csr8",
    "csr9"
]

let fprs = 
[
    "ft0",
    "ft1",
    "ft2",
    "ft3",
    "ft4",
    "ft5",
    "fa0",
    "fa1",
    "fa2",
    "fa3",
    "csfr0",
    "csfr1",
    "csfr2",
    "csfr3",
    "csfr4",
    "csfr5",
    "csfr6",
    "csfr7",
    "fr"
]

let registers = appall2([gprs,fprs])

public func appall2(all: Array<Array<String>>):Array<String>{
    var arr: ArrayList<String> = ArrayList<String>()
    for (x in all){
        for (y in x){
            arr.add(y)
        }
    }
    return arr.toArray()
}

var gprPattern = "^((" + String.join(gprs,delimiter: ")|(") + "))$"
var fprPattern = "^((" + String.join(fprs,delimiter: ")|(") + "))$"
var registerPattern = "^((" + String.join(registers,delimiter: ")|(") + "))$"
