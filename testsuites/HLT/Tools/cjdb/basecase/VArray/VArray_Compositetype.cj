/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class V1 {
    var vInt8: VArray<Int8, $3> = [-1, -2, -3]
    var vInt16: VArray<Int16, $3> = [-1, -2, -3]
    var vInt32: VArray<Int32, $3> = [-1, -2, -3]
    var vInt64: VArray<Int64, $3> = [-1, -2, -3]
    var vUInt8: VArray<UInt8, $3> = [1, 2, 3]
    var vUInt16: VArray<UInt16, $3> = [1, 2, 3]
    var vUInt32: VArray<UInt32, $3> = [1, 2, 3]
    var vUInt64: VArray<UInt64, $3> = [1, 2, 3]
    var vFloat16: VArray<Float16, $3> = [1.0, 2.0, 3.0]
    var vFloat32: VArray<Float32, $3> = [1.0, 2.0, 3.0]
    var vFloat64: VArray<Float64, $3> = [1.0, 2.0, 3.0]
}

struct V2 {
    var vChar: VArray<Rune, $2> = [r'a', r'a']
    var vBool: VArray<Bool, $2> = [true, false]
    var vUnit: VArray<Unit, $2> = [(), ()]
    var vRInt64: VArray<Range<Int64>, $1> = [0..1:1]
    var vRChar: VArray<Range<Rune>, $1> = [r'A'..r'Z':1]
    var vvarr: VArray<(VArray<Int64, $3>, (VArray<Int64, $4>)), $2> = [([1, 2, 3], ([1, 2, 3, 4])), ([1, 2, 3], ([1, 2, 3, 4]))]
    var vstruct: VArray<A<Int64>, $2> = [A<Int64>(1), A<Int64>(1)]
}

struct A<T> {
    var a: T
    init(a: T) {
        this.a = a
    }
}

main() {
    var v1: V1 = V1()
    var v2: V2 = V2()
}
