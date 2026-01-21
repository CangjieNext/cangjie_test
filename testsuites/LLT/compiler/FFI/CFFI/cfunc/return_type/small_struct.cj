// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (aarch64) EXEC: %compiler %cmp_opt %f

@C
struct SmallStruct {
    SmallStruct(let a: Int32) {}
}

@C
func f(): SmallStruct {
    return SmallStruct(Int32(1))
}

unsafe main() {
    f()
    return
}
