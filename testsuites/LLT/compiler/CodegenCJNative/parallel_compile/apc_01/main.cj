// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt  --apc=4 %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan aaa bbb=Hello Cangjie

var aaa = "Hello"
var bbb = getCangjieStr()

func getCangjieStr() {
    return "Cangjie"
}

main() {
    println("aaa bbb=${aaa} ${bbb}")
    return 0
}