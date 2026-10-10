// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (x86 or arm or aarch64) EXEC: %cjc -j1 %cmp_opt %enableO2 %f --save-temps . --output-type=staticlib -o %output
// (x86 or arm or aarch64) EXEC-PIPE: %cat %n.s 2>&1 | compare %f
// (x86 or arm or aarch64) ASSERT: regex \b(b|jmpq?)\s+_?CJ_MCC_N2CStub\b
// (x86 or arm or aarch64) ASSERT: regex \b(bl|callq?)\s+_?CJ_MCC_C2NStub\b
// (x86 or arm or aarch64) ASSERT: regex-not \b(b|jmpq?)\s+_?CJ_MCC_C2NStub\b

foreign func c_foo(): Unit

@C
public func cj_entry(): Unit {
    unsafe {
        c_foo()
    }
}
