// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_opt %f -o %output --cfg=APILevel_level=0

main() {
    @IfAvailable(level:19, { => println(0) }, {=>println(3)})
}

/* SCAN
error: import 'ohos.device_info' to use the 'IfAvailable' expression
  ==> err_without_import.cj:10:5:
   | 
10 |     @IfAvailable(level:19, { => println(0) }, {=>println(3)})
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
   | 
   # note: depend on declaration 'DeviceInfo'

1 error generated, 1 error printed.
*/
