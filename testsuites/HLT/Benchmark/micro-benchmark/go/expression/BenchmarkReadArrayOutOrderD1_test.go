/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package expression_test

import (
	"testing"
)

var step = 64
func benchmarkD1ReadOutOrderRun(b *testing.B, arrLen int) {
	arr := make([]int, arrLen)
	for j := range arr {
		arr[j] = j
	}

	b.ResetTimer()
	for i := 0; i < b.N; i++ {
	  var valArr int
		for j := 0; j < arrLen; j+= step {
			valArr = arr[j]
		}
		_ = valArr
	}
}
func BenchmarkReadArrayOutOfOrderD1_N32(b *testing.B)      { benchmarkD1ReadOutOrderRun(b, arrLen[0]) }
func BenchmarkReadArrayOutOfOrderD1_N256(b *testing.B)     { benchmarkD1ReadOutOrderRun(b, arrLen[1]) }
func BenchmarkReadArrayOutOfOrderD1_N2048(b *testing.B)    { benchmarkD1ReadOutOrderRun(b, arrLen[2]) }
func BenchmarkReadArrayOutOfOrderD1_N16384(b *testing.B)   { benchmarkD1ReadOutOrderRun(b, arrLen[3])}
func BenchmarkReadArrayOutOfOrderD1_N131072(b *testing.B)  { benchmarkD1ReadOutOrderRun(b, arrLen[4]) }
func BenchmarkReadArrayOutOfOrderD1_N1048576(b *testing.B) { benchmarkD1ReadOutOrderRun(b, arrLen[5]) }
