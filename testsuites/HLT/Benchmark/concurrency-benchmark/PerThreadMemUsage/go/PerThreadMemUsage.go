/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package main
import (
    _ "fmt"
    "sync"
    "os"
    "strconv"
    "sync/atomic"
)

var allReady int32
var mutex sync.Mutex

func create(cnt *int32) {
  go func() {
    x := atomic.AddInt32(cnt, -1)
    if x == 0 {
      atomic.StoreInt32(&allReady, 1)
    }

    mutex.Lock()
  }()
}


func measure(count int) {
  var cnt int32
  cnt = int32(count)

  mutex.Lock()
  for i := 0; i < count; i++ {
    create(&cnt)
  }

  for atomic.LoadInt32(&allReady) == 0 { }

  println("ready")

  for true { }
}

func main() {
  args := os.Args
  count, _ := strconv.Atoi(args[1])

  measure(count)
}
