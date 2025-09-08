// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: testa.cj testb.cj
// EXEC:%compiler %cmp_opt %compile_lib_opt testb.cj -o testb.%middle
// EXEC:%compiler %cmp_opt %compile_lib_opt testa.cj -o testa.%middle
// EXEC:%compiler %cmp_opt testa.%middle testb.%middle %n.cj -o %output
// EXEC:%run %run_opt %output %run_args

package Pulsar_SDK
import Pulsar_SDK.client.consumer.*

main() {
    let consumerConfig = ConsumerConfig("127.0.0.1")
}