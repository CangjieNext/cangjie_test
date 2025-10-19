// (LLVM and Darwin) EXEC-PIPE-1: %compiler %cmp_opt %enable_objc_cjmapping %diag_json %f -o %output %compile_shared_lib_opt %import_objc_interop 2>& 1 | compare %f

// ASSERT: ASSERT: scan-not error

public struct data {
    public let x: Int32
    public let y: Int32

    public init(x: Int32, y: Int32) {
        this.x = x
        this.y = y
    }
}
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

