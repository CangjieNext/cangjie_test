// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 套件1b-1: 嵌套数组+多元素类型 → InsertCJTBAA getArrayName/getTypeString/getTBAAMetadata
// EXEC: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

struct Mixed { let i: Int64; let f: Float64; let b: Bool
    public init(i: Int64, f: Float64, b: Bool) { this.i = i; this.f = f; this.b = b }
}

main(): Int64 {
    let nest: Array<Array<Int64>> = [[1, 2], [3, 4]]
    let ai: Array<Int8> = [1, 2]
    let af: Array<Float32> = [1.0, 2.0]
    let ad: Array<Float64> = [1.0, 2.0]
    let arrStruct: Array<Mixed> = [Mixed(1, 2.0, true), Mixed(3, 4.0, false)]
    var va: VArray<Int64, $4> = [1, 2, 3, 4]
    va[2] = 99
    if (nest[0][0] == 1 && ai[0] == 1 && af[0] > 0.0 && ad[0] > 0.0 && arrStruct[0].i == 1 && va[2] == 99) {
        return 0
    }
    return 1
}
