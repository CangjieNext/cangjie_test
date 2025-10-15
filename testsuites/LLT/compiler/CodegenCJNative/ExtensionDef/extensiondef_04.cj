// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %dump-ir-to-screen %cmp_opt %compile_lib_opt -j1 %f 2>&1 | compare %f

// ASSERT: regex-auto @"default:CA_ed_default:CA.ft" = private global [1 x i8*]
// ASSERT: regex-auto @"default:CA_ed_default:CA" = private global %ExtensionDef

public abstract class CA {
    func kkk() {}
    static func mmm() {
        println(2)
    } // only this method in func_table
}
