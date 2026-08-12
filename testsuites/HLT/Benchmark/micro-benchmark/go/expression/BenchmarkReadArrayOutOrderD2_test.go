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

func benchmarkD2ReadOutOrderRun(b *testing.B, arrLen int) {
	arr := make([][]int, arrLen)
	for i := 0; i < arrLen; i++ {
		arr[i] = make([]int,arrLen)
		for j := 0; j< arrLen; j++ {
			arr[i][j] = j
		}
	}

	b.ResetTimer()
	for i := 0; i < b.N; i++ {
	  var valArr int
		for j := 0; j < arrLen; j+=step {
			for k := 0; k < arrLen; k+=step {
				valArr = arr[j][k]
			}
		}
		_ = valArr
	}
}
func BenchmarkReadArrayOutOfOrderD2_N32(b *testing.B)      { benchmarkD2ReadOutOrderRun(b, arrLen[0]) }
func BenchmarkReadArrayOutOfOrderD2_N256(b *testing.B)     { benchmarkD2ReadOutOrderRun(b, arrLen[1]) }
func BenchmarkReadArrayOutOfOrderD2_N2048(b *testing.B)    { benchmarkD2ReadOutOrderRun(b, arrLen[2]) }
