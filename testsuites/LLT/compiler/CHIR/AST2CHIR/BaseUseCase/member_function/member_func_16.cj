// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// EXEC-2: %run %run_opt %output

// cstring constructor call
class B {
    func test() {
        var strV = CString(CPointer<UInt8>())
        2
    }
}

main() {
    var b = B()
    return b.test()
}
