// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package b

internal import b.p1.*

func test(): Int64 {
    print("hello world\n")
    println(pp)
    return 0
}
main(args:Array<String>): Int64 {
    for (arg in args) {print("arg: '${arg}'")}
    print("hello world")
    
    return 0
}