/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not O2) EXEC: %compiler %cmp_opt %obf_layout --fno-obf-export-symbols %f -o %output
// (not O2) RUN-EXEC: %run %run_opt %output %run_args
// (not O2) EXEC: cat default.obf.map | compare %f
// ASSERT: regex-not .*default.*global_public_var.*
// ASSERT: regex-not .*default.*global_public_func.*
// ASSERT: regex-not .*default.*cls.*static_public_var.*
// ASSERT: regex-not .*default.*cls.*static_public_func.*
// ASSERT: regex-not .*default.*cls.*member_public_func.*
// ASSERT: regex-not .*default.*cls.*<init>.*
// (not iOS) ASSERT: regex-not .*default.*<main>.*
// (iOS) ASSERT: regex-not .*default.*cj_main.*

public var global_public_var: Int64 = 1
var global_var = 1

public func global_public_func() {
}

func global_func() {
}

public class cls {
    public static var static_public_var: Int64 = 1
    public static func static_public_func() {}
    public func member_public_func() {}
    static var static_var = 1
    static func static_func() {}
    func member_func() {}
}

main() {
    global_public_var
    global_public_func()
    cls.static_public_var
    cls.static_public_func()
    cls().member_public_func()
    global_var
    global_func()
    cls.static_var
    cls.static_func()
    cls().member_func()
    return 0
}
