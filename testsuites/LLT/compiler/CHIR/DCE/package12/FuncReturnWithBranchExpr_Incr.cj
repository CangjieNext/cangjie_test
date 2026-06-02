// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and DEBUG_OPTION) DEPENDENCE: %n.old.cj %n.new.cj
// (CJNATIVE and DEBUG_OPTION) EXEC: %compiler %cmp_opt %n.old.cj -o %output
// (CJNATIVE and DEBUG_OPTION) EXEC: %run %run_opt %output %run_args
// (CJNATIVE and DEBUG_OPTION) EXEC: %move %n.old.cj %n.old.cj.bak
// (CJNATIVE and DEBUG_OPTION) EXEC: %cpfile %n.new.cj %n.old.cj
// (CJNATIVE and DEBUG_OPTION) EXEC-PIPE-0: %compiler %disableReflection %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// (CJNATIVE and DEBUG_OPTION) ASSERT: scan-not warning: unused function:'test'
// (CJNATIVE and DEBUG_OPTION) EXEC: %run %run_opt %output %run_args
// (CJNATIVE and DEBUG_OPTION) EXEC: %move %n.old.cj.bak %n.old.cj

