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

func benchmarkD1WriteInOrderRun(b *testing.B, arrLen int) {
	arr := make([]int, arrLen)

	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		for j := 0; j < arrLen; j++ {
			arr[j] = j
		}
	}
}
func BenchmarkWriteArrayInOrderD1_N32(b *testing.B)      { benchmarkD1WriteInOrderRun(b, arrLen[0]) }
func BenchmarkWriteArrayInOrderD1_N256(b *testing.B)     { benchmarkD1WriteInOrderRun(b, arrLen[1]) }
func BenchmarkWriteArrayInOrderD1_N2048(b *testing.B)    { benchmarkD1WriteInOrderRun(b, arrLen[2]) }
func BenchmarkWriteArrayInOrderD1_N16384(b *testing.B)   { benchmarkD1WriteInOrderRun(b, arrLen[3]) }
func BenchmarkWriteArrayInOrderD1_N131072(b *testing.B)  { benchmarkD1WriteInOrderRun(b, 131072)    }
func BenchmarkWriteArrayInOrderD1_N1048576(b *testing.B) { benchmarkD1WriteInOrderRun(b, 1048576)   }
