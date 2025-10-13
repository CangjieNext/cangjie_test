package inc

public enum A {
    |a|b 



}

let z = A.a

func foo(){
    let a:A
}

// ASSERT: scan deleted decls: 1
// ASSERT: scan the deleted decl is:3inc1AU4fuzzF$$l


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
