/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */



var top_int:Int16 = 20
enum enumCol{
     Aa|Bb|Cc
    }

var v1: Int8 = 89
main() {
    var v1: Int8 = -128
    var v2: Int16 = 127
        v1 = Int8(v2)
    var v3: Int32 = 1
        v1= -10
        v2 = Int16(v3) + 10
    var v4: Int64 = 1
        v3= Int32(v1)/5 + 10

        v4 = Int64(v3)**2
    var par1 = m_1()
    var vu5: UInt8 = 1
    var vu6: UInt16 = 1
    vu5 =UInt8(vu6*5%3)
    var vu7: UInt32 = 1
    vu6 += 2
    var vu8: UInt64 = 12
    vu7 *=6
    var vf9: Float16 = 0.001
    vu8 /=3
    var vf10: Float32 = 4.001
    vf9 = Float16(vf10*2.1-5.0)
    var vf11: Float64 = 0.001
    vf10 = 0.12
    var eVar1 =enumCol.Aa
    var vb12: Bool = true
        eVar1 =enumCol.Bb
    vf11 = vf11*10.01
    var vc13: Rune = 'k'
    vb12 = !vb12
        vc13 = 'H'
    return 1
}

func m_1() : Int32{
var v1:Int32 = 23
var v2: Int64 =90
    v2=Int64(v1)
    v1=12
    return v1

}



