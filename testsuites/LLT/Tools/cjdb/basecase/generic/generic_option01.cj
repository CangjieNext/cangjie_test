// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class C {
    var item: Int64 = 100
}

main() {
    let c = C()
    let c1 = Option<C>.Some(c) //expr c1
    let c2 = Option<C>.None //expr c2
    0
}
