#!/usr/bin/env python3
"""Generate V2 format CANGJIE PROFILE .data files for dominance tree testing.

V2 format with idSize=4:
- Header: "CANGJIE PROFILE 1.0.2" (22 bytes) + idSize(u4) + timeHigh(u4) + timeLow(u4)
- STRING: tag(u1=0x01) + length(u4) + id(u4) + str_bytes
- CLASS:  tag(u1=0x02) + id(u4) + name(u4) + size(u4)  -- NO length prefix!
- HEAP_DUMP: tag(u1=0x0c) + length(u8) + sub-records
  - ROOT_GLOBAL: sub-tag(0x01) + id(u4)
  - ROOT_LOCAL:  sub-tag(0x02) + id(u4) + thread(u4) + frame(u4)
  - CLASS_DUMP:  sub-tag(0x20) + id(u4) + name(u4) + size(u4)
  - INSTANCE_DUMP: sub-tag(0x21) + id(ID) + cls(u4) + num(u4) + values[num * ID]
  - OBJECT_ARRAY_DUMP: sub-tag(0x22) + id(ID) + num(u4) + cls(u4) + elements[num * ID]

All multi-byte integers are big-endian.
"""

import struct
import sys
import os


def be_u1(val):
    return struct.pack('>B', val)

def be_u2(val):
    return struct.pack('>H', val)

def be_u4(val):
    return struct.pack('>I', val)

def be_u8(val):
    return struct.pack('>Q', val)


def gen_header(id_size=4):
    """Generate V2 file header (34 bytes)."""
    ident = b"CANGJIE PROFILE 1.0.2"  # 21 chars + b'\x00' = 22 bytes
    ident = ident + b'\x00'  # ensure exactly 22 bytes with null terminator
    assert len(ident) == 22
    return ident + be_u4(id_size) + be_u4(0) + be_u4(0)


def gen_string(str_id, text):
    """Generate STRING record: tag(0x01) + length(u4) + id(u4) + text"""
    text_bytes = text.encode('utf-8')
    length = 4 + len(text_bytes)  # length includes id field size
    return be_u1(0x01) + be_u4(length) + be_u4(str_id) + text_bytes


def gen_loadclass(class_id, name_id, instance_size):
    """Generate CLASS (LoadClass) record: tag(0x02) + id(u4) + name(u4) + size(u4)
    Note: NO length prefix for CLASS in V2!"""
    return be_u1(0x02) + be_u4(class_id) + be_u4(name_id) + be_u4(instance_size)


def gen_heap_dump(sub_records):
    """Generate HEAP_DUMP record: tag(0x0c) + length(u8) + sub_records"""
    payload = b''.join(sub_records)
    return be_u1(0x0c) + be_u8(len(payload)) + payload


def gen_root_global(obj_id):
    """ROOT_GLOBAL: sub-tag(0x01) + id(ID=4)"""
    return be_u1(0x01) + be_u4(obj_id)


def gen_root_local(obj_id, thread=1, frame=0):
    """ROOT_LOCAL: sub-tag(0x02) + id(ID=4) + thread(u4) + frame(u4)"""
    return be_u1(0x02) + be_u4(obj_id) + be_u4(thread) + be_u4(frame)


def gen_root_unknown(obj_id):
    """ROOT_UNKNOWN: sub-tag(0xff) + id(ID=4)"""
    return be_u1(0xff) + be_u4(obj_id)


def gen_class_dump(class_id, name_id, instance_size):
    """CLASS_DUMP: sub-tag(0x20) + id(u4) + name(u4) + size(u4)"""
    return be_u1(0x20) + be_u4(class_id) + be_u4(name_id) + be_u4(instance_size)


def gen_instance_dump(inst_id, class_id, field_ids):
    """INSTANCE_DUMP: sub-tag(0x21) + id(ID=4) + cls(u4) + num(u4) + values[num*ID=4]"""
    num = len(field_ids)
    data = be_u1(0x21) + be_u4(inst_id) + be_u4(class_id) + be_u4(num)
    for fid in field_ids:
        data += be_u4(fid)  # each field value is ID-sized (4 bytes)
    return data


def gen_object_array_dump(arr_id, class_id, element_ids):
    """OBJECT_ARRAY_DUMP: sub-tag(0x22) + id(ID=4) + num(u4) + cls(u4) + elements[num*ID=4]"""
    num = len(element_ids)
    data = be_u1(0x22) + be_u4(arr_id) + be_u4(num) + be_u4(class_id)
    for eid in element_ids:
        data += be_u4(eid)  # each element is ID-sized (4 bytes)
    return data


