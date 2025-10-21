/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Enum

enum Either<T1, T2> {
    | Year(T1)
    | Month(T1, T2)
    | Day(T1, T2, T2)
    | Hour(T1, T2, T2, T2)
}

let ENUMA :Either<Int64, Float32>= Either<Int64, Float32>.Year(2)
let ENUMA_1: Either<Int64, Float32> = Either<Int64, Float32>.Day(1, 2.2, 3.3)
