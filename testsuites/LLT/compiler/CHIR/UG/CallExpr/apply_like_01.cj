// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %enableCompileDebug %disInst %dumpCHIRDebug  %f -o %n.%suffix
// RUN-EXEC-0: %run %run_opt %output %run_args
// (not Windows and DEBUG_OPTION) EXEC-PIPE-0: %cat %n\_CHIR/0\_AST\_CHIR.chir | %grep Apply | compare %f
// (not Windows) ASSERT: scan-1 Apply(ThisType: Struct-_CN7default2S1IG_E<Generic-_CN7default2S1IG_E1TE>, @_CN7default2S1IG_E10staticFoo1Hv) // loc: "apply_like_01.cj"-18-9
// (not Windows) ASSERT: scan-1 Apply(ThisType: Struct-_CN7default2S1IG_E<Generic-_CN7default5test3IG_HG_E1TE>, @_CN7default2S1IG_E10staticFoo1Hv) // loc: "apply_like_01.cj"-29-5

struct S1<T> {
    var x: T
    var z: Int64
    init(y: T) {
        x = y
        z = 12
    }

    public static func staticFoo1() {
        1
    }
    public func foo() {
        // Apply(@_CN7default2S1IG_10staticFoo1Hv)(Struct-_CN7default2S1IG_E<Generic-_CN7default2S1IG_1TS5a0a_aE>, [], Int64)
        staticFoo1()
    }
}

struct S2 {
    init() {}
    public static func staticFoo2<T>(x: T) {
        1
    }
}

func test3<T>(x: T) {
    // Apply(@_CN7default2S1IG_10staticFoo1Hv)(Struct-_CN7default2S1IG_E<Generic-_CN7default5test3IG_1TS5a0c_aE>, [], Int64)
    S1<T>.staticFoo1()
}

main() {
    0
}