def gen_primitive_array_dump(arr_id, num_elements, type_code):
    """PRIMITIVE_ARRAY_DUMP: sub-tag(0x23) + id(ID=4) + num(u4) + type(u1)
    Note: For testing we don't include actual element values since cjprof only
    uses the object metadata, not the primitive values. But the parser expects
    element data after the type byte.

    Type codes: 4=boolean, 5=char, 6=float, 7=double, 8=byte, 9=short,
                10=int, 11=long
    Element sizes per type: bool=1, char=2, float=4, double=8, byte=1,
                           short=2, int=4, long=8
    """
    type_sizes = {4: 1, 5: 2, 6: 4, 7: 8, 8: 1, 9: 2, 10: 4, 11: 8}
    elem_size = type_sizes.get(type_code, 1)
    # Just write zeros for element data
    elem_data = b'\x00' * (num_elements * elem_size)
    data = be_u1(0x23) + be_u4(arr_id) + be_u4(num_elements) + be_u1(type_code)
    data += elem_data
    return data


# ============================================================
# Test case 1: Cyclic self-reference (Node.next = Node itself)
# ============================================================
def gen_cyclic_data():
    """
    One Node instance that references itself.

    Object graph:
      Node_A (id=0x10) -> Node_A (self-reference via next field)

    Dominator tree expectation:
      Node_A: retained_size == shallow_size (32)
      (Self-reference does not inflate retained size)

    String table (using single colon, ReplaceTypeName converts : to ::):
      id=1: "default:Node"  (class name, becomes "default::Node" after ReplaceTypeName)
      id=2: "default.main()"  (root frame name)

    Classes:
      class_id=0x01: "default::Node", size=32

    Instances:
      inst_id=0x10: class=0x01, fields=[0x10]  (self-reference!)

    GC Roots:
      ROOT_LOCAL: id=0x10, thread=1, frame=0
    """
    strings = [
        gen_string(1, "default:Node"),     # ReplaceTypeName converts : to ::
        gen_string(2, "default.main()"),
    ]

    classes = [
        gen_loadclass(0x01, 1, 32),  # class_id=1, name_id=1 ("default:Node"), size=32
    ]

    heap_sub_records = [
        gen_class_dump(0x01, 1, 32),    # class Node, size=32
        gen_instance_dump(0x10, 0x01, [0x10]),  # Node_A, 1 field pointing to itself
        gen_root_local(0x10, 1, 0),     # Node_A is a local root
    ]

    heap_dump = gen_heap_dump(heap_sub_records)

    data = gen_header(id_size=4)
    for s in strings:
        data += s
    for c in classes:
        data += c
    data += heap_dump

    return data


# ============================================================
# Test case 2: Chain reference (Node A -> Node B)
# ============================================================
def gen_chain_data():
    """
    Two Node instances forming a chain: Node_A references Node_B.

    Object graph:
      Node_A (id=0x10) -> Node_B (id=0x11)  (via next field)

    Dominator tree expectation:
      Node_A: parent_id=0, retained_size=64 (32+32), shallow_size=32
      Node_B: parent_id=0x10, retained_size=32, shallow_size=32
      (Chain: root -> A -> B, retained accumulates transitively)

    String table (using single colon):
      id=1: "default:Node"  (becomes "default::Node" after ReplaceTypeName)
      id=2: "default.main()"

    Classes:
      class_id=0x01: "default:Node", size=32

    Instances:
      inst_id=0x10: class=0x01, fields=[0x11]  (A.next -> B)
      inst_id=0x11: class=0x01, fields=[]      (B.next -> None, no refs)

    GC Roots:
      ROOT_LOCAL: id=0x10, thread=1, frame=0
    """
    strings = [
        gen_string(1, "default:Node"),     # becomes "default::Node" after ReplaceTypeName
        gen_string(2, "default.main()"),
    ]

    classes = [
        gen_loadclass(0x01, 1, 32),
    ]

    heap_sub_records = [
        gen_class_dump(0x01, 1, 32),
        gen_instance_dump(0x10, 0x01, [0x11]),  # Node_A -> Node_B
        gen_instance_dump(0x11, 0x01, []),      # Node_B has no outgoing refs
        gen_root_local(0x10, 1, 0),             # Node_A is a local root
    ]

    heap_dump = gen_heap_dump(heap_sub_records)

    data = gen_header(id_size=4)
    for s in strings:
        data += s
    for c in classes:
        data += c
    data += heap_dump

    return data


