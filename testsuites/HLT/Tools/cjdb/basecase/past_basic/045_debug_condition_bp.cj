/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


var topnum: Int64 = 0
main() {
    var numint8: Int8 = 0
    while (numint8 < 10) { // until numint8 < 10
        numint8++
    }


    var numint16: Int16 = 0
    while (numint16 < 10) { // until numint16 < 10
        numint16++
    }

    var numint32: Int32 = 0
    do {
        numint32++ //numint32先自加1后进入while循环
    } while (numint32 < 10)

    var numint64: Int64 = 0
    for (i in 0..5) {
        numint64 = numint64 + i
    }

    var numuint8: UInt8 = 0
    while (numuint8 < 10) { // until numuint8 < 10
        numuint8++
    }

    var numuint16: UInt16 = 0
    do {
        numuint16++ //numuint16 先自加1后进入while循环
    } while (numuint16 < 10)

    var numuint32: UInt32 = 0
    for (i in 0..5) {
        numuint32 = numuint32 + UInt32(i)
    }

    var numuint64: UInt64 = 0
    while (numuint64 < 10) { // until numuint64 < 10
        numuint64++
    }

    var numfl16: Float16 = 0.0
    while (numfl16 < 10.0) { // until numfl16 < 10.0
        numfl16 = numfl16 + 1.0
    }

    while (topnum < 10) { // until topnum < 10
        topnum++
    }
    demofun002()
    var Functioncall001: Int32 = demofun001()
    return 1
}

func demofun001(): Int32 {
    var a: Int32 = 10
    var b: Int32 = 20
    return a + b
}

func demofun002(): Int64 {
    var numfl32: Float32 = 0.0
    while (numfl32 < 10.0) { // until numfl32 < 10.0
        numfl32 = numfl32 + 1.0
    }

    var numfl64: Float64 = 0.0
    while (numfl64 < 10.0) { // until numfl64 < 10.0
        numfl64 = numfl64 + 1.0
    }

    return 1
}



