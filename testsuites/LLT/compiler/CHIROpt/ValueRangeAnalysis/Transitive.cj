// LEVEL: 0
// EXEC: %compiler %debugCHIROpt %enableO2 %cmp_opt %f %disableConstPropagation -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output 10000 9999 

func foo() { 1 >> 1 }
main() {
    let a = foo()
    let b = foo()
    let c = foo()
    if (a > b && b >= c) {
        if (a < c) {
            throw Exception()
        }
    }
    return 0
}

// ASSERT: regex-begin \(10,13\), .*\|\|>=-9223372036854775807\|;(?P<b>\d+):\|>=1\|\| < .*\|;(?P=b):\|<=0\|\|:false
// ASSERT: regex-after Replace if node id:\d+ at \(10,9\) with false branch
// ASSERT: regex-not true
// ASSERT: regex-not Assertion .* failed
// ASSERT: scan-not core dumped


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
