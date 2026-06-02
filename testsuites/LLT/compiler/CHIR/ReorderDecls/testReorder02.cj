// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// EXEC: %run %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

var y0: Int64 = 3
var x0: Int64 = f0()

func f0(): Int64 {
    f1()
}

func f1(): Int64 {
    C().t0 - 3
}

class C {
    var t0: Int64 = y0
}

main() {
    x0
}
