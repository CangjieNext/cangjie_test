// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

//brief:测试String的api：func indexOf(sub: String) : Option<Int64>入参为空
main(): Int64 {
    var str1 = "abc"
    var res3 = str1.indexOf("")
    if (foo(res3) != 0) {
        return 2
    }
    return 0
}

func foo(x: Option<Int64>) {
    var a = match (x) {
        case Some(v) => v
        case None => 1000
    }
    return a
}
