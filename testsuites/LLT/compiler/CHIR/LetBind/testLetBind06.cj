// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC-6: %run %run_opt %output %run_args
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

struct TokenCB {
    var depth: UInt8
    var offset_raw: UInt32
    var length_raw: UInt32
    init(depth: UInt8, offset: UInt32, length: UInt32) {
        this.depth = depth
        this.offset_raw = offset
        this.length_raw = length
    }
    mut prop length: Int64 {
        get() {
            Int64(length_raw)
        }
        set(v) {
            length_raw = UInt32(v)
        }
    }
    mut prop offset: Int64 {
        get() {
            Int64(offset_raw)
        }
        set(v) {
            offset_raw = UInt32(v)
        }
    }
}

main() {
    var cb = TokenCB(1, 2, 3)
    cb.length += cb.length
    cb.length
}
