// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Coverage: string-typed level argument to @IfAvailable that violates the
// expected major[.minor[.patch]] format.  Each case emits
// sema_apilevel_invalid_version_format (error); compilation fails (exit non-0).

// DEPENDENCE: api_available.cj level_syscap_check/device_info.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt api_available.cj device_info.cj -o device_info.%middle
// ERRCHECK: %compiler %cmp_opt %diag_json %f device_info.%middle -o %output
// ASSERT: scan-6 sema_apilevel_invalid_version_format

import ohos.device_info.apiAvailable
import ohos.device_info.DeviceInfo

main(): Int64 {
    // 1-segment (TRIPLE_ONLY spec rejects single integer as string)
    @IfAvailable(level: "20", { => 1 }, { => 0 })
    // 2-segment
    @IfAvailable(level: "20.1", { => 1 }, { => 0 })
    // leading zeros in patch
    @IfAvailable(level: "20.01.02", { => 1 }, { => 0 })
    // major out of range (>=100)
    @IfAvailable(level: "100.0.0", { => 1 }, { => 0 })
    // non-decimal notation
    @IfAvailable(level: "0x1A.0.0", { => 1 }, { => 0 })
    // empty string
    @IfAvailable(level: "", { => 1 }, { => 0 })
    0
}
