# RUN: llvm-mc %s -triple=riscv32 -mattr=+experimental-ztt -show-encoding \
# RUN:   | FileCheck %s --check-prefixes=CHECK-INST,CHECK-ENC
# RUN: llvm-mc %s -triple=riscv64 -mattr=+experimental-ztt -filetype=obj \
# RUN:   | llvm-objdump --mattr=+experimental-ztt --no-print-imm-hex -d - \
# RUN:   | FileCheck %s --check-prefix=CHECK-INST

# CHECK-INST: ame.acquire a0, a1
# CHECK-ENC: encoding: [0x2b,0x85,0x95,0xa4]
ame.acquire a0, a1

# CHECK-INST: ame.release
# CHECK-ENC: encoding: [0x2b,0x00,0xa0,0xa4]
ame.release

# CHECK-INST: agettyp a0, acc4
# CHECK-ENC: encoding: [0x2b,0x05,0x02,0xa2]
agettyp a0, acc4

# CHECK-INST: asettyp acc4, a0
# CHECK-ENC: encoding: [0x2b,0x02,0x15,0xa2]
asettyp acc4, a0

# CHECK-INST: mabs.ew m1, m2
# CHECK-ENC: encoding: [0xab,0x00,0x41,0xa2]
mabs.ew m1, m2

# CHECK-INST: mabsdiff.ew m1, m2, m3
# CHECK-ENC: encoding: [0xab,0x00,0x31,0x00]
mabsdiff.ew m1, m2, m3

# CHECK-INST: mabsdiff.ew.x m1, a0, m2
# CHECK-ENC: encoding: [0xab,0x00,0x25,0x02]
mabsdiff.ew.x m1, a0, m2

# CHECK-INST: madd.ew m1, m2, m3
# CHECK-ENC: encoding: [0xab,0x00,0x31,0x04]
madd.ew m1, m2, m3

# CHECK-INST: madd.ew.x m1, a0, m2
# CHECK-ENC: encoding: [0xab,0x00,0x25,0x06]
madd.ew.x m1, a0, m2

# CHECK-INST: mand.ew m1, m2, m3
# CHECK-ENC: encoding: [0xab,0x00,0x31,0x34]
mand.ew m1, m2, m3

# CHECK-INST: mand.ew.x m1, a0, m2
# CHECK-ENC: encoding: [0xab,0x00,0x25,0x36]
mand.ew.x m1, a0, m2

# CHECK-INST: mandnot.ew m1, m2, m3
# CHECK-ENC: encoding: [0xab,0x00,0x31,0x38]
mandnot.ew m1, m2, m3

# CHECK-INST: mandnot.ew.x m1, a0, m2
# CHECK-ENC: encoding: [0xab,0x00,0x25,0x3a]
mandnot.ew.x m1, a0, m2

# CHECK-INST: mcmovge.ew m1, m2, m3
# CHECK-ENC: encoding: [0xab,0x00,0x31,0x54]
mcmovge.ew m1, m2, m3

# CHECK-INST: mcmovlt.ew m1, m2, m3
# CHECK-ENC: encoding: [0xab,0x00,0x31,0x56]
mcmovlt.ew m1, m2, m3

# CHECK-INST: mcmpge.ew m1, m2, m3
# CHECK-ENC: encoding: [0xab,0x00,0x31,0x58]
mcmpge.ew m1, m2, m3

# CHECK-INST: mcmpge.ew.x m1, a0, m2
# CHECK-ENC: encoding: [0xab,0x00,0x25,0x5a]
mcmpge.ew.x m1, a0, m2

# CHECK-INST: mcmplt.ew m1, m2, m3
# CHECK-ENC: encoding: [0xab,0x00,0x31,0x5c]
mcmplt.ew m1, m2, m3

# CHECK-INST: mcmplt.ew.x m1, a0, m2
# CHECK-ENC: encoding: [0xab,0x00,0x25,0x5e]
mcmplt.ew.x m1, a0, m2

# CHECK-INST: mcolbcast.ew.x m1, a0, m2
# CHECK-ENC: encoding: [0xab,0x00,0x25,0x64]
mcolbcast.ew.x m1, a0, m2

# CHECK-INST: mcolgather.ew m1, m2, m3
# CHECK-ENC: encoding: [0xab,0x00,0x31,0x66]
mcolgather.ew m1, m2, m3

