// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// case: common with const and foreign should be conflicted
// EXEC-PIPE-1: %compiler %diag_json --experimental %f --output-type=chir 2>&1 | compare %f
// ASSERT: scan-2 parse_conflict_modifier
package cmp
const common func foo():Unit{}
foreign common func goo():Unit
