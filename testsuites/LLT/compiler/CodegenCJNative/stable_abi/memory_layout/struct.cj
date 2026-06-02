// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC: %compiler %cmp_opt %f --save-temps . -j1 --apc=1 --output-type=staticlib
// (CJNATIVE) EXEC: %llvmDissembler %n.bc -o %n.ll
// (CJNATIVE) EXEC: %cat %n.ll 2>&1 | compare %f
// (CJNATIVE) ASSERT: regex %"record\.default:SA" = type { i16, i64, i8 }
// (CJNATIVE) ASSERT: regex @"default:SA\.ti" = global %TypeInfo {.*}, !RelatedType !(?P<id>[0-9]+)
// (CJNATIVE) ASSERT: regex !(?P=id) = !{!"record\.default:SA"}

public struct SA {
    let a: Int16
    let b: Int64
    let c: UInt8

    public init(a: Int16, b: Int64, c: UInt8) {
        this.a = a
        this.b = b
        this.c = c
    }
}

public let aaa: SA = SA(33, 55, 1)
