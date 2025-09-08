// EXEC: %compiler %incrementalCompile %cmp_opt %f -o %output
// EXEC: %compiler %incrementalCompile %cmp_opt %f -o %output %incrementalCompile 2>&1 | compare %f
// ASSERT: scan no change
// ASSERT: scan-not found duplicating decl, rollback

main(): Unit {}
class A<T> {}
enum B {R|K(Int64)}

interface IA {
    func foo(): Int64 
}

extend<T> A<T> <: IA {
    public func foo(): Int64 { 1 }
}
extend B <: IA {
    public func foo(): Int64 { 3 }
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
