// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (not CJNATIVE and DEBUG_OPTION) EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt %compile_lib_opt %n.cj 2>&1 | compare %f

// (not CJNATIVE) ASSERT: regex @_ZN7default1aE = global i64 1, align 8
// (not CJNATIVE) ASSERT: regex-auto @_ZN7default2a1E = global i64 2, align 8
// (not CJNATIVE) ASSERT: regex @_ZN7default2CA1bE = global i1 true, align 8
// (not CJNATIVE) ASSERT: regex-auto @_ZN7default2CA2b1E = global i1 false, align 8
// (not CJNATIVE) ASSERT: regex @_ZN7default2SA1cE = global i32 99, align 8
// (not CJNATIVE) ASSERT: regex-auto @_ZN7default2SA2c1E = global i32 100, align 8
// (not CJNATIVE) ASSERT: regex @_ZN7default2saE = global %record\._ZN7default2SAE zeroinitializer, align 8
// (not CJNATIVE) ASSERT: regex @_ZN7default2caE = global %Ref.Type zeroinitializer, align 8
// (not CJNATIVE) ASSERT: regex-auto attributes #0 = { readonly }

public let a = 1
public var a1 = 2

public class CA {
    public static let b = true
    public static var b1 = false
    let k = 9
}

public struct SA {
    public static let c = r'c'
    public static var c1 = r'd'
    let k = 9
}

public let sa = SA()
public let ca = CA()

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
