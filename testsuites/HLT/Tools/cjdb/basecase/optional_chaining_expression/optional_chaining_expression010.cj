/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class CB{
    public var item = 1
    protected var item2 = 1.0
    private var item3 = true
}

main() {
    var aa = Option<CB>.Some(CB())
    var bb = Option<CB>.None
    let r1 = aa?.item
    let r2 = bb?.item
    let r3 = aa?.item2
    let r4 = bb?.item2
    0
}
