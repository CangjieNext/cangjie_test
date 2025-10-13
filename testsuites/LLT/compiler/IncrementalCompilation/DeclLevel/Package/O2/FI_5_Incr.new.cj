package inc
@Frozen
public func foo(){
    return 3
}

// ASSERT: scan changed decls to recompile: 1
// ASSERT: scan the changed decl after Spreading is:foo in file FI_5_Incr.old.cj in line 3 in column 13

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
