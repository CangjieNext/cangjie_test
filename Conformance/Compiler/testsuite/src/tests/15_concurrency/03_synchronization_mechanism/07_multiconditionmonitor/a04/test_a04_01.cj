/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_07_a04_01

  @Level:         1
  @Assertion:    15.3.7(4) Please note that a user must not pass a ConditionID
                 returned by one instance of MultiConditionMonitor to other
                 instances or create ConditionIDs manually (e.g. using unsafe
                 tricks). ConditionID contains data (it can be, for instance,
                 an index in an internal array, direct address of an internal
                 queue, or any other kind of data) which associates with its
                 creator MultiConditionMonitor, so passing a “foreign”
                 ConditionID to a MultiConditionMonitor results into
                 IllegalSynchronizationStateException.

  @Description:  Checks that passing a “foreign” ConditionID to a
                 MultiConditionMonitor results into
                 IllegalSynchronizationStateException.

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: ../aux_test_wrong_cond_id.cj

*/

main(): Int64 {
    testWrongId()

    return 0
}
