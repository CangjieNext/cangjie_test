// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ./testpkg.cj
// (not CJNATIVE) EXEC: %compiler %frontend_opt testpkg.cj -o testpkg.bc
// (not CJNATIVE) EXEC: %compiler --output-type=exe %save_temps_opt=. testpkg.bc %f -o %n
// (not CJNATIVE) EXEC: %compiler --output-type=exe %n.o -o main
// (not CJNATIVE) EXEC: ./main | compare %f
// (not CJNATIVE) ASSERT: regex-auto object_file_001

// This testcase tests passing *1* object file only to cjc when using not-CJNATIVE BE.
// cjc will only invoke ld to do a link job.
internal import test.*

main() {
    println(testString)
}
