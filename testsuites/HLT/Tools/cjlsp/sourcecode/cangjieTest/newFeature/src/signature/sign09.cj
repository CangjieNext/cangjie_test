/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.signature
func ff9<T>(x:Float64,y:T,z:T,abc:Float64):Float64{
    return x
}

func test9_1(){
    var c1 = ff9<Int64>(1.0, 1, 4, 6.8)
}
