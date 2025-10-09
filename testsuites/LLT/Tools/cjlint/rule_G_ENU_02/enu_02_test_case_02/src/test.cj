// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// overloading between constructors of enum and function
func Year(a: Int64) {
}

enum TimeUnit1 {
    | Year(Int64)
    | Month(Int64, Int64)
    | Day(Int64, Int64, Int64)
}

main() {
    var a = Year(1)
}