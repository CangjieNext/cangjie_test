// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: api_available.cj level_syscap_check/device_info.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt api_available.cj -o api_available.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt device_info.cj -o device_info.%middle
// ERRCHECK: %compiler %cmp_opt %diag_json -Woff unused %f api_available.%middle device_info.%middle -o %output
// ASSERT: scan-1 sema_use_expr_without_import
// ASSERT: scan-1 apiAvailable

import ohos.device_info.DeviceInfo

main() {
    @IfAvailable(level: 21, { => }, { => })
    0
}
