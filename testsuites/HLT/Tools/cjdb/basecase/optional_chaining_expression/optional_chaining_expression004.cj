/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

struct C<T,R>{
    var item = "aa"
}

main() {
    var a1 = C<Int32, Bool>()
    let b1 = Option<C<Int32, Bool>>.Some(a1)
    let b2 = Option<C<Int32, Bool>>.None
    let r1 = b1?.item
    let r2 = b2?.item
    0
}
