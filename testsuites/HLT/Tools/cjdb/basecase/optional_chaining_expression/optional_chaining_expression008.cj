/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class C{
    var item = 1
}

func test(a:Option<Int64>){
    a
}

main() {
    var a1 = C()
    let b1 = Option<C>.Some(a1)
    let b2 = Option<C>.None
    let r1 = b1?.item
    let r2 = b2?.item
    var r3 = (r1,r2)
    var r4 = test(b1?.item)
    0
}
