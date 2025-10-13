// LEVEL: 0
// EXEC-PIPE-0: %compiler %enableO2 %cmp_opt %compile_lib_opt %n.cj 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

package pkg
public interface I {
    operator func +(right: Int32): Int64
}
extend Int64 <: I {
    public operator func + (right: Int32): Int64 {
        return this + Int64(right)
    }
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
