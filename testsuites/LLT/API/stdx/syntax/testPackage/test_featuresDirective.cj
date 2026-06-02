/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: sourceFile/featuresDirective
// (not Windows) EXEC: find featuresDirective -type f -exec dos2unix {} \;
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*
import std.collection.ArrayList

@Test
class Test {
    var ftrDirective: ?FeaturesDirective = None

    @BeforeAll
    func readFeaturesDirective(): Unit {
        let path = "featuresDirective/featuresDirective_01.cj"
        let node = parseFile(path)
        let file: SourceFile = match (node.node) {
            case Some(v) => v
            case _ => throw Exception("Expected some tree node, not None")
        }
        ftrDirective = file.ftrDirective
        @Assert(ftrDirective.isSome(), true)
    }

    @TestCase
    func testFeaturesDirective(): Unit {
        let ftr: FeaturesDirective = match (ftrDirective) {
            case Some(v) => v
            case _ => @Fail("FeaturesDirective is None")
        }

        @Assert(ftr.toString().replace("\r\n", "\n"), "features { os.linux, os.windows }")

        let keywordPos = ftr.getFeaturesKeywordPos()
        let ftrPos = ftr.nodePos
        let ftrSetPos = ftr.featuresSet.nodePos
        @Expect([keywordPos.beginLine, keywordPos.beginColumn, keywordPos.endLine, keywordPos.endColumn], ArrayList<Int32>([9, 1, 9, 9]).toArray())
        @Expect([ftrPos.beginLine, ftrPos.beginColumn, ftrPos.endLine, ftrPos.endColumn], ArrayList<Int32>([9, 1, 9, 34]).toArray())
        @Expect([ftrSetPos.beginLine, ftrSetPos.beginColumn, ftrSetPos.endLine, ftrSetPos.endColumn], ArrayList<Int32>([9, 10, 9, 34]).toArray())
    }

    @TestCase
    func testFeaturesSet(): Unit {
        let ftr: FeaturesDirective = match (ftrDirective) {
            case Some(v) => v
            case _ => @Fail("FeaturesDirective is None")
        }

        let set = ftr.featuresSet
        let lCurlPos = set.getLCurlPos()
        let rCurlPos = set.getRCurlPos()
        let commas = set.getCommaPoses()
        let content = set.content

        @Expect([lCurlPos.beginLine, lCurlPos.beginColumn, lCurlPos.endLine, lCurlPos.endColumn], ArrayList<Int32>([9, 10, 9, 11]).toArray())
        @Expect([rCurlPos.beginLine, rCurlPos.beginColumn, rCurlPos.endLine, rCurlPos.endColumn], ArrayList<Int32>([9, 33, 9, 34]).toArray())
        @Assert(commas.size, 1)
        @Expect([commas[0].beginLine, commas[0].beginColumn, commas[0].endLine, commas[0].endColumn], ArrayList<Int32>([9, 20, 9, 21]).toArray())
        @Assert(content.size, 2)
    }

    @TestCase
    func testFeatureId_01(): Unit {
        let ftr: FeaturesDirective = match (ftrDirective) {
            case Some(v) => v
            case _ => @Fail("FeaturesDirective is None")
        }

        let ftrId = ftr.featuresSet.content[0]
        @Assert(ftrId.toString().replace("\r\n", "\n"), "os.linux")

        let base = ftrId.nodePos
        @Expect([base.beginLine, base.beginColumn, base.endLine, base.endColumn], ArrayList<Int32>([9, 12, 9, 20]).toArray())

        let identPoses = ftrId.getIdentifierPos()
        @Assert(identPoses.size, 2)
        @Expect([identPoses[0].beginLine, identPoses[0].beginColumn, identPoses[0].endLine, identPoses[0].endColumn], ArrayList<Int32>([9, 12, 9, 14]).toArray())
        @Expect([identPoses[1].beginLine, identPoses[1].beginColumn, identPoses[1].endLine, identPoses[1].endColumn], ArrayList<Int32>([9, 15, 9, 20]).toArray())

        let dotPoses = ftrId.getDotPoses()
        @Assert(dotPoses.size, 1)
        @Expect([dotPoses[0].beginLine, dotPoses[0].beginColumn, dotPoses[0].endLine, dotPoses[0].endColumn], ArrayList<Int32>([9, 14, 9, 15]).toArray())
    
        let idents = ftrId.featureNameIdentifiers
        @Assert(idents.size, 2)
        @Expect(idents, ["os", "linux"])
    }   

    @TestCase
    func testFeatureId_02(): Unit {
        let ftr: FeaturesDirective = match (ftrDirective) {
            case Some(v) => v
            case _ => @Fail("FeaturesDirective is None")
        }

        let ftrId = ftr.featuresSet.content[1]
        @Assert(ftrId.toString().replace("\r\n", "\n"), "os.windows")

        let base = ftrId.nodePos
        @Expect([base.beginLine, base.beginColumn, base.endLine, base.endColumn], ArrayList<Int32>([9, 22, 9, 32]).toArray())

        let identPoses = ftrId.getIdentifierPos()
        @Assert(identPoses.size, 2)
        @Expect([identPoses[0].beginLine, identPoses[0].beginColumn, identPoses[0].endLine, identPoses[0].endColumn], ArrayList<Int32>([9, 22, 9, 24]).toArray())
        @Expect([identPoses[1].beginLine, identPoses[1].beginColumn, identPoses[1].endLine, identPoses[1].endColumn], ArrayList<Int32>([9, 25, 9, 32]).toArray())

        let dotPoses = ftrId.getDotPoses()
        @Assert(dotPoses.size, 1)
        @Expect([dotPoses[0].beginLine, dotPoses[0].beginColumn, dotPoses[0].endLine, dotPoses[0].endColumn], ArrayList<Int32>([9, 24, 9, 25]).toArray())
    
        let idents = ftrId.featureNameIdentifiers
        @Assert(idents.size, 2)
        @Expect(idents, ["os", "windows"])
    }

    @TestCase
    func testInit_01(): Unit {
        let ftrId1 = FeatureId(["os", "linux"])
        let ftrId2 = FeatureId(["os", "windows"])
        @Expect("os.linux", ftrId1.toTokens().toString().replace("\r\n", "\n"))
        @Expect("os.windows", ftrId2.toTokens().toString().replace("\r\n", "\n"))

        let ftrSet = FeaturesSet([ftrId1, ftrId2])
        @Expect("{ os.linux, os.windows }", ftrSet.toTokens().toString().replace("\r\n", "\n"))

        let ftrDirective01 = FeaturesDirective([], ftrSet)
        @Expect("features { os.linux, os.windows }", ftrDirective01.toTokens().toString().replace("\r\n", "\n"))
    }
}