# CHECK-INST: mcolid.ew m1
# CHECK-ENC: encoding: [0xab,0x00,0x01,0xa6]
mcolid.ew m1

# CHECK-INST: mcolshift.ew.x m1, a0, m2
# CHECK-ENC: encoding: [0xab,0x00,0x25,0x68]
mcolshift.ew.x m1, a0, m2

# CHECK-INST: mcolunzip.ew m1, m2
# CHECK-ENC: encoding: [0x2b,0x80,0x20,0xc2]
mcolunzip.ew m1, m2

# CHECK-INST: mcolzip.ew m1, m2
# CHECK-ENC: encoding: [0x2b,0x80,0x20,0xc4]
mcolzip.ew m1, m2

# CHECK-INST: mconv.ew m1, m2
# CHECK-ENC: encoding: [0xab,0x00,0xd1,0xa2]
mconv.ew m1, m2

# CHECK-INST: mbcast.m.x m1, a0, a1
# CHECK-ENC: encoding: [0xab,0x00,0xb5,0xb0]
mbcast.m.x m1, a0, a1

# CHECK-INST: mcos.ew m1, m2
# CHECK-ENC: encoding: [0xab,0x00,0xe1,0xa2]
mcos.ew m1, m2

# CHECK-INST: mexp2.ew m1, m2
# CHECK-ENC: encoding: [0xab,0x00,0xf1,0xa2]
mexp2.ew m1, m2

# CHECK-INST: mfrintm.ew m1, m2
# CHECK-ENC: encoding: [0xab,0x00,0x51,0xa2]
mfrintm.ew m1, m2

# CHECK-INST: mfrintn.ew m1, m2
# CHECK-ENC: encoding: [0xab,0x00,0x61,0xa2]
mfrintn.ew m1, m2

# CHECK-INST: mfrintp.ew m1, m2
# CHECK-ENC: encoding: [0xab,0x00,0x71,0xa2]
mfrintp.ew m1, m2

# CHECK-INST: mfrintz.ew m1, m2
# CHECK-ENC: encoding: [0xab,0x00,0x81,0xa2]
mfrintz.ew m1, m2

# CHECK-INST: mgettyp a0, m1
# CHECK-ENC: encoding: [0x2b,0x85,0x20,0xa2]
mgettyp a0, m1

# CHECK-INST: mhdiff.ew m1, m2, m3
# CHECK-ENC: encoding: [0xab,0x00,0x31,0x08]
mhdiff.ew m1, m2, m3

# CHECK-INST: mhdiff.ew.x m1, a0, m2
# CHECK-ENC: encoding: [0xab,0x00,0x25,0x0a]
mhdiff.ew.x m1, a0, m2

# CHECK-INST: mldexp.ew m1, m2, m3
# CHECK-ENC: encoding: [0xab,0x00,0x31,0x7e]
mldexp.ew m1, m2, m3

# CHECK-INST: mldexp.ew.x m1, a0, m2
# CHECK-ENC: encoding: [0xab,0x00,0x25,0x80]
mldexp.ew.x m1, a0, m2

# CHECK-INST: mldexpacc.ew m1, m2, m3
# CHECK-ENC: encoding: [0xab,0x00,0x31,0x82]
mldexpacc.ew m1, m2, m3

# CHECK-INST: mldexpacc.ew.x m1, a0, m2
# CHECK-ENC: encoding: [0xab,0x00,0x25,0x84]
mldexpacc.ew.x m1, a0, m2

# CHECK-INST: mlog2.ew m1, m2
# CHECK-ENC: encoding: [0xab,0x00,0x01,0xa3]
mlog2.ew m1, m2

# CHECK-INST: mlog2sub.ew m1, m2, m3
# CHECK-ENC: encoding: [0xab,0x00,0x31,0x86]
mlog2sub.ew m1, m2, m3

# CHECK-INST: mlog2sub.ew.x m1, a0, m2
# CHECK-ENC: encoding: [0xab,0x00,0x25,0x88]
mlog2sub.ew.x m1, a0, m2

# CHECK-INST: mls.1r m1, a0
# CHECK-ENC: encoding: [0xab,0x00,0x65,0xa3]
mls.1r m1, a0

# CHECK-INST: mls.cm m1, a0
# CHECK-ENC: encoding: [0xab,0x00,0x75,0xa3]
mls.cm m1, a0

