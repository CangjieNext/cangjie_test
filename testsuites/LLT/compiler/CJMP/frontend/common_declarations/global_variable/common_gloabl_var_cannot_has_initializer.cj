// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// case: common with const and foreign should be conflicted
// EXEC-0: %compiler %noColor --experimental %f --output-type=chir 2>&1 | compare %f
package cmp
public common let a:Int32
/*SCAN
*/