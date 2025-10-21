/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Cpkg

//带包名使用foreign函数
 func test26() {
    var s = S()
    unsafe {
        test(inout s)
        var a: VArray<UInt8, $4> = [1, 2, 3, 4]
        var b = getArrayPtr()
        Cpkg.cfoo1(inout a)
        cfoo2(inout a)
        cfoo3(inout a)
        Cpkg.cfoo4(inout a)
        cfoo1(b)
        cfoo2(b)
        var sum1 = a[0] + a[1] + a[2] + a[3]
        var sum2 = b.read(0) + b.read(1) + b.read(2) + b.read(3)
        var sum3 = s.a[0] + s.a[1] + s.a[2]
        return sum1 + sum2 + sum3 - 12
    }
}
