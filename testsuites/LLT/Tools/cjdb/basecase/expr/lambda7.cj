// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

var a = {=> [1, 2, 3]}

main(): Int64 {
    var a = {=> [1, 2, 3]} //expr {=>[1,2,3]}
    var b = a()[0] - 1
    return 0
}
