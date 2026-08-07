# RUN: not llvm-mc %s -triple=riscv32 -mattr=+experimental-ztt 2>&1 \
# RUN:   | FileCheck %s

madd.ew m32, m1, m2
# CHECK: error: register must be an AME matrix register

mmulacc.2d acc32, m1, m2
# CHECK: error: register must be an AME accumulator register

mcolbcast.ew.x m1, m2, m3
# CHECK: error: register must be a GPR

mcolunzip.ew m32, m2
# CHECK: error: register must be an AME matrix register
