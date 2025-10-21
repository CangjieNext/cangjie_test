/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.testVArray
//error

func test16(){
    var a1:VArray<> = [1,2]
    var a2:VArray<Int64> = [1,2]
    var a3:VArray<$4> - [1,2,3,4]
}

let al3:VArray<Int64,$0> = [3]
let al4:VArray<Float64> = [1,2]
let al5:VArray<Float64,$2> = [1,2,3]
