// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../api_available.cj ../level_syscap_check/device_info.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt api_available.cj device_info.cj -o device_info.%middle
// EXEC: %compiler %noColor %cmp_opt %compile_lib_opt %f device_info.%middle -Woff unused -o %output --cfg=APILevel_level=26.0.0 --dump-chir --dump-to-screen | compare %f
// ASSERT: scan apiAvailable

import ohos.device_info.apiAvailable
import ohos.device_info.DeviceInfo

main() {
    // compatibleSDKVersion >= 26.0.0: expect runtime gate to keep apiAvailable(26)
    @IfAvailable(level: 26, { => 1 }, { => 0 })
}
