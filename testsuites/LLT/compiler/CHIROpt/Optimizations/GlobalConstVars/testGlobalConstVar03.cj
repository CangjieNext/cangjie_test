// (CJNATIVE) EXEC-PIPE-0: %compiler %debugCHIROpt %enableO2 %n.cj --disable-reflection -o %output 2>&1 | compare %f
// (CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args
// (CJNATIVE) ASSERT: scan The deref node in the line:16 and the column:5 was optimized by The opt: Constant Propagation
// (CJNATIVE) ASSERT: scan-not The deref node in the line:16 and the column:16 was optimized by The opt: Constant Propagation
// (CJNATIVE) ASSERT: scan-not core dumped
// (CJNATIVE) ASSERT: scan-not stack trace
// (CJNATIVE and Linux) EXEC-1: %llvmELFReader -s %output | grep x99abc
// (CJNATIVE and Windows) EXEC-1: %llvmELFReader -s %output | findstr x99abc

class C {
    public static let x99abc: Int64 = 100
    public static var y: Int64 = 100
}

main() {
    C.x99abc - C.y
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