# CHECK-INST: mls.rm m1, a0
# CHECK-ENC: encoding: [0xab,0x00,0x85,0xa3]
mls.rm m1, a0

# CHECK-INST: mls.st m1, (a0), a1
# CHECK-ENC: encoding: [0xab,0x00,0xb5,0xa8]
mls.st m1, (a0), a1

# CHECK-INST: mls.tst m1, (a0), a1
# CHECK-ENC: encoding: [0xab,0x00,0xb5,0xaa]
mls.tst m1, (a0), a1

# CHECK-INST: mmax.ew m1, m2, m3
# CHECK-ENC: encoding: [0xab,0x00,0x31,0x0c]
mmax.ew m1, m2, m3

# CHECK-INST: mmax.ew.x m1, a0, m2
# CHECK-ENC: encoding: [0xab,0x00,0x25,0x0e]
mmax.ew.x m1, a0, m2

# CHECK-INST: mmean.ew m1, m2, m3
# CHECK-ENC: encoding: [0xab,0x00,0x31,0x10]
mmean.ew m1, m2, m3

# CHECK-INST: mmean.ew.x m1, a0, m2
# CHECK-ENC: encoding: [0xab,0x00,0x25,0x12]
mmean.ew.x m1, a0, m2

# CHECK-INST: mmin.ew m1, m2, m3
# CHECK-ENC: encoding: [0xab,0x00,0x31,0x14]
mmin.ew m1, m2, m3

# CHECK-INST: mmin.ew.x m1, a0, m2
# CHECK-ENC: encoding: [0xab,0x00,0x25,0x16]
mmin.ew.x m1, a0, m2

# CHECK-INST: mmov.m.a m1, acc4
# CHECK-ENC: encoding: [0xab,0x00,0xc2,0xa3]
mmov.m.a m1, acc4

# CHECK-INST: mmov.a.m acc4, m1
# CHECK-ENC: encoding: [0x2b,0x82,0xd0,0xa3]
mmov.a.m acc4, m1

# CHECK-INST: mmov.m.m m1, m2
# CHECK-ENC: encoding: [0xab,0x00,0xe1,0xa3]
mmov.m.m m1, m2

# CHECK-INST: mmove8.m.x m1, a0, a1
# CHECK-ENC: encoding: [0xab,0x00,0xb5,0xb2]
mmove8.m.x m1, a0, a1

# CHECK-INST: mmove16.m.x m1, a0, a1
# CHECK-ENC: encoding: [0xab,0x00,0xb5,0xb4]
mmove16.m.x m1, a0, a1

# CHECK-INST: mmove32.m.x m1, a0, a1
# CHECK-ENC: encoding: [0xab,0x00,0xb5,0xb6]
mmove32.m.x m1, a0, a1

# CHECK-INST: mmove64.m.x m1, a0, a1
# CHECK-ENC: encoding: [0xab,0x00,0xb5,0xb8]
mmove64.m.x m1, a0, a1

# CHECK-INST: mmove8.x.m a0, m1, a1
# CHECK-ENC: encoding: [0x2b,0x85,0xb0,0xba]
mmove8.x.m a0, m1, a1

# CHECK-INST: mmove16.x.m a0, m1, a1
# CHECK-ENC: encoding: [0x2b,0x85,0xb0,0xbc]
mmove16.x.m a0, m1, a1

# CHECK-INST: mmove32.x.m a0, m1, a1
# CHECK-ENC: encoding: [0x2b,0x85,0xb0,0xbe]
mmove32.x.m a0, m1, a1

# CHECK-INST: mmove64.x.m a0, m1, a1
# CHECK-ENC: encoding: [0x2b,0x85,0xb0,0xc0]
mmove64.x.m a0, m1, a1

# CHECK-INST: mmul.ew m1, m2, m3
# CHECK-ENC: encoding: [0xab,0x00,0x31,0x18]
mmul.ew m1, m2, m3

# CHECK-INST: mmul.ew.x m1, a0, m2
# CHECK-ENC: encoding: [0xab,0x00,0x25,0x1a]
mmul.ew.x m1, a0, m2

# CHECK-INST: mmulacc.2d acc4, m1, m2
# CHECK-ENC: encoding: [0x2b,0x82,0x20,0x94]
mmulacc.2d acc4, m1, m2

