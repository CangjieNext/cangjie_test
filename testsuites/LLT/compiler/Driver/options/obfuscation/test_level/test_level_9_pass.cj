// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

//  EXEC: %compiler %cmp_opt %f --obf-level 9 --fobf-cf-bogus %verbose_opt | compare %f
//  ASSERT: regex .*?\-obf\-level=9

var mystr = "MS1 C5CF B6ED1 97C0 5194"

main() {
    var x = 3899644854
    if (x != 1498647828) {
        println(x)
    } else {
        println(mystr)
    }
    return 0;
}
