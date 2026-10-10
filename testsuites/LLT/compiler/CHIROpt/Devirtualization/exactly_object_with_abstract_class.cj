// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(Class-_CN7default15EnvironmentZeroE&->@_CN7default15EnvironmentZero10TangentAddHv
// ASSERT: scan-not Invoke(Class-_CN7default15EnvironmentZeroE&->@_CN7default15EnvironmentZero10TangentAddHv

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
