// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

public var var8: Int8 = Int8(-118);
public let var13: Unit = ();

main(): Int64 {
    match ((var8--)) {
        case var13 => 126
        case caseVar18 => (-83)
        case _ => (-58)
    };

    return 0;
}