# CHECK-INST: mmulacc.ew m1, m2, m3
# CHECK-ENC: encoding: [0xab,0x00,0x31,0x1c]
mmulacc.ew m1, m2, m3

# CHECK-INST: mmulacc.ew.x m1, a0, m2
# CHECK-ENC: encoding: [0xab,0x00,0x25,0x1e]
mmulacc.ew.x m1, a0, m2

# CHECK-INST: mmulaccneg.2d acc4, m1, m2
# CHECK-ENC: encoding: [0x2b,0x82,0x20,0x96]
mmulaccneg.2d acc4, m1, m2

# CHECK-INST: mmulaccneg.ew m1, m2, m3
# CHECK-ENC: encoding: [0xab,0x00,0x31,0x20]
mmulaccneg.ew m1, m2, m3

# CHECK-INST: mmulaccneg.ew.x m1, a0, m2
# CHECK-ENC: encoding: [0xab,0x00,0x25,0x22]
mmulaccneg.ew.x m1, a0, m2

# CHECK-INST: mmuladd.ew m1, m2, m3
# CHECK-ENC: encoding: [0xab,0x00,0x31,0x24]
mmuladd.ew m1, m2, m3

# CHECK-INST: mmuladd.ew.x m1, a0, m2
# CHECK-ENC: encoding: [0xab,0x00,0x25,0x26]
mmuladd.ew.x m1, a0, m2

# CHECK-INST: mmulatacc.2d acc4, m1, m2
# CHECK-ENC: encoding: [0x2b,0x82,0x20,0x9a]
mmulatacc.2d acc4, m1, m2

# CHECK-INST: mmulataccneg.2d acc4, m1, m2
# CHECK-ENC: encoding: [0x2b,0x82,0x20,0x9c]
mmulataccneg.2d acc4, m1, m2

# CHECK-INST: mmulbtacc.2d acc4, m1, m2
# CHECK-ENC: encoding: [0x2b,0x82,0x20,0x9e]
mmulbtacc.2d acc4, m1, m2

# CHECK-INST: mmulbtaccneg.2d acc4, m1, m2
# CHECK-ENC: encoding: [0x2b,0x82,0x20,0xa0]
mmulbtaccneg.2d acc4, m1, m2

# CHECK-INST: mmulneg.ew m1, m2, m3
# CHECK-ENC: encoding: [0xab,0x00,0x31,0x28]
mmulneg.ew m1, m2, m3

# CHECK-INST: mmulneg.ew.x m1, a0, m2
# CHECK-ENC: encoding: [0xab,0x00,0x25,0x2a]
mmulneg.ew.x m1, a0, m2

# CHECK-INST: mmulsub.ew m1, m2, m3
# CHECK-ENC: encoding: [0xab,0x00,0x31,0x2c]
mmulsub.ew m1, m2, m3

# CHECK-INST: mmulsub.ew.x m1, a0, m2
# CHECK-ENC: encoding: [0xab,0x00,0x25,0x2e]
mmulsub.ew.x m1, a0, m2

# CHECK-INST: mor.ew m1, m2, m3
# CHECK-ENC: encoding: [0xab,0x00,0x31,0x3c]
mor.ew m1, m2, m3

# CHECK-INST: mor.ew.x m1, a0, m2
# CHECK-ENC: encoding: [0xab,0x00,0x25,0x3e]
mor.ew.x m1, a0, m2

# CHECK-INST: mornot.ew m1, m2, m3
# CHECK-ENC: encoding: [0xab,0x00,0x31,0x40]
mornot.ew m1, m2, m3

# CHECK-INST: mornot.ew.x m1, a0, m2
# CHECK-ENC: encoding: [0xab,0x00,0x25,0x42]
mornot.ew.x m1, a0, m2

# CHECK-INST: mpack.ew.x m1, a0, m2
# CHECK-ENC: encoding: [0xab,0x00,0x25,0x7a]
mpack.ew.x m1, a0, m2

# CHECK-INST: mprefixadd.col m1, m2
# CHECK-ENC: encoding: [0xab,0x00,0xf1,0xa3]
mprefixadd.col m1, m2

# CHECK-INST: mprefixadd.row m1, m2
# CHECK-ENC: encoding: [0xab,0x00,0x01,0xa4]
mprefixadd.row m1, m2

