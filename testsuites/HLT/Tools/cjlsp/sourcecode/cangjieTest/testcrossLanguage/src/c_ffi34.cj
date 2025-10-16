/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default
//.c导入另一个.c
foreign func cfooc1(a: CPointer<VArray<Int32, $3>>): Unit
foreign func cfooc2(a: VArray<VArray<Int32, $3>, $1>): Unit
foreign func getArrayPtr(): CPointer<VArray<Int32, $3>>

func test34() {
    var a: VArray<VArray<Int32, $3>, $1> = [[1, 2, 3]]
    unsafe {
        cfooc1(inout a)
        cfooc2(inout a)
    }
    return a[0][0] + a[0][1] + a[0][2] - 5
}