# ============================================================
# Test case 3: Diamond reference (A -> B, A -> C, B -> D, C -> D)
# ============================================================
def gen_diamond_data():
    """
    Four objects forming a diamond: A references both B and C,
    both B and C reference D.

    Object graph:
      A (id=0x10) -> B (id=0x11), C (id=0x12)
      B (id=0x11) -> D (id=0x13)
      C (id=0x12) -> D (id=0x13)

    Dominator tree expectation:
      A: parent_id=0, retained=160 (40+40+40+40)
      B: parent_id=A, retained=80 (40+40), shallow=40
      C: parent_id=A, retained=80 (40+40), shallow=40
      D: parent_id=A, retained=40, shallow=40
      (D's idom is A, not B or C, because all paths to D go through A)
      B and C's retained should NOT include D's size.

    String table (using single colon):
      id=1: "default:Container"  (becomes "default::Container" after ReplaceTypeName)
      id=2: "default:Node"       (becomes "default::Node" after ReplaceTypeName)
      id=3: "default.main()"

    Classes:
      class_id=0x01: "default:Container", size=40
      class_id=0x02: "default:Node", size=40

    Instances:
      inst_id=0x10: class=0x01 (Container A), fields=[0x11, 0x12] -> B, C
      inst_id=0x11: class=0x02 (Node B), fields=[0x13] -> D
      inst_id=0x12: class=0x02 (Node C), fields=[0x13] -> D
      inst_id=0x13: class=0x02 (Node D), fields=[] -> none

    GC Roots:
      ROOT_LOCAL: id=0x10, thread=1, frame=0
    """
    strings = [
        gen_string(1, "default:Container"),  # becomes "default::Container" after ReplaceTypeName
        gen_string(2, "default:Node"),        # becomes "default::Node" after ReplaceTypeName
        gen_string(3, "default.main()"),
    ]

    classes = [
        gen_loadclass(0x01, 1, 40),  # Container, size=40
        gen_loadclass(0x02, 2, 40),  # Node, size=40
    ]

    heap_sub_records = [
        gen_class_dump(0x01, 1, 40),    # class Container
        gen_class_dump(0x02, 2, 40),    # class Node
        gen_instance_dump(0x10, 0x01, [0x11, 0x12]),  # A -> B, C
        gen_instance_dump(0x11, 0x02, [0x13]),         # B -> D
        gen_instance_dump(0x12, 0x02, [0x13]),         # C -> D
        gen_instance_dump(0x13, 0x02, []),             # D -> none
        gen_root_local(0x10, 1, 0),                    # A is root
    ]

    heap_dump = gen_heap_dump(heap_sub_records)

    data = gen_header(id_size=4)
    for s in strings:
        data += s
    for c in classes:
        data += c
    data += heap_dump

    return data


# ============================================================
# Test case 4: Unreachable node (Node_A is root, Node_B is orphan)
# ============================================================
def gen_unreachable_data():
    """
    Two Node instances: Node_A is a GC root, Node_B has no root and
    is not referenced by any other object.

    Object graph:
      Node_A (id=0x10) -> no references
      Node_B (id=0x11) -> no references, NOT a GC root

    Dominator tree expectation:
      Node_A: parent_id=0, retained_size=32, shallow_size=32
      Node_B: should be unreachable (no GC root path to it)
      In /api/dominance/tree: Node_B should have parent_id=0,
      retained_size=32 (= shallow, not accumulated under any root)

    String table:
      id=1: "default:Node"
      id=2: "default.main()"

    Classes:
      class_id=0x01: "default:Node", size=32

    Instances:
      inst_id=0x10: class=0x01, fields=[]  (Node_A, no refs)
      inst_id=0x11: class=0x01, fields=[]  (Node_B, no refs, orphan)

    GC Roots:
      ROOT_LOCAL: id=0x10, thread=1, frame=0  (only Node_A)
      Node_B (0x11) is NOT a root
    """
    strings = [
        gen_string(1, "default:Node"),     # becomes "default::Node" after ReplaceTypeName
        gen_string(2, "default.main()"),
    ]

    classes = [
        gen_loadclass(0x01, 1, 32),
    ]

    heap_sub_records = [
        gen_class_dump(0x01, 1, 32),
        gen_instance_dump(0x10, 0x01, []),  # Node_A, no outgoing refs
        gen_instance_dump(0x11, 0x01, []),  # Node_B, orphan (no refs, no root)
        gen_root_local(0x10, 1, 0),         # Only Node_A is a GC root
    ]

    heap_dump = gen_heap_dump(heap_sub_records)

    data = gen_header(id_size=4)
    for s in strings:
        data += s
    for c in classes:
        data += c
    data += heap_dump

    return data


