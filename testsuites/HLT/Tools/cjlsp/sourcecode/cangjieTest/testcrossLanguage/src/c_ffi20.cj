/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default
foreign func testpara3(num_arg: Int64, ...): Float32
foreign func testpara4(num_arg1: Float32, num_arg2: Int64, ...): Float32

unsafe func test20(): Int64 {
    var res1: Float32 = testpara3(1, Float32(1.0))
    var res2: Float32 = testpara4(Float32(2), 1, Float32(2.0))
    var res3: Float32 = testpara4(Float32(3), 2, Float32(2.0), Float32(3.0))
    var res4: Float32 = testpara4(Float32(4), 3, Float32(2.0), Float32(3.0), Float32(4.0))
    var res5: Float32 = testpara3(5, Float32(1.0), Float32(2.0), Float32(3.0), Float32(4.0), Float32(5.0))

    if ((res1 == 1.0) && (res2 == 4.0) && (res3 == 8.0) && (res4 == 13.0) && (res5 == 15.0)) {
        return 0
    } else {
        return 1
    }
}
