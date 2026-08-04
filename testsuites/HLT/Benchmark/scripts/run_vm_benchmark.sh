#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.


export repos=100000
export cjHeapSize=16GB
if [ ! -n "$1" ] ;then
  option=""
  middle="o"
  backend="llvmgc"
else
  if [ $1 == "jet" ]
  then
    option=" --backend jet "
    middle="bc"
    backend="jet"
    export JETVMPROP="-Djet.gc.heaplimit=16g"
  else
    if [ $1 == "llvmgc_aarch64" ]
    then
      option=""
      middle="o"
      backend="llvmgc_aarch64"
    fi
    if [ $1 == "jet_aarch64" ]
    then
      option=" --backend jet "
      middle="bc"
      backend="jet_aarch64"
      export JETVMPROP="-Djet.gc.heaplimit=16g"
    fi
  fi
fi
echo $option
echo $middle
echo $backend
testcase_gc=(
vm-benchmarks/cj-benchmark/components/Allocation/InterfaceAllocationGC
vm-benchmarks/cj-benchmark/components/Allocation/ObjectAllocationGc
vm-benchmarks/cj-benchmark/components/Allocation/ObjectArrayAllocationGc
vm-benchmarks/cj-benchmark/components/Allocation/ObjectBufferAllocationGc
)

testcase=(
vm-benchmarks/cj-benchmark/components/Allocation/InterfaceAllocationNoGC
vm-benchmarks/cj-benchmark/components/Allocation/ObjectAllocationNoGc
vm-benchmarks/cj-benchmark/components/Allocation/ObjectArrayAllocationNoGc
vm-benchmarks/cj-benchmark/components/Allocation/ObjectBufferAllocationNoGc

vm-benchmarks/cj-benchmark/components/Array/SystemBoolArrayCopy
vm-benchmarks/cj-benchmark/components/Array/SystemCharArrayCopy
#vm-benchmarks/cj-benchmark/components/Array/SystemCustomObjectArrayCopy
vm-benchmarks/cj-benchmark/components/Array/SystemFloat32ArrayCopy
vm-benchmarks/cj-benchmark/components/Array/SystemFloat64ArrayCopy
vm-benchmarks/cj-benchmark/components/Array/SystemInt16ArrayCopy
vm-benchmarks/cj-benchmark/components/Array/SystemInt32ArrayCopy
vm-benchmarks/cj-benchmark/components/Array/SystemInt64ArrayCopy
vm-benchmarks/cj-benchmark/components/Array/SystemInt8ArrayCopy
vm-benchmarks/cj-benchmark/components/Array/SystemIntNativeArrayCopy
vm-benchmarks/cj-benchmark/components/Array/SystemObjectArrayCopy
vm-benchmarks/cj-benchmark/components/Array/SystemUInt16ArrayCopy
vm-benchmarks/cj-benchmark/components/Array/SystemUInt32ArrayCopy
vm-benchmarks/cj-benchmark/components/Array/SystemUInt64ArrayCopy
vm-benchmarks/cj-benchmark/components/Array/SystemUInt8ArrayCopy
vm-benchmarks/cj-benchmark/components/Array/SystemUIntNativeArrayCopy

vm-benchmarks/cj-benchmark/components/Exceptions/ArithmeticException
#vm-benchmarks/cj-benchmark/components/Exceptions/ArrayIndexOutOfBoundsException
vm-benchmarks/cj-benchmark/components/Exceptions/BindOSThreadThresholdExceededException
vm-benchmarks/cj-benchmark/components/Exceptions/ConcurrentModificationException
vm-benchmarks/cj-benchmark/components/Exceptions/Exception
vm-benchmarks/cj-benchmark/components/Exceptions/IllegalArgumentException
vm-benchmarks/cj-benchmark/components/Exceptions/IndexOutOfBoundsException
vm-benchmarks/cj-benchmark/components/Exceptions/NegativeArraySizeException
vm-benchmarks/cj-benchmark/components/Exceptions/NoneValueException
vm-benchmarks/cj-benchmark/components/Exceptions/OverflowException
vm-benchmarks/cj-benchmark/components/Exceptions/RuntimeException
vm-benchmarks/cj-benchmark/components/Exceptions/ThrowInsideDeepRecursion
vm-benchmarks/cj-benchmark/components/Exceptions/ThrowInsideRecursion
vm-benchmarks/cj-benchmark/components/Exceptions/ThrowWithFinally
vm-benchmarks/cj-benchmark/components/Exceptions/TryWithThrows
vm-benchmarks/cj-benchmark/components/Exceptions/TryWithThrowsEvery2Time

#vm-benchmarks/cj-benchmark/components/GC/AllocatedSmallObjects
#vm-benchmarks/cj-benchmark/components/GC/AllocateSmallMediumHugeWithDifferentProbability
#vm-benchmarks/cj-benchmark/components/GC/AllocationManyLocalsinFunction
#vm-benchmarks/cj-benchmark/components/GC/AllocationWithProbabilityReleaseSmall

vm-benchmarks/cj-benchmark/components/Invocations/EmptyInterface
vm-benchmarks/cj-benchmark/components/Invocations/EmptyStatic
vm-benchmarks/cj-benchmark/components/Invocations/EmptyVirtual
vm-benchmarks/cj-benchmark/components/Invocations/IMTDepthConflicts
vm-benchmarks/cj-benchmark/components/Invocations/InterfaceImpl
vm-benchmarks/cj-benchmark/components/Invocations/InternalFieldAccess
vm-benchmarks/cj-benchmark/components/Invocations/InternalGetter
vm-benchmarks/cj-benchmark/components/Invocations/PrivateInnerFinalPackageMethod
vm-benchmarks/cj-benchmark/components/Invocations/PrivateInnerPackageMethod
#vm-benchmarks/cj-benchmark/components/Invocations/PrivateInnerPrivateMethod
vm-benchmarks/cj-benchmark/components/Invocations/PrivateInnerPublicMethod
#vm-benchmarks/cj-benchmark/components/StackWalking/GetStackTrace

vm-benchmarks/cj-benchmark/components/Strings/AllocationInStringPool
vm-benchmarks/cj-benchmark/components/Strings/AllocationInStringPoolLong
vm-benchmarks/cj-benchmark/components/Strings/AllocationInternedOneString
vm-benchmarks/cj-benchmark/components/Strings/AllocationStringBuffer
vm-benchmarks/cj-benchmark/components/Strings/AllocationStringBufferEmtpy
vm-benchmarks/cj-benchmark/components/Strings/ByteArrayFromString
vm-benchmarks/cj-benchmark/components/Strings/ByteArrayFromStringLong
vm-benchmarks/cj-benchmark/components/Strings/CharArrayFromString
vm-benchmarks/cj-benchmark/components/Strings/CharArrayFromStringLong
vm-benchmarks/cj-benchmark/components/Strings/CreateSubstrings
vm-benchmarks/cj-benchmark/components/Strings/RegexExpression
vm-benchmarks/cj-benchmark/components/Strings/SplitString
vm-benchmarks/cj-benchmark/components/Strings/StringConcat
vm-benchmarks/cj-benchmark/components/Strings/StringFromByteArray
vm-benchmarks/cj-benchmark/components/Strings/StringFromCharArray
vm-benchmarks/cj-benchmark/components/Strings/StringFromFloat32
vm-benchmarks/cj-benchmark/components/Strings/StringFromFloat64
vm-benchmarks/cj-benchmark/components/Strings/StringFromInt16
vm-benchmarks/cj-benchmark/components/Strings/StringFromInt32
vm-benchmarks/cj-benchmark/components/Strings/StringFromInt64
vm-benchmarks/cj-benchmark/components/Strings/StringFromInt8
vm-benchmarks/cj-benchmark/components/Strings/StringFromString
vm-benchmarks/cj-benchmark/components/Strings/StringFromStringLong
vm-benchmarks/cj-benchmark/components/Strings/StringFromUInt16
vm-benchmarks/cj-benchmark/components/Strings/StringFromUInt32
vm-benchmarks/cj-benchmark/components/Strings/StringFromUInt64
vm-benchmarks/cj-benchmark/components/Strings/StringFromUInt8
)

