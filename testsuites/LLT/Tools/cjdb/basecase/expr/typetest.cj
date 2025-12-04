// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

main():Int64 {
    var testVT = 1 is Int64
    testVT = 1 is String
    testVT = true is Int64
    testVT = [1,2,3] is Array<Int64> 
    0
}
