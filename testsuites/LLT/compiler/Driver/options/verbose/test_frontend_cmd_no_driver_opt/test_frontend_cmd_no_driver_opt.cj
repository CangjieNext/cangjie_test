// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: a.c
//  EXEC: %clang -shared a.c -o liba.%dylib_suffix
// (not Darwin and CJNATIVE) EXEC-PIPE: %compiler %cmp_opt --verbose --strip-all --static-std --static-libs --link-options="-s" -L. -la -B. --target-cpu=generic --sysroot=/ --save-temps=. --experimental %f 2>&1 | compare %f
// (Darwin and CJNATIVE) EXEC: %compiler %cmp_opt --verbose --strip-all --static-std --static-libs --link-options="-s" -L. -la -B. --target-cpu=generic --sysroot=/ --save-temps=. --experimental %f 2>&1 | compare %f
// (not CJNATIVE) EXEC-PIPE: %compiler %cmp_opt --verbose --strip-all --link-options="-z now" -la --save-temps=. %f 2>&1 | compare %f
// ASSERT: regex-not cjc-frontend(.exe)?['"].*? "--strip-all
// ASSERT: regex-not cjc-frontend(.exe)?['"].*? "--static-std
// ASSERT: regex-not cjc-frontend(.exe)?['"].*? "--static-libs
// ASSERT: regex-not cjc-frontend(.exe)?['"].*? "--link-options
// ASSERT: regex-not cjc-frontend(.exe)?['"].*? "-L
// ASSERT: regex-not cjc-frontend(.exe)?['"].*? "-la
// ASSERT: regex-not cjc-frontend(.exe)?['"].*? "-B
// ASSERT: regex-not cjc-frontend(.exe)?['"].*? "--target-cpu=generic
// ASSERT: regex-not cjc-frontend(.exe)?['"].*? "--sysroot=
// ASSERT: regex-not cjc-frontend(.exe)?['"].*? "--save-temps=
// ASSERT: regex cjc-frontend(.exe)?['"].*? ['"]--verbose
//  ASSERT: regex cjc-frontend(.exe)?['"].*? ['"]--experimental

foreign func Hello(): Unit

main() {
    unsafe { Hello() }
    return 0
}