tmp_dir=tmp_nogc
tmp_gc_dir=tmp_gc

init(){
    touch vm_cj.log
    touch vm_java.log
    cd vm-benchmarks/cj-benchmark/utils/
    cjc $option *.cj -c -o utils.$middle
    cd -
    mkdir $tmp_dir
    mkdir $tmp_gc_dir
    cp vm-benchmarks/cj-benchmark/utils/*.$middle $tmp_dir
    cp vm-benchmarks/cj-benchmark/utils/*.cjo $tmp_dir
    cp vm-benchmarks/cj-benchmark/utils/*.$middle $tmp_gc_dir
    cp vm-benchmarks/cj-benchmark/utils/*.cjo $tmp_gc_dir

    cd vm-benchmarks/cj-benchmark/p
    mv ParametrizedClass1-GC.cj ParametrizedClass1-GC_cj
    cjc $option *.cj -c -o p.$middle
    mv ParametrizedClass1-GC_cj ParametrizedClass1-GC.cj
    cd -
    mv vm-benchmarks/cj-benchmark/p/*.$middle $tmp_dir
    mv vm-benchmarks/cj-benchmark/p/*.cjo $tmp_dir

    cd vm-benchmarks/cj-benchmark/p
    mv ParametrizedClass2-NoGC.cj  ParametrizedClass2-NoGC_cj
    cjc $option *.cj -c -o p.$middle
    mv ParametrizedClass2-NoGC_cj  ParametrizedClass2-NoGC.cj
    cd -
    mv vm-benchmarks/cj-benchmark/p/*.$middle $tmp_gc_dir
    mv vm-benchmarks/cj-benchmark/p/*.cjo $tmp_gc_dir
}

run(){
    cp $1/*.cj $2
    cd $2
    echo *.cj
    cjc $option p.$middle utils.$middle  *.cj -o a.out
    echo *.cj >> ../vm_cj.log
    \time -v ./a.out 1>>../vm_cj.log 2>>../vm_cj.log
    rm a.out
    rm *.cj
    cd -
}

clean(){
  rm $tmp_dir -rf
  rm $tmp_gc_dir -rf
  rm vm_cj.log
  rm vm_java.log
}

clean
init
for i in ${testcase[*]};
do
  run $i $tmp_dir
done
for i in ${testcase_gc[*]};
do
  run $i $tmp_gc_dir
done

cd vm-benchmarks/java-benchmark
make
python3 framework/runner/runner.py -t=host benchmarks/lists/All.lst > ../../vm_java.log
cd -

#python3 push_vm_result.py $backend
