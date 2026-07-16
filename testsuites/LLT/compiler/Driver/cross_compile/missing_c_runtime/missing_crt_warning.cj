// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Negative case for the OpenHarmony cross-compile driver diagnostic added in
// Ohos_CJNATIVE::GenerateLinking (WarnIfCRuntimeMissing / DiagnoseMissingCRuntime).
//
// The OHOS C runtime search path is built solely from -B/--toolchain (see
// Ohos_CJNATIVE::AddCRuntimeLibraryPaths). With none supplied the path is empty, so the
// start object 'crti.o' can never be resolved and the link would otherwise fail with a
// cryptic "ld.lld: error: cannot open crti.o". The driver must instead emit an actionable
// warning pointing at --sysroot / -B / --toolchain BEFORE the raw linker error.
//
// The case is link-only (a dummy object is fed as input) so it exercises the OHOS
// link-command generation without needing OHOS std modules, and stays deterministic on any
// host: no -B means the C runtime path is empty everywhere.

// (CJNATIVE and not Windows) EXEC: %touch dummy.o
// (CJNATIVE and not Windows) ERRCHECK: %compiler %cmp_opt --experimental dummy.o --target=x86_64-linux-ohos --output-type=dylib -o %n.so
// (CJNATIVE and not Windows) ASSERT: scan cannot find the OpenHarmony C runtime object 'crti.o'

main() {
    return 0
}
