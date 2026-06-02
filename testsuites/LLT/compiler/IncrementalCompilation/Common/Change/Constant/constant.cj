// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %cpfile %n.old.cj %n.inc.cj
// (not Windows) EXEC: cjc --experimental --incremental-compile --error-count-limit=all --diagnostic-format=noColor  -O0 --fast-math --fchir-devirtualization --fno-chir-devirtualization --fno-chir-function-inlining --fchir-function-inlining --fchir-constant-propagation --fno-obf-layout --fno-obf-cf-flatten --fobf-cf-bogus --fno-obf-cf-bogus --fobf-layout %n.inc.cj -o %output
// (Windows) EXEC: cjc --experimental --incremental-compile --error-count-limit=all --diagnostic-format=noColor  -O0 --fast-math --fchir-devirtualization --fno-chir-devirtualization --fno-chir-function-inlining --fchir-function-inlining --fchir-constant-propagation %n.inc.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %cpfile %n.new.cj %n.inc.cj
// (not Windows) EXEC: cjc --experimental --incremental-compile --error-count-limit=all --diagnostic-format=noColor  -O0 --fast-math --fchir-devirtualization --fno-chir-devirtualization --fno-chir-function-inlining --fchir-function-inlining --fchir-constant-propagation --fno-obf-layout --fno-obf-cf-flatten --fobf-cf-bogus --fno-obf-cf-bogus --fobf-layout %n.inc.cj -o %output
// (Windows) EXEC: cjc --experimental --incremental-compile --error-count-limit=all --diagnostic-format=noColor  -O0 --fast-math --fchir-devirtualization --fno-chir-devirtualization --fno-chir-function-inlining --fchir-function-inlining --fchir-constant-propagation %n.inc.cj -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan-not core dumped

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
