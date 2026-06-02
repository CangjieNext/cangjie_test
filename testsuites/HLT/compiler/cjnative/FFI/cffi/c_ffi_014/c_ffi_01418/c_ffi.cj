/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// DEPENDENCE: %n.c
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC-PIPE-1: %compiler %cmp_opt %ffic_opt -o %output 2>&1 | compare %f

enum RGBColor {
    | Red | Green | Blue

    @CallingConv[CDECL]
    public static func getNum1(): Int8 {
        return 1
    }

    @CallingConv[CDECL]
    func getNum2(): Int8 {
        return 2
    }

    @CallingConv[CDECL]
    @C
    func getNum3(): Int8 {
        return 3
    }
}

main() {}
// ASSERT: scan sema_illegal_scope_use_of_annotation
