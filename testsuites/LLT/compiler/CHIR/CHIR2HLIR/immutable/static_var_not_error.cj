// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %f %compile_lib_opt 2>&1 | compare %f
// EXPECTED: regex-not error
public struct Aggregate815 {
    public static var var941: Int64 = 1;

    private mut func func838(): Unit {
        func func888(): Unit {
            var941
            ()
        }
    }
}
