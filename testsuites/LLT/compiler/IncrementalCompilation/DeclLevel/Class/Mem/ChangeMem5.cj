// DEPENDENCE: %n.old.cj %n.new.cj

// (Linux) EXEC: %compiler %incrementalCompile %cmp_opt --error-count-limit=all --diagnostic-format=noColor -O1 --fast-math --fchir-function-inlining --fno-chir-devirtualization --fobf-string --fobf-cf-flatten --fno-obf-layout --fno-obf-const --fno-obf-cf-flatten --fobf-layout --fobf-cf-bogus --fobf-const --fno-obf-cf-bogus --fobf-all %n.old.cj -o %output
// (Darwin) EXEC: %compiler %incrementalCompile %cmp_opt --error-count-limit=all --diagnostic-format=noColor -O1 --fast-math --fchir-function-inlining --fno-chir-devirtualization %n.old.cj -o %output
// (Windows) EXEC: %compiler %incrementalCompile %cmp_opt --error-count-limit=all --diagnostic-format=noColor -O1 --fast-math --fchir-function-inlining --fno-chir-devirtualization %n.old.cj -o %output
// EXEC-1: %run %run_opt %output %run_args

// EXEC: %rmfile %n.old.cj
// EXEC: %cpfile %n.new.cj %n.old.cj

// (Linux) EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt --error-count-limit=all --diagnostic-format=noColor -O1 --fast-math --fchir-function-inlining --fno-chir-devirtualization --fobf-string --fobf-cf-flatten --fno-obf-layout --fno-obf-const --fno-obf-cf-flatten --fobf-layout --fobf-cf-bogus --fobf-const --fno-obf-cf-bogus --fobf-all %n.old.cj -o %output 2>&1 | compare %f
// (Darwin) EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt --error-count-limit=all --diagnostic-format=noColor -O1 --fast-math --fchir-function-inlining --fno-chir-devirtualization %n.old.cj -o %output 2>&1 | compare %f
// (Windows) EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt --error-count-limit=all --diagnostic-format=noColor -O1 --fast-math --fchir-function-inlining --fno-chir-devirtualization %n.old.cj -o %output 2>&1 | compare %f
// EXEC-1: %run %run_opt %output %run_args


// ASSERT: scan closure convert out func recompile, roll back to full compilation


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
