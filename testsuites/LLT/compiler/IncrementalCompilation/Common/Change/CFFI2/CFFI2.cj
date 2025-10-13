// DEPENDENCE: %n.old.cj %n.new.cj c_ffi.c
// EXEC: %clang %clang_opt ./c_ffi.c -o %cffi_output

// EXEC: %cpfile %n.old.cj %n.inc.cj
// (not Windows) EXEC: %compiler %incrementalCompile %n.inc.cj --lto=full  --error-count-limit=all --diagnostic-format=noColor %cffi-link -o %output
// (Windows) EXEC: %compiler %incrementalCompile %n.inc.cj --error-count-limit=all --diagnostic-format=noColor %cffi-link -o %output

// EXEC: %cpfile %n.new.cj %n.inc.cj
// (not Windows) EXEC: %compiler %incrementalCompile %n.inc.cj --lto=full  --error-count-limit=all --diagnostic-format=noColor %cffi-link -o %output %f 2>&1 | compare %f
// (Windows) EXEC: %compiler %incrementalCompile %n.inc.cj --error-count-limit=all --diagnostic-format=noColor %cffi-link -o %output %f 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace



// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
