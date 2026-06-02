/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt  %f -o %output  2>&1 | compare %f

open enum TimeUnit1 {
      Hour
}

private enum TimeUnit3 {
      Hour
}

protected enum TimeUnit4 {
      Hour
}

abstract enum TimeUnit5 {
      Hour
}

static enum TimeUnit6 {
      Hour
}

override enum TimeUnit7 {
      Hour
}

operator enum TimeUnit8 {
      Hour
}

 enum TimeUnit9 {  Hour
}
// ASSERT: scan parse_illegal_modifier_in_scope
