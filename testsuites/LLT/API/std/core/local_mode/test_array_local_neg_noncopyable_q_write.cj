/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// LEVEL: 0
// DEPENDENCE: ./local_mode_utils.cj
// EXPECTED-COMPILE-FAIL: T129 non-Copyable Array<String> @local? []= must be rejected by the Copyable constraint/mode contract
// DISABLED-EXEC: %compiler %cmp_opt ./local_mode_utils.cj %f -o %output
// DISABLED-EXEC: %run %run_opt %output %run_args
//
// This is the intentional T129 language negative. It is not a runtime-barrier case:
// Array<String> is non-Copyable, so the @local? mutation extension must not be selected.
// On the 0907 SDK the observed diagnostic is "cannot assign to this subscript expression"
// with a note suggesting `operator func[](this @local?, index0: Int64,
// value!: Struct-String @local?)`; the missing overload makes this SKIP-SOURCE rather
// than the target bound diagnostic.

main(): Int64 {
    let receiver: Array<String> @local? = ["before"]
    let replacement: String @local? = "after"
    receiver[0] = replacement
    0
}
