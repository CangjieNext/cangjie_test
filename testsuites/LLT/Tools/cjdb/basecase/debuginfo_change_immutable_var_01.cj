// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.


func goo(para: Int32) { 0 }

func foo(para: Int32) {
    var a = 5000
    return goo(para + para)
}

main() {
    var a = foo(500)
    0
}
