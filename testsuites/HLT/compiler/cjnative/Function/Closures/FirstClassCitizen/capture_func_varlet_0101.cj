/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

//brief:变量赋值为lambda(捕获var变量)，编译报错

main(): Int64 {
    return 0
}

func case01() {
    var a: Int32 = 1
    var a2 = {
        =>
        var x = a;
        return x
    }
    var a3 = {=> return a}
    var a4 = {=> a}
    var a5 = {
        =>
        a;
        return 1
    }
    return 0
}
// ASSERT: scan sema_use_func_capture_var_alone
