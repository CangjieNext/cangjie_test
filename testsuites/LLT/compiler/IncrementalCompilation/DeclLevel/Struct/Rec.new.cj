package p1

public struct A {
    public A(let b: B) {}
}

public struct B {
    public B(let b: E1) {}
}

public enum E1 {
    R|K(A)
}

public func getValue(a: Int64) { a }
public func getValue(a: E1): Int64 {
    if (let K(r) <- a) {
        getValue(r.b.b) + 1
    } else {
        -1
    }
}

public func u1(): Int64 {
    getValue(K(A(B(R))))
}

// ASSERT: scan changed decls to recompile: 7
// ASSERT: scan the changed decl after Spreading is:A in file Rec.old.cj in line 4 in column 12
// ASSERT: scan the changed decl after Spreading is:b in file Rec.old.cj in line 4 in column 18
// ASSERT: scan the changed decl after Spreading is:B in file Rec.old.cj in line 7 in column 15
// ASSERT: scan the changed decl after Spreading is:B in file Rec.old.cj in line 8 in column 12
// ASSERT: scan the changed decl after Spreading is:b in file Rec.old.cj in line 8 in column 18
// ASSERT: scan the changed decl after Spreading is:getValue in file Rec.old.cj in line 16 in column 13
// ASSERT: scan the changed decl after Spreading is:u1 in file Rec.old.cj in line 24 in column 13


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
