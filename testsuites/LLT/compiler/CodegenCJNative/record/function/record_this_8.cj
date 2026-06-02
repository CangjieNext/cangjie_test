// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt %compile_lib_opt %n.cj 2>&1 | compare %f

// ASSERT: regex-begin define void @\"_CN7default2SA6\<init\>Hv\"
// ASSERT: regex-after store i64 6, i64 addrspace\(1\)\*

// ASSERT: regex-begin define void @\"_CN7default2SA6\<init\>Hl\"
// ASSERT: regex-after store i64 %a, i64 addrspace\(1\)\*

public struct SA {
    public SA(let a!: Int64 = 1) {}
    public init() {
        a = 6
    }
}