# CHECK-INST: mprefixmax.col m1, m2
# CHECK-ENC: encoding: [0xab,0x00,0x11,0xa4]
mprefixmax.col m1, m2

# CHECK-INST: mprefixmax.row m1, m2
# CHECK-ENC: encoding: [0xab,0x00,0x21,0xa4]
mprefixmax.row m1, m2

# CHECK-INST: mrdexp.ew m1, m2, m3
# CHECK-ENC: encoding: [0xab,0x00,0x31,0x8a]
mrdexp.ew m1, m2, m3

# CHECK-INST: mrdexpacc.ew m1, m2, m3
# CHECK-ENC: encoding: [0xab,0x00,0x31,0x8c]
mrdexpacc.ew m1, m2, m3

# CHECK-INST: mrec.ew m1, m2
# CHECK-ENC: encoding: [0xab,0x00,0x11,0xa3]
mrec.ew m1, m2

# CHECK-INST: mreduceadd.col m1, m2
# CHECK-ENC: encoding: [0xab,0x00,0x31,0xa4]
mreduceadd.col m1, m2

# CHECK-INST: mreduceadd.row m1, m2
# CHECK-ENC: encoding: [0xab,0x00,0x41,0xa4]
mreduceadd.row m1, m2

# CHECK-INST: mreducemax.col m1, m2
# CHECK-ENC: encoding: [0xab,0x00,0x51,0xa4]
mreducemax.col m1, m2

# CHECK-INST: mreducemax.row m1, m2
# CHECK-ENC: encoding: [0xab,0x00,0x61,0xa4]
mreducemax.row m1, m2

# CHECK-INST: mreducemin.col m1, m2
# CHECK-ENC: encoding: [0xab,0x00,0x71,0xa4]
mreducemin.col m1, m2

# CHECK-INST: mreducemin.row m1, m2
# CHECK-ENC: encoding: [0xab,0x00,0x81,0xa4]
mreducemin.row m1, m2

# CHECK-INST: mrowbcast.ew.x m1, a0, m2
# CHECK-ENC: encoding: [0xab,0x00,0x25,0x6a]
mrowbcast.ew.x m1, a0, m2

# CHECK-INST: mrowgather.ew m1, m2, m3
# CHECK-ENC: encoding: [0xab,0x00,0x31,0x6c]
mrowgather.ew m1, m2, m3

# CHECK-INST: mrowid.ew m1
# CHECK-ENC: encoding: [0xab,0x80,0x01,0xa6]
mrowid.ew m1

# CHECK-INST: mrowshift.ew.x m1, a0, m2
# CHECK-ENC: encoding: [0xab,0x00,0x25,0x6e]
mrowshift.ew.x m1, a0, m2

# CHECK-INST: mrowunzip.ew m1, m2
# CHECK-ENC: encoding: [0x2b,0x80,0x20,0xc6]
mrowunzip.ew m1, m2

# CHECK-INST: mrowzip.ew m1, m2
# CHECK-ENC: encoding: [0x2b,0x80,0x20,0x70]
mrowzip.ew m1, m2

# CHECK-INST: mrsqrt.ew m1, m2
# CHECK-ENC: encoding: [0xab,0x00,0x21,0xa3]
mrsqrt.ew m1, m2

# CHECK-INST: mrowscatadd.ew m1, m2, m3
# CHECK-ENC: encoding: [0xab,0x00,0x31,0x72]
mrowscatadd.ew m1, m2, m3

# CHECK-INST: mcolscatadd.ew m1, m2, m3
# CHECK-ENC: encoding: [0xab,0x00,0x31,0x74]
mcolscatadd.ew m1, m2, m3

# CHECK-INST: mrowscatmax.ew m1, m2, m3
# CHECK-ENC: encoding: [0xab,0x00,0x31,0x76]
mrowscatmax.ew m1, m2, m3

# CHECK-INST: mcolscatmax.ew m1, m2, m3
# CHECK-ENC: encoding: [0xab,0x00,0x31,0x78]
mcolscatmax.ew m1, m2, m3

# CHECK-INST: mselge.ew m1, m2, m3
# CHECK-ENC: encoding: [0xab,0x00,0x31,0x60]
mselge.ew m1, m2, m3

