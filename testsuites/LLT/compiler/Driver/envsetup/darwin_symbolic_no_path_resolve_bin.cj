// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Darwin) EXEC: ln -s $CANGJIE_HOME/envsetup.sh
// (Darwin) EXEC: ln -s $(which ps) && ln -s $(which basename) && ln -s $(which dirname) && ln -s $(which uname) 
// (Darwin) EXEC: bash -c 'export PATH=$(pwd) && source ./envsetup.sh' 2>&1 | compare %f
// (Darwin) ASSERT: scan `realpath` is not found, setup may not process properly.
