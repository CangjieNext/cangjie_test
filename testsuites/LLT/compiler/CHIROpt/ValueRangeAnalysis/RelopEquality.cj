// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableO2 %debugCHIROpt %disableConstPropagation %f -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output

func foo() { 1 << 1 }
func bar() { 1 << 1 == 1 << 1 }
main() {
    let a = foo()
    let b = foo()
    if(a == b){ // [true,false]
        a == b // true
    } else { // info loss
        a != b // [true,false]
    }
    a >= a // true
    a > a // false

    let c = bar()
    let d = bar()
    c == d // [true,false]
    c == true // [true,false]
    false == c // [true,false]
    true != false // true
    false == false // true
    true == false // false
    0
}

// ASSERT: regex-begin \(9,8\), .*:<t,f>
// ASSERT: regex-after \(12,9\), .*:<t,f>
// ASSERT: regex-after \(10,9\), .*:true
// ASSERT: regex-after \(14,5\), .*:true
// ASSERT: regex-after \(15,5\), .*:false

// ASSERT: regex-after \(19,5\), .*:<t,f>
// ASSERT: regex-after \(20,5\), .*:<t,f>
// ASSERT: regex-after \(21,5\), .*:<t,f>
// ASSERT: regex-after \(22,5\), .*:true
// ASSERT: regex-after \(23,5\), .*:true
// ASSERT: regex-after \(24,5\), .*:false


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
