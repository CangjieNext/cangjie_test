/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class Empty {}

class LineBreakEmpty {}

func noop() {}

func noopLineBreak() {
}

func tightBraces(): Int64 {
    return 7
}

func caller(): Int64 {
    if (true) {}
    if (false) {
    }
    return 1
}

main() {
    let e = Empty()
    noop()
    println(caller())
    println(tightBraces())
}
