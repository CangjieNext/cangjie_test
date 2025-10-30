/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import a.file

main(){
  if (file.canWrite()) {
    file.flush()
    file.close()
    print("This file already exists or created!")
  } else {
    return 1
  }
  return 0
}


