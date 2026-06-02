// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %enableDevirtualization -Woff all %f -o %n.%suffix 2>&1 | compare %f
// (DEBUG_OPTION)EXEC-PIPE-0: %run %run_opt %output %run_args
// ASSERT: scan [Devirtualization] The function call to TangentAdd at [25,12] was optimized.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

public abstract class EnvironmentTangent {
    public func TangentAdd(): Int64
}

public class EnvironmentZero <: EnvironmentTangent {
    public func TangentAdd(): Int64 {
        return 10
    }
}

main() {
    var x: EnvironmentTangent = EnvironmentZero()
    return x.TangentAdd() - 10 // invoke -> apply
}
