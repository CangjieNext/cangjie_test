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

func benchmarkD1ReadInOrderRun(b *testing.B, arrLen int) {
	arr := make([]int, arrLen)
	for i:=0;i<arrLen;i++ {
		arr[i] = i
	}

	b.ResetTimer()
	for i := 0; i < b.N; i++ {
	  var valArr int
		for j := 0; j < arrLen; j++ {
			valArr = arr[j]
		}
		_ = valArr
	}
}
func BenchmarkReadArrayInOrderD1_N32(b *testing.B)      { benchmarkD1ReadInOrderRun(b, arrLen[0]) }
func BenchmarkReadArrayInOrderD1_N256(b *testing.B)     { benchmarkD1ReadInOrderRun(b, arrLen[1]) }
func BenchmarkReadArrayInOrderD1_N2048(b *testing.B)    { benchmarkD1ReadInOrderRun(b, arrLen[2]) }
func BenchmarkReadArrayInOrderD1_N16384(b *testing.B)   { benchmarkD1ReadInOrderRun(b, arrLen[3]) }
