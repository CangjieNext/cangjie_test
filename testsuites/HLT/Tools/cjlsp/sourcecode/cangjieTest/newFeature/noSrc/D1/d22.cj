/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

//Array的定义
var list = [1, 2, 3, 4]

var arr1 =[1, 2, 3, 4, 5]
var arr2: Array<Int64> =[1, 2, 3, 4, 5]
var arr3: Array<Int64> = Array<Int64>(arr2)
var arr4: Array<Int64> = Array<Int64>(list)

var av = Array<Int8>()
var av1 = Array<Int16>()
var a13 = Array<String>()

func test35() {
    var a = Array<Int64>()
}
