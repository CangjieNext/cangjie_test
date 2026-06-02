package inc
@Frozen
public func foo(){
    return 0
}
@Frozen
public func fuzz(){
    return 3
}

// ASSERT: scan changed decls to recompile: 1
// ASSERT: scan the changed decl after Spreading is:fuzz in file FI_9_Incr.old.cj in line 7 in column 13


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
