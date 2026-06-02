// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f %enableCompileDebug -o %output
// RUN-EXEC: %run %run_opt %output %run_args

public let aaaa: Option<S_1> = Option<S_1>.None

public enum EEE {
    defaultValue
    | ctor_1(Option<S_1>)
    | ctor_2(S_2)
    | ctor_3(Option<EEE>)
}

public struct S_1 {
    private let member_1: Option<EEE> = Option<EEE>.None;
}

public struct S_2 {
    var member_3: Option<S_1> = Option<S_1>.None
}

main(): Int64 {
    return 0;
}
