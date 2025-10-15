// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
// (CJNATIVE and DEBUG_OPTION) EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt --int-overflow=wrapping --apc=1 %n.cj 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan define i64 @_CN7default3Foo1apgHv
// (CJNATIVE) ASSERT: scan define void @_CN7default3Foo1apsHl
// (CJNATIVE) ASSERT: scan define internal void @"_CN7defaultUpropClass$4Base1tpsHl"

class Foo {
    public mut prop a: Int64 {
        get() {
            0
        }
        set(v) {}
    }
}

private class Base {
    public mut prop t: Int64 {
        get() {
            0
        }
        set(v) {}
    }
    public func g(a: String) {
        print(a)
    }
}

main() {
    var b = Base()
    b.t = 3
    0
}
