/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

main(): Int64 {
    return 0
}

func goo(m: Int32) {
    var a: Int32 = 1
    let b: Int32 = 2
    func ifoo5() {
        var x = b;
        return x
    }
    var res = match (m) {
        case 2 => {
            =>
            var x = a;
            return x
        }
        case 3 => {=> return a}
        case _ => {=> return Int32(1)}
    }
    return res
}
// ASSERT: scan sema_use_func_capture_var_alone
