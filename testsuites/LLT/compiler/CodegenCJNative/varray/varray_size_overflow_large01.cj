// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Companion to varray_size_overflow_wrap01: N = Int64 max (9223372036854775807),
// element Int64 (8 bytes). N * 8 still overflows uint64, but it wraps to a value
// that stays above 2GB, so the fix deliberately leaves it to the existing 2GB
// stacksize guard (whose "stacksize ... exceeds cangjie max stacksize(2GB)"
// message must keep firing), instead of reporting the wraparound.
// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output
// (not iOS) ASSERT: scan The stacksize of default::main() exceeds cangjie max stacksize(2GB)
// (iOS) ASSERT: scan The stacksize of default::cangjie_main() exceeds cangjie max stacksize(2GB)

main(): Int64 {
    var varr: VArray<Int64, $9223372036854775807> = VArray<Int64, $9223372036854775807> {i => i + 1}
    if (varr.size == 9223372036854775807) {
        return varr[0] - 1
    }
    return 1
}
