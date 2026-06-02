// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: canIUse.cj device_info.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt canIUse.cj -o canIUse.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt device_info.cj -o device_info.%middle
// ERRCHECK: %compiler %cmp_opt %f canIUse.%middle device_info.%middle

import ohos.device_info
import ohos.base

main() {
    @IfAvailable(level: 21, {=>}, {=>})
    @IfAvailable(syscap: "x", {=>}, {=>})
}

/* SCAN-IN
error: undeclared identifier 'DeviceInfo'
  ==> err_import_of_ifavailable.cj:16:5:
   | 
16 |     @IfAvailable(level: 21, {=>}, {=>})
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
   | 

error: undeclared identifier 'canIUse'
  ==> err_import_of_ifavailable.cj:17:5:
   | 
17 |     @IfAvailable(syscap: "x", {=>}, {=>})
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
   | 
*/