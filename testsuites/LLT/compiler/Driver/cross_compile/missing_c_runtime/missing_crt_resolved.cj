// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Positive (no-false-positive) counterpart of missing_crt_warning.cj.
//
// When a -B/--toolchain path DOES provide 'crti.o', DiagnoseMissingCRuntime resolves it and
// the OpenHarmony C runtime warning must stay silent. We mock a toolchain dir containing an
// empty crti.o and pass it via -B; the link still fails for other reasons (the mocked crt is
// not a real object), but the specific 'crti.o' diagnostic must NOT appear.

// (CJNATIVE and not Windows) EXEC: %rmdir crtdir && mkdir crtdir
// (CJNATIVE and not Windows) EXEC: %touch dummy.o crtdir/crti.o
// (CJNATIVE and not Windows) ERRCHECK: %compiler %cmp_opt --experimental dummy.o --target=x86_64-linux-ohos --output-type=dylib -B ./crtdir -o %n.so
// (CJNATIVE and not Windows) ASSERT: scan-not cannot find the OpenHarmony C runtime object 'crti.o'

main() {
    return 0
}
