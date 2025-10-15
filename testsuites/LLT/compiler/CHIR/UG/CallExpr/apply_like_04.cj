// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %enableCompileDebug %disInst %dumpCHIRDebug  %f -o %n.%suffix
// RUN-EXEC-0: %run %run_opt %output %run_args
// (not Windows and DEBUG_OPTION) EXEC-PIPE-0: %cat %n\_CHIR/0\_AST\_CHIR.chir | compare %f
// (not Windows and DEBUG_OPTION) ASSERT: regex ApplyWithException\(Struct-_CN7default2S1IG_E\<Generic-_CN7default2S1IG_E1TE\>\:\:@_CN7default2S1IG_E10staticFoo1Hv \: \(\) \-\> Int64, normal: #5, exception \[ Class-_CNat9ExceptionE \]: #3\)
// (not Windows and DEBUG_OPTION) ASSERT: regex ApplyWithException\(Struct-_CN7default2S1IG_E\<Generic-_CN7default5test3IG_HG_E1TE\>\:\:@_CN7default2S1IG_E10staticFoo1Hv \: \(\) \-\> Int64, normal: #5, exception \[ Class-_CNat9ExceptionE \]: #3\)

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
        // ApplyWithException(@_CN7default2S1IG_E10staticFoo1Hv, normal: #5, exception [ Class-_CNat9ExceptionE ]: #3)(Struct-_CN7default2S1IG_EE<Generic-_CN7default2S1IG_E1TS5a0a_aE>, [], Int64)
        try {
            staticFoo1()
        } catch (_: Exception) {
        }
        return 0
    }
}

struct S2 {
    init() {}
    public static func staticFoo2<T>(x: T) {
        1
    }
}

func test3<T>(x: T) {
    // ApplyWithException(@_CN7default2S1IG_E10staticFoo1Hv, normal: #5, exception [ Class-_CNat9ExceptionE ]: #3)(Struct-_CN7default2S1IG_EE<Generic-_CN7default5test3IG_E1TS5a0c_aE>, [], Int64)
    try {
        S1<T>.staticFoo1()
    } catch (_: Exception) {
    }
    return 0
}

main() {
    0
}
