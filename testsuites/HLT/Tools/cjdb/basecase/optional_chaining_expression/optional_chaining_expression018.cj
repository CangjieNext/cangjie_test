/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class CB {
    public var item = ()
    protected var item2 = (1,2)
    var item3 = "abcdefg"
    var item4 = r'a'
}

main() {
    var aa = Option<CB>.Some(CB())
    var bb = Option<CB>.None
    let r1 = aa?.item
    let r2 = bb?.item
    let r3 = aa?.item2
    let r4 = bb?.item2
    let r5 = aa?.item3
    let r6 = bb?.item3
    let r7 = aa?.item4
    let r8 = bb?.item4
    0
}
