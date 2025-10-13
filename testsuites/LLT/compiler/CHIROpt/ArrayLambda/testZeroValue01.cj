// EXEC-PIPE-0: %compiler %cmp_opt %debugCHIROpt %enableO2 %n.cj -o %output | compare %f
// RUN-EXEC-PIPE-0: %run %output
// ASSERT: scan [ArrayLambda] The call to arrayInitByValue at [9,13] has been optimised due to the item is ZeroValue.
// ASSERT: scan [ArrayLambda] The call to arrayInitByValue at [231,25] has been optimised due to the item is ZeroValue.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

main() {
    var x = Array<Int64>(18, repeat : unsafe { zeroValue<Int64>() })
    var a = x.clone()
    println(a[0])
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
