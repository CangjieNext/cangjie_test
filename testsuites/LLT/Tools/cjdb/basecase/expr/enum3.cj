// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

enum Color {
    | RED
    | Green(Int64)
}

main(): Int64 {
    var aa = Color.RED
    var cc = Color.Green(7) //expr Color.Green(7)
    return 0
}
