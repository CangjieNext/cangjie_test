/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.signature

func f32(lam:()->Unit){}
func f32_1(a1:(Int64)->Int64):Int64{
    a1(1)
}

func f32_2(x:Int64){return x}
let res1 = f32_1({a2=>a2+10})
let res2 = f32_1({i=>i*4})
let res3 = f32({=>7})
let res4 = f32_1({i=>f32_2(4)*8})


