// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ./test.c
// (not CJNATIVE) EXEC: %clang %clang_opt test.c -o test.o
// (not CJNATIVE) EXEC: %compiler --output-type=exe %save_temps_opt=. %f test.o -o %n
// (not CJNATIVE) EXEC: %compiler --output-type=exe %n.o test.o -o main
// (not CJNATIVE) EXEC: ./main | compare %f
// (not CJNATIVE) ASSERT: regex-auto 12345

// This testcase tests passing *multiple* object files to cjc when using not-CJNATIVE BE.
// cjc will only invoke ld to do a link job.
foreign func test(): Int32

main() {
    unsafe { println(test()) }
}
