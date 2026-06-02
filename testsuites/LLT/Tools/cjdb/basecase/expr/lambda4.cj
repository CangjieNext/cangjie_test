// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class AC {
    AC(var aa: (HH: AC, MM: Int64) -> Int64) {}
    init(aa: (AA: AC, BB: Int64) -> Int64, bb: Int64) {
        this.aa = aa
    }
}

let aaa = 1
let ad0: (Int64, Int64) -> Int64 = if (aaa == 1) { let x = 1; {a: Int64, b: Int64 => a + b + x} } else {
    {a: Int64, b: Int64 => a + b}
}
main() {
    var gg = AC({a: AC, b: Int64 => b})
    var ad1: (Int64, Int64) -> Int64 = {a: Int64, b: Int64 => a + b}
    let ad3 = ad1(1, 2)
    0
}