# CHECK-INST: msellt.ew m1, m2, m3
# CHECK-ENC: encoding: [0xab,0x00,0x31,0x62]
msellt.ew m1, m2, m3

# CHECK-INST: msettyp m1, a0
# CHECK-ENC: encoding: [0xab,0x00,0x35,0xa2]
msettyp m1, a0

# CHECK-INST: msin.ew m1, m2
# CHECK-ENC: encoding: [0xab,0x00,0x31,0xa3]
msin.ew m1, m2

# CHECK-INST: msll.ew m1, m2, m3
# CHECK-ENC: encoding: [0xab,0x00,0x31,0x44]
msll.ew m1, m2, m3

# CHECK-INST: msll.ew.x m1, a0, m2
# CHECK-ENC: encoding: [0xab,0x00,0x25,0x46]
msll.ew.x m1, a0, m2

# CHECK-INST: msqrt.ew m1, m2
# CHECK-ENC: encoding: [0xab,0x00,0x41,0xa3]
msqrt.ew m1, m2

# CHECK-INST: msra.ew m1, m2, m3
# CHECK-ENC: encoding: [0xab,0x00,0x31,0x48]
msra.ew m1, m2, m3

# CHECK-INST: msra.ew.x m1, a0, m2
# CHECK-ENC: encoding: [0xab,0x00,0x25,0x4a]
msra.ew.x m1, a0, m2

# CHECK-INST: msrl.ew m1, m2, m3
# CHECK-ENC: encoding: [0xab,0x00,0x31,0x4c]
msrl.ew m1, m2, m3

# CHECK-INST: msrl.ew.x m1, a0, m2
# CHECK-ENC: encoding: [0xab,0x00,0x25,0x4e]
msrl.ew.x m1, a0, m2

# CHECK-INST: mss.1r m1, a0
# CHECK-ENC: encoding: [0xab,0x00,0x95,0xa3]
mss.1r m1, a0

# CHECK-INST: mss.cm m1, a0
# CHECK-ENC: encoding: [0xab,0x00,0xa5,0xa3]
mss.cm m1, a0

# CHECK-INST: mss.rm m1, a0
# CHECK-ENC: encoding: [0xab,0x00,0xb5,0xa3]
mss.rm m1, a0

# CHECK-INST: mss.st m1, (a0), a1
# CHECK-ENC: encoding: [0xab,0x00,0xb5,0xac]
mss.st m1, (a0), a1

# CHECK-INST: mss.tst m1, (a0), a1
# CHECK-ENC: encoding: [0xab,0x00,0xb5,0xae]
mss.tst m1, (a0), a1

# CHECK-INST: msub.ew m1, m2, m3
# CHECK-ENC: encoding: [0xab,0x00,0x31,0x30]
msub.ew m1, m2, m3

# CHECK-INST: msub.ew.x m1, a0, m2
# CHECK-ENC: encoding: [0xab,0x00,0x25,0x32]
msub.ew.x m1, a0, m2

# CHECK-INST: msublog2.ew m1, m2, m3
# CHECK-ENC: encoding: [0xab,0x00,0x31,0x8e]
msublog2.ew m1, m2, m3

# CHECK-INST: msublog2.ew.x m1, a0, m2
# CHECK-ENC: encoding: [0xab,0x00,0x25,0x90]
msublog2.ew.x m1, a0, m2

# CHECK-INST: mtanh.ew m1, m2
# CHECK-ENC: encoding: [0xab,0x00,0x51,0xa3]
mtanh.ew m1, m2

# CHECK-INST: munpack.ew.x m1, a0, m2
# CHECK-ENC: encoding: [0xab,0x00,0x25,0x7c]
munpack.ew.x m1, a0, m2

# CHECK-INST: mxor.ew m1, m2, m3
# CHECK-ENC: encoding: [0xab,0x00,0x31,0x50]
mxor.ew m1, m2, m3

# CHECK-INST: mxor.ew.x m1, a0, m2
# CHECK-ENC: encoding: [0xab,0x00,0x25,0x52]
mxor.ew.x m1, a0, m2

# CHECK-INST: mzero.2d.acc acc4
# CHECK-ENC: encoding: [0x2b,0x02,0x00,0xa6]
mzero.2d.acc acc4

# CHECK-INST: mzero.2d.m m1
# CHECK-ENC: encoding: [0xab,0x80,0x00,0xa6]
mzero.2d.m m1
