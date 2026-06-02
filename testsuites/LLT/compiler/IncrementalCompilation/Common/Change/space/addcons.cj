// DEPENDENCE: com.old.cj %n.new.cj cast.c
// EXEC: %clang %clang_opt %clang_shared_opt ./cast.c -o %cffi_output
// EXEC: %cpfile com.old.cj %n.inc.cj
// EXEC: %compiler %incrementalCompile %n.inc.cj %cffi-link -o %output -Woff unused
// EXEC: %pwd_to_ld_path %run %run_opt %output %run_args
// EXEC: %cpfile %n.new.cj %n.inc.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %n.inc.cj %cffi-link -o %output -Woff unused 2>&1 
// EXEC-PIPE-0: %pwd_to_ld_path %run %run_opt %output %run_args


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
