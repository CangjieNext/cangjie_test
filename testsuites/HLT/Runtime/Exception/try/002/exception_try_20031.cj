/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

open class A0 <: Exception {}

open class A1 <: A0 {}

open class A2 <: A1 {}

open class A3 <: A2 {}

open class A4 <: A3 {}

open class A5 <: A4 {}

main() {
    try {
        Int64(1)
    } catch (_: A5) {
        true
    } catch (_: A4) {
        (1, 1)
    } catch (_: A3) {
        Float64(1)
    } catch (_: A2) {
        ()
    } catch (_: A1) {
        "a"
    } catch (_: A0) {
        'a'
    } finally {}
}
// ASSERT: scan sema_diag_report_error_message
