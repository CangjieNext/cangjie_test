/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*
import std.fs.*
import std.posix.*
var nameClasses:Array<String>=["A1","A2","A3","A4","A5","A6","A7","A8","A9",
                             "A10","A11","A12","A13","A14","A15","A16","A17","A18","A19","A20","A21",
                             "A22","A23","A24","A25","A26","A27","A28","A29","A30","A31","A32"]
var headVariableName="Variable"
func generateClassVariable(num:Int64,cur:Int64,depth:Int64):String
{
   var strVar=""
   if(cur+2<=depth && depth!=1){
       strVar=strVar+"  public var Variable1:${nameClasses[cur+1]}N${num}D${depth}\n"
   }
   for (i in 2..(num+2))
   {
       strVar=strVar+"  public var Variable${i}:Int64\n"
   }
   return strVar
}

func generateClass(num:Int64,depth:Int64):String
{
   var result=""
   for (i in 0..depth)
   {
      var headClass="""
class ${nameClasses[i]}N${num}D${depth} <: Serializable<${nameClasses[i]}N${num}D${depth}>
{
"""
      var contentVar=generateClassVariable(num,i,depth)
      var contentPublicFuncInit=generatePublicFuncInit(num,i,depth)
      var contentPrivateFuncInit=generatePrivateFuncInit(num,i,depth)
      var contentFuncSerialize=generateFuncSerialize(num,i,depth)
      var contentFuncDeserialize=generateFuncDeserialize(num,i,depth)
      var end="}\n"
      result=result+headClass+contentVar+contentPublicFuncInit+contentPrivateFuncInit+contentFuncSerialize+contentFuncDeserialize+end
   }
   return result
}
func generatePublicFuncInit(nums:Int64,cur:Int64,depth:Int64):String
{
     var initContent="""
  public init("""
     for (i in 2..(nums+1)){
         initContent=initContent+"Variable${i} : Int64,"
     }
     initContent=initContent+"Variable${nums+1} : Int64)  {\n"

     var allVariable="(Variable2"
     var lessFirstVariable=""
     for (i in 3..(nums+2))
     {
         allVariable=allVariable+",Variable${i}"
         lessFirstVariable=lessFirstVariable+",Variable${i}"
     }
     allVariable=allVariable+")"
     lessFirstVariable=lessFirstVariable+")"
     if(cur+2<=depth )
     {
         initContent=initContent+"    this.Variable1=${nameClasses[cur+1]}N${nums}D${depth}${allVariable}\n"
     }
     for( i in 2..(nums+2))
     {
         initContent=initContent+"""
    this.Variable${i}=Variable${i}
"""
     }
     return "${initContent}\n  }\n"
}

func generatePrivateFuncInit(nums:Int64,cur:Int64,depth:Int64):String
{
   var initContent="""
  private init(dms : DataModelStruct) {
"""
    if(cur+2<=depth)
    {
        initContent=initContent+"    this.Variable1 = ${nameClasses[cur+1]}N${nums}D${depth}.deserialize(dms.get(\"Variable1\"))\n"
    }
    for (i in 2..(nums+2))
    {
        initContent=initContent+"""
    this.Variable${i} = Int64.deserialize(dms.get(\"Variable${i}\"))
"""
    }
    return "${initContent}\n  }\n"
}

func generateFuncSerialize(nums:Int64,cur:Int64,depth:Int64):String
{
   var serializeContent="""
  public func serialize(): DataModel{
    let dms = DataModelStruct()
"""
  if(cur+1!=depth)
  {
      serializeContent=serializeContent+"    dms.add(Field(\"Variable1\", Variable1.serialize()))"+"\n"
  }
  for ( i in 2..(nums+2))
  {
      serializeContent=serializeContent+"    dms.add(Field(\"Variable${i}\", Variable${i}.serialize()))"+"\n"
  }
   return "${serializeContent}    return dms\n  }\n"
}

func generateFuncDeserialize(nums:Int64,cur:Int64,depth:Int64):String
{
   return """
  public static func deserialize(dm: DataModel): ${nameClasses[cur]}N${nums}D${depth}
  {
    let dms = (dm as DataModelStruct).getOrThrow()
    ${nameClasses[cur]}N${nums}D${depth}(dms)
  }
"""
}

func generateAll(num:Int64,depth:Int64):String
{
    var headImport="internal import stdx.serialization.serialization.DataModel\ninternal import stdx.encoding.json.{JsonValue, ToJson}\n\nimport stdx.serialization.serialization.*\nimport stdx.encoding.json.*\n"
    return "${headImport}${generateClass(num,depth)}"
}

