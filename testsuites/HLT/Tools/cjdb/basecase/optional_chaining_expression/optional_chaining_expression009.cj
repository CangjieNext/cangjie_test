/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class CB{
    var item = 1
}

class CA{
    var aa = Option<CB>.Some(CB())
    var bb = Option<CB>.None
}

main() {
    var a1 = CA()
    let r1 = a1.aa?.item
    let r2 = a1.bb?.item
    0
}
