// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %enableCompileDebug %dumpCHIRDebug %f -o %n.%suffix
// RUN-EXEC-0: %run %run_opt %output %run_args
// (not Windows and DEBUG_OPTION) EXEC-PIPE-0: %cat %n\_CHIR/0\_AST\_CHIR.chir | compare %f
// (not Windows and DEBUG_OPTION) ASSERT: regex InstanceOf\(%0, Enum-_CN7default2EAIG_E<Bool>\)

public enum EA<T> {
    Case1(T) | Case2(Int8, Bool) | Case3
}

func testIs2<T>(x: EA<T>) {
    if (x is EA<Bool>) {
        1
    } else {
        2
    }
}

main() {
    0
}