func generateDataCodeFile(num:Int64,depth:Int64){
    var data = generateAll(num, depth)
    File.writeTo("../../cj/serialize/dataClassN${num}D${depth}.cj", unsafe {data.rawData()})
}

func generateInitCodeFile(num:Int64,depth:Int64):Unit
{
    var origin="""
import std.collection.*
import std.time.*
import std.convert.*
func dataInitN${num}D${depth}(num:Int64,depth:Int64):A1N${num}D${depth}{
    var dataObjectN${num}D${depth}:A1N${num}D${depth}=A1N${num}D${depth}("""
    for(i in 0..num-1)
    {
        origin=origin+i.toString()+","
    }
    origin=origin+(num-1).toString()+")\n    return dataObjectN${num}D${depth}\n}\n"
    origin=origin+"""

func benchmarkDeserializableN${num}D${depth}(datamodel:DataModel) {
    for (i in 0..reps)
    {
         A1N${num}D${depth}.deserialize(datamodel)
    }
}

func benchmarkSerializableN${num}D${depth}(origin:A1N${num}D${depth}) {
    for (i in 0..reps)
    {
         origin.serialize()
    }
}

func timeBenchmarkSerializableN${num}D${depth}(origin:A1N${num}D${depth},num:Int64,depth:Int64) {
    var startTime = DateTime.now()
    benchmarkSerializableN${num}D${depth}(origin)
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds())/Float64(reps)
    if (log == 1) {
      println("BenchmarkSerializable_\${num}_\${depth}: \${perTime.format(".2")} ns/op")
    }
}

func timeBenchmarkDeserializableN${num}D${depth}(origin:A1N${num}D${depth},num:Int64,depth:Int64) {
    var datamodelStr=origin.serialize().toJson().toString()
    var jsonStr=JsonValue.fromStr(datamodelStr)
    var datamodel=DataModel.fromJson(jsonStr)
    var startTime = DateTime.now()
    benchmarkDeserializableN${num}D${depth}(datamodel)
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds())/Float64(reps)
    if (log == 1) {
      println("BenchmarkDeserializable_\${num}_\${depth}: \${perTime.format(".2")} ns/op")
    }
}


func mainSerializableN${num}D${depth}():Unit
{
    var objectA1N${num}D${depth}=dataInitN${num}D${depth}(${num},${depth})
    timeBenchmarkSerializableN${num}D${depth}(objectA1N${num}D${depth},${num},${depth})
}

func mainDeserializableN${num}D${depth}():Unit
{
    var objectA1N${num}D${depth}=dataInitN${num}D${depth}(${num},${depth})
    timeBenchmarkDeserializableN${num}D${depth}(objectA1N${num}D${depth},${num},${depth})
}
"""
    File.writeTo("../../cj/serialize/dataInitN${num}D${depth}.cj", unsafe {origin.rawData()})
}

func generateSerializableCase():Unit
{
//Go does not have a case corresponding to 128.
//var nums:Array<Int64>=[8,64,128]
    var nums:Array<Int64>=[8,64]
    var depths:Array<Int64>=[1,2,4,8,32]

    var origin="""
var reps=1 // will be changed after warmup
var log=0
//Go does not have a case corresponding to 128.
//var nums:Array<Int64>=[8,64,128]
var nums:Array<Int64>=[8,64]
var depths:Array<Int64>=[1,2,4,8,32]
main():Unit{
"""
    for (num in nums){
        for(depth in depths){
           origin=origin+"  mainSerializableN${num}D${depth}()\n"
        }
    }
    for (num in nums){
        for(depth in depths){
           origin=origin+"  mainDeserializableN${num}D${depth}()\n"
        }
    }
    origin=origin+"  reps=8192\n  log=1\n"
    for (num in nums){
        for(depth in depths){
           origin=origin+"  mainSerializableN${num}D${depth}()\n"
        }
    }
    for (num in nums){
        for(depth in depths){
           origin=origin+"  mainDeserializableN${num}D${depth}()\n"
        }
    }
    origin=origin+"\n}\n"
    File.writeTo("../../cj/serialize/serializableCase.cj", unsafe {origin.rawData()})
}

func generateAllFile(num:Int64,depth:Int64):Unit{
      generateDataCodeFile(num,depth)
      generateInitCodeFile(num,depth)
      generateSerializableCase()
}
//Go does not have a case corresponding to 128.
//var nums:Array<Int64>=[8,64,128]
var nums:Array<Int64>=[8,64]
var depths:Array<Int64>=[1,2,4,8,32]
main():Unit
{
    for ( num in nums )
    {
         for (depth in depths)
         {
             generateAllFile(num,depth)
         }
    }

}

