// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (not Darwin)LEVEL: 0
// (not Darwin)EXEC: %compiler %cmp_opt %n.cj -o %output

public struct S { public const init() {} }

@Annotation
public class A { public const init(p: S) {} }

public class C {
    private var f: Int64 = 0
    @A[S()]
    public mut prop p: Int64 {
        get() { f }
        set(v) { f = v }
    }
}

main() {
    0
}
