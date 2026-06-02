// Copyright (c) Huawei Technologies Co., Ltd. 2025-2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

func SelfDec(delta: Int32) {
    var a: Int32 = 20230601
    while (a > 0) {
        a = a - delta
    }
}

main(): Int64 {
    SelfDec(1)
    return 0
}