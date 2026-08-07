# RUN: not llvm-mc %s -triple=riscv32 2>&1 | FileCheck %s

madd.ew m1, m2, m3
# CHECK: error: instruction requires the following: 'Ztt' (Attached Matrix Extension)
