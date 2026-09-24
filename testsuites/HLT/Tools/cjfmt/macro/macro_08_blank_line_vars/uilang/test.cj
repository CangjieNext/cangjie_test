/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

var a = 0
var b = 0

func f1() {}

func f2() {}

class C {
    var x = 1

    var y = 2
}

@Deprecated["x"]
var c = 0
@Deprecated["y"]
var d = 0

main() {
    println("${a + b + c + d}")
}
