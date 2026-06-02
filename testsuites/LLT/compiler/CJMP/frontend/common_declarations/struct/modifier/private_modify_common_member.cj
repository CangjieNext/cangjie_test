// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-PIPE-0: %compiler %noColor --experimental c/c.cj --output-type=chir -Woff unused --output-dir ./c 2>&1 | compare %f
package cmp
common struct C{
    private let a:Int32 = 1
    private common let b:Int32
    private var c:Int64 = 1
    private func foo(){0}
    private common func goo():Int32
    private init() {}
}
/* SCAN
*/