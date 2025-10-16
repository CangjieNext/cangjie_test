// LEVEL: 0
// EXEC:%compiler %debugCHIROpt %cmp_opt %enableO2 %disableConstPropagation %f -o %output 2>&1 | compare %f
// EXEC:%run %run_opt %output

func foo() { 1 << 1 }
main() {
    let a = foo()
    let b = foo()
    if (a < b) // dont know 
    {
        if (a <= b) // true
        {
            let t1 = 1
            print(t1)
        }
        if (b == a) // false
        {
            let t2 = 2
            print(t2)
        }
    }
    0
}

// ASSERT: regex-begin \(10,13\), .*<=.*:true
// ASSERT: regex-after Replace if node id:\d+ at \(10,9\) with true branch id:\d+
// ASSERT: regex-after \(15,13\), .*==.*:false
// ASSERT: regex-after Replace if node id:\d+ at \(15,9\) with false branch id:\d+
// ASSERT: regex-not core dumped
// ASSERT: regex-not Assertion .* failed


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
