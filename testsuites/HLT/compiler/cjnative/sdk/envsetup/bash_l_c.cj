
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DESCRIPTION: /bin/bash -l -c "xxx"
// (host_linux | host_mac | host_ohos) EXEC: %shell -l -c 'export CURRENT_DIR=$(pwd) && export ENVSETUP_DIR=%cangjie-home && export CANGJIE_HOME= && export LD_LIBRARY_PATH= && cd $ENVSETUP_DIR && . $ENVSETUP_DIR/envsetup.sh && cd $CURRENT_DIR && %compiler %cmp_opt %f -o %output && %run %run_opt %output %run_args'

main(): Unit {

}
