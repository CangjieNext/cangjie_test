// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DT point#7 property getter/setter rearrange.
// GetRealMemberDecl splits a prop's read/write targets into two FuncDecls (getter/setter),
// and GetInstantiatedMemberTarget rearranges each to its instantiated version.
// This case: a generic class prop; after instantiation, call both the getter and the setter,
// asserting both are rearranged to the correct instantiated version (no "undefined symbol").
// EXEC: %compiler %cmp_opt %enableO2 %f -o %output
// EXEC: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan get=42
// ASSERT: scan set=ok

public class Holder<T> {
    var v: T
    public mut prop val: T {
        get() {
            v
        }
        set(x) {
            v = x
        }
    }
    public init(v: T) {
        this.v = v
    }
}

main() {
    var h = Holder<Int64>(0)
    h.val = 42
    println("set=ok")
    println("get=${h.val}")
    0
}
