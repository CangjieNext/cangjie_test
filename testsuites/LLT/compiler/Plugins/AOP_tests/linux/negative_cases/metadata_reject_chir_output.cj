// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
// See https://cangjie-lang.cn/pages/LICENSE for license information.
//
// Direct CHIR output is CJMP common compilation, not a supported metadata mode.
// Keep the explicit diagnostic instead of returning incomplete annotation data.
// (CJNATIVE and Linux)EXEC-PIPE-1: %compiler %cmp_opt %f --experimental --emit-chir-annotation-metadata --output-type=chir -o %output 2>&1 | compare %f
// ASSERT: scan error: resolved CHIR annotation metadata requires full cjnative compilation with constant evaluation enabled
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

public func subject(): Unit {}
