/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_01_a01_01

  @Level:         3
  @Assertion:    15.1(1) Cangjie provides preemptive multitasking, where
                 Cangjie threads are fundamental execution units. Cangjie
                 threads are managed by Cangjie runtime, which are not native
                 threads (like operating system threads). Thread will be used
                 for short when there are no ambiguities. Each thread is of the
                 following features.
                 • Each thread may be preempted by another thread at any time
                 during its execution.

  @Description:  Checks that 6 threads will interrupt each other

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: aux_test_a01.cj

*/

main(): Int64 {
    test_body(6, 32 * 1024)
}
