// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

main() {
    var a: (a: Int64, b: Int64, c: Int64) = (1, 1, 2)
    return a[1] + a[0] - a[2]
}
