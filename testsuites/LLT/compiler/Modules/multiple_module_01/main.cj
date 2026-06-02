// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ./pro2 ./pro1 ./src
// EXEC: %mkdir built/vendor/ii/pro2 && %mkdir built/vendor/i/pro1 && %mkdir built/vendor/cangjie/test
// EXEC: %compiler %compile_lib_opt %pkg_opt pro2/src/zoo -o built/vendor/ii/pro2/libzoo.%middle
// EXEC: %compiler %compile_lib_opt %pkg_opt pro1/src/xoo -o built/vendor/i/pro1/libxoo.%middle --import-path built/vendor/ii/pro2
// EXEC: %compiler %compile_lib_opt %pkg_opt pro1/src/yoo -o built/vendor/i/pro1/libyoo.%middle --import-path built/vendor/ii
// EXEC: %compiler %compile_lib_opt %pkg_opt src/aoo -o built/vendor/cangjie/test/libaoo.%middle --import-path built/vendor/ii --import-path built/vendor/i
// EXEC: %compiler %compile_lib_opt %pkg_opt src/boo -o built/vendor/cangjie/test/libboo.%middle --import-path built/vendor/ii --import-path built/vendor/i 
// (CJNATIVE) EXEC: %compiler %pkg_opt ./src -o built/vendor/cangjie/test built/vendor/cangjie/test/libboo.%middle built/vendor/cangjie/test/libaoo.%middle built/vendor/i/pro1/libyoo.%middle built/vendor/i/pro1/libxoo.%middle built/vendor/ii/pro2/libzoo.%middle --import-path built/vendor/ii/pro2 --import-path built/vendor/i/pro1 --import-path built/vendor/cangjie/test
// (not CJNATIVE) EXEC: %compiler %pkg_opt ./src -o built/vendor/cangjie/test built/vendor/cangjie/test/libboo.%middle built/vendor/cangjie/test/libaoo.%middle built/vendor/ii/pro2/libzoo.%middle built/vendor/i/pro1/libyoo.%middle built/vendor/i/pro1/libxoo.%middle --import-path built/vendor/ii/pro2 --import-path built/vendor/i/pro1 --import-path built/vendor/cangjie/test
// EXEC: cd ./built/vendor/cangjie/test/ && %run %main
