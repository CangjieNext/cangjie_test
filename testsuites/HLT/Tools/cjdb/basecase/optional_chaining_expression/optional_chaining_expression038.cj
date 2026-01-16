/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

struct S1{
    let ab1 = (0,1,2)
    let ab2 = (1,"aa",true)
    let a1 = Some(ab1)
    let a2 = Some(ab2)
    let r1 = a1?[2]
    let r2 = a2?[2]
    let fff = 0
}

main() {
    var a = S1()
    0
}