# ============================================================
# Test case 5: Multiple same-type instances for tree-by-type
# ============================================================
def gen_multi_instance_data():
    """
    Three Node instances, all as separate GC roots, plus one Container
    referencing all three Nodes.

    Object graph:
      Container_A (id=0x10) -> Node_B (0x11), Node_C (0x12), Node_D (0x13)
      Node_B, Node_C, Node_D have no outgoing refs

    Dominator tree expectation:
      Container_A: parent_id=0, retained=172 (40 + 32*3 + alignment)
                  shallow=40, children are B, C, D
      Node_B: parent_id=0x10, retained=32, shallow=32
      Node_C: parent_id=0x10, retained=32, shallow=32
      Node_D: parent_id=0x10, retained=32, shallow=32

    tree-by-type expectation:
      "default::Container@Root": instance_count=1, retained=172
      "default::Node@default::Container": instance_count=3, retained=96

    String table:
      id=1: "default:Container"
      id=2: "default:Node"
      id=3: "default.main()"

    Classes:
      class_id=0x01: "default:Container", size=40
      class_id=0x02: "default:Node", size=32

    Instances:
      inst_id=0x10: class=0x01 (Container A), fields=[0x11, 0x12, 0x13]
      inst_id=0x11: class=0x02 (Node B), fields=[]
      inst_id=0x12: class=0x02 (Node C), fields=[]
      inst_id=0x13: class=0x02 (Node D), fields=[]

    GC Roots:
      ROOT_LOCAL: id=0x10, thread=1, frame=0
    """
    strings = [
        gen_string(1, "default:Container"),  # becomes "default::Container"
        gen_string(2, "default:Node"),        # becomes "default::Node"
        gen_string(3, "default.main()"),
    ]

    classes = [
        gen_loadclass(0x01, 1, 40),  # Container, size=40
        gen_loadclass(0x02, 2, 32),  # Node, size=32
    ]

    heap_sub_records = [
        gen_class_dump(0x01, 1, 40),    # class Container
        gen_class_dump(0x02, 2, 32),    # class Node
        gen_instance_dump(0x10, 0x01, [0x11, 0x12, 0x13]),  # Container A -> B, C, D
        gen_instance_dump(0x11, 0x02, []),  # Node B
        gen_instance_dump(0x12, 0x02, []),  # Node C
        gen_instance_dump(0x13, 0x02, []),  # Node D
        gen_root_local(0x10, 1, 0),         # Container A is root
    ]

    heap_dump = gen_heap_dump(heap_sub_records)

    data = gen_header(id_size=4)
    for s in strings:
        data += s
    for c in classes:
        data += c
    data += heap_dump

    return data


def main():
    output_dir = sys.argv[1] if len(sys.argv) > 1 else '.'
    os.makedirs(output_dir, exist_ok=True)

    files = {
        'dom_cyclic.data': gen_cyclic_data(),
        'dom_chain.data': gen_chain_data(),
        'dom_diamond.data': gen_diamond_data(),
        'dom_unreachable.data': gen_unreachable_data(),
        'dom_multi_instance.data': gen_multi_instance_data(),
    }

    for name, data in files.items():
        path = os.path.join(output_dir, name)
        with open(path, 'wb') as f:
            f.write(data)
        print(f"Generated {path} ({len(data)} bytes)")

    # Print hex dump for verification
    for name, data in files.items():
        print(f"\n=== {name} hex dump ===")
        for i in range(0, len(data), 16):
            hex_part = ' '.join(f'{b:02x}' for b in data[i:i+16])
            ascii_part = ''.join(chr(b) if 32 <= b < 127 else '.' for b in data[i:i+16])
            print(f'{i:08x}: {hex_part:<48s} {ascii_part}')


if __name__ == '__main__':
    main()
