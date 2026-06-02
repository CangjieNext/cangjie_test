// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

struct B {
    var w = 60
}

var aaa: Option<B> = None
var bbb: Option<B> = Some(B())
var ccc: B = B()

func goo(para4: B, para5: Option<B>, para6: Option<B>) {
    return 0
}

main() {
    var hhh: Option<B> = None
    var iii: Option<B> = Some(B())
    var jjj: B = B()
    goo(jjj, iii, hhh)
    0
}
