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
    "time"
)

type Data struct {
  res int64
}

func create(depth int, data *Data, finisher *sync.WaitGroup) {
  go func(depth int, data *Data, finisher *sync.WaitGroup) {
    if depth == 0 {
      data.res = time.Now().UnixMilli()
      finisher.Done()
    } else {
      create(depth - 1, data, finisher)
    }
  }(depth, data, finisher)
}


func measure(depth int) int64 {
  var finisher sync.WaitGroup
  finisher.Add(1)

  var data Data
  start := time.Now().UnixMilli()
  create(depth, &data, &finisher)
  finisher.Wait()

  return data.res - start
}

func print(pref string, depth int) {
  t := measure(depth)

  println(pref, t)
}

func main() {
  args := os.Args
  depth, _ := strconv.Atoi(args[1])

  print("warmup", depth);

  print("result", depth);
}
