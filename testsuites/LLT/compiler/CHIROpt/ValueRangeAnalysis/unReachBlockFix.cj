// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Linux) EXEC:%compiler %dumpCHIRDebug %enableO2 %n.cj -o %output 2>&1
// (Linux) EXEC-PIPE-0: %cat %n\_CHIR/*RangePropagation.chirtxt | %grep "Lambda" | compare %f
// (Linux) ASSERT: scan-not goo
// (Linux) EXEC-0: %run %output

func hoo() { 1 << 1 }

func foo() {
    let m = hoo()
    if (m < m + 1) {
    } else {
       var a = 1
       func goo() {
           a = 2
       }
       goo()
    }
}

main() {
    foo()
}