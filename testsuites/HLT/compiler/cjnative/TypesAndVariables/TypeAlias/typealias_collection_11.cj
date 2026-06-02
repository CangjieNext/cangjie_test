/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

type intarray = Array<Int32>

type floatarray = Array<Float32>

struct Data<T> {
    public let width: T

    public init(x: T) {
        width = x
    }
}

main(): Int64 {
    let array1: intarray = [1, 2]
    let array2: floatarray = [1.001, 2.001]
    var list2: Array<Data<intarray>> = [Data<intarray>(array1)]
    var list3: Array<Data<floatarray>> = [Data<floatarray>(array2)]
    let res1 = list2[0].width
    let res2 = list3[0].width

    if (res1[0] == 1 && (2.000 < res2[1] && res2[1] < 2.002)) {
        return 0
    }
    return 1
}
