/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Arrary

// 支持Array关键字高亮
class DataCls2<T> {}
var s1: DataCls2<Array<Int32>> = DataCls2<Array<Int32>>()

interface I2<T> {}
class subClass <: I2<Array<Int32>> {}

enum Time3<T> { Year(T)}
var s3 = Time3<Array<Int64>>.Year([1,2,3,4])

func test3<T>(x: T): T {
    var a = x
    return a
}
var s4 = test3<Array<Int64>>([1,2,3,4])

