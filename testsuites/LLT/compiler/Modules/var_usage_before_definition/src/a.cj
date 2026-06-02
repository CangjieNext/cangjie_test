// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../../var_usage_before_definition
// %compiler %pkg_opt var_usage_before_definition 2>&1 | compare %f
// ASSERT: regex-auto usage of a variable 'b' which is not defined yet

var a = C()

var b : Bool = true

class C {
    public static func f(param!:Bool = {foo()}()): Bool {
        false
    }
}

main() {
    0
}