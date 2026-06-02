// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (not Windows and not Darwin) DEPENDENCE: cffi.old.cj cffi.new.cj c_ffi.old.c c_ffi.new.c
// (not Windows and not Darwin) EXEC: %clang %clang_opt c_ffi.old.c -o libc_ffi.so -fPIC
// (not Windows and not Darwin) EXEC: %compiler %incrementalCompile --lto=full  -L . -l c_ffi cffi.old.cj -o %output

// (not Windows and not Darwin) EXEC: %rmfile cffi.old.cj c_ffi.old.c
// (not Windows and not Darwin) EXEC: %move cffi.new.cj cffi.old.cj
// (not Windows and not Darwin) EXEC: %move c_ffi.new.c c_ffi.old.c

// (not Windows and not Darwin) EXEC: %clang %clang_opt c_ffi.old.c -o libc_ffi.so -fPIC
// (not Windows and not Darwin) EXEC: %compiler %incrementalCompile --lto=full -L . -l c_ffi cffi.old.cj -o %output
// (not Windows and not Darwin) RUN-EXEC: %run %run_opt %output %run_args
