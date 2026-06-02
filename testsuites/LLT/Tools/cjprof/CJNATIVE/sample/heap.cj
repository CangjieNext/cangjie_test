// Copyright (c) Huawei Technologies Co., Ltd. 2025-2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

struct S {
    var str = "hello"
}

open class Base {
    var arr: Array<Int32> = [-1, 0, 1]
}

class Dirived <: Base {
    var st = S()
    var strs = ["", "", ""]
}

var flag = true

func Func(cls: Dirived) {
    var arr = cls.arr.clone()
    while (flag) {}
    arr[1] = 123
}

main() {
    var cls = Dirived()
    cls.strs[0] = "123"
    cls.strs[1] = "456789"
    cls.strs[2] = cls.strs[0] + cls.strs[1]
    Func(cls)
}