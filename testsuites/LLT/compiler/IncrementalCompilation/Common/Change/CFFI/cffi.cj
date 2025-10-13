// DEPENDENCE: old.cj new.cj cast.c
// EXEC: %clang %clang_opt ./cast.c -o %cffi_output

// EXEC: %cpfile old.cj %n.inc.cj
// EXEC: %compiler %incrementalCompile %n.inc.cj %cffi-link -o %output -Woff unused
// RUN-EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output %run_args

// EXEC: %cpfile new.cj %n.inc.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %n.inc.cj %cffi-link -o %output -Woff unused 2>&1 
// RUN-EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output %run_args


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
