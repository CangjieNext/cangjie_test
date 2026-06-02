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

var b: Int32 = 1
var c = if (true) {
    var a: Int32 = 1

    func goo2() {
        var a = {
            =>
            var x = a;
            return x
        }
        return a
    }
    func goo3() {
        var a = {=> return a}
        return a
    }
    func goo4() {
        var a = {
            =>
            a;
            return Int32(1)
        }
        return a
    }
    func goo5() {
        var a = {=> a}
        return a
    }
    func goo7() {
        var a = {=> b}
        return a
    }
}
// ASSERT: scan sema_use_func_capture_var_alone
// ASSERT: scan sema_capture_has_shadow_variable
