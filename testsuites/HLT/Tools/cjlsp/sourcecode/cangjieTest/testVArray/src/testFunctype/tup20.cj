/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.testFunctype

func test20(){
    let a : (Int64, p2:Int64) -> Int64
    let a2 : (p1:Int64, Int64) -> Int64
    let a3:(Int64, tb:Int64) = (1,2)
    let a4:(ta:Int64, Int64) = (1,2)
}
