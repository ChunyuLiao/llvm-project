//===-- RISCVInstrInfoAME.td - Attached Matrix Extension -*- tablegen -*-===//
// Generated from the AME (Ztt) v0.6 instruction encoding table.

class AMEInstR3<bits<7> funct7, dag outs, dag ins, string opcodestr,
                string argstr>
    : RVInstR<funct7, 0b000, OPC_CUSTOM_1, outs, ins, opcodestr, argstr>;

class AMEInstR2<bits<7> funct7, bits<5> xfunct5, dag outs, dag ins,
                string opcodestr, string argstr>
    : RVInstR<funct7, 0b000, OPC_CUSTOM_1, outs, ins, opcodestr, argstr> {
  let rs2 = xfunct5;
}

class AMEInstR1<bits<7> funct7, bits<10> xfunct10, dag outs,
                string opcodestr, string argstr>
    : RVInstR<funct7, 0b000, OPC_CUSTOM_1, outs, (ins), opcodestr, argstr> {
  let rs2 = xfunct10{9-5};
  let rs1 = xfunct10{4-0};
}

class AMEInstR3InPlace<bits<7> funct7, string opcodestr>
    : RVInstR<funct7, 0b000, OPC_CUSTOM_1,
              (outs AMEMR:$rs1_wb, AMEMR:$rs2_wb),
              (ins AMEMR:$rs1, AMEMR:$rs2), opcodestr,
              "${rs1}, ${rs2}"> {
  let rd = 0;
  let Constraints = "$rs1 = $rs1_wb, $rs2 = $rs2_wb";
}

class AMEInstFixed<bits<32> value, string opcodestr>
    : RVInst<(outs), (ins), opcodestr, "", [], InstFormatOther> {
  let Inst = value;
}

let hasSideEffects = 0, mayLoad = 0, mayStore = 0 in {
let Predicates = [HasStdExtZtt] in {
def AME_AME_ACQUIRE : AMEInstR2<0x52, 0x09, (outs GPR:$rd), (ins GPR:$rs1), "ame.acquire", "${rd}, ${rs1}">;
def AME_AME_RELEASE : AMEInstFixed<0xa4a0002b, "ame.release">;
def AME_AGETTYP : AMEInstR2<0x51, 0x00, (outs GPR:$rd), (ins AMEAR:$rs1), "agettyp", "${rd}, ${rs1}">;
def AME_ASETTYP : AMEInstR2<0x51, 0x01, (outs AMEAR:$rd), (ins GPR:$rs1), "asettyp", "${rd}, ${rs1}">;
def AME_MABS_EW : AMEInstR2<0x51, 0x04, (outs AMEMR:$rd), (ins AMEMR:$rs1), "mabs.ew", "${rd}, ${rs1}">;
def AME_MABSDIFF_EW : AMEInstR3<0x00, (outs AMEMR:$rd), (ins AMEMR:$rs1, AMEMR:$rs2), "mabsdiff.ew", "${rd}, ${rs1}, ${rs2}">;
def AME_MABSDIFF_EW_X : AMEInstR3<0x01, (outs AMEMR:$rd), (ins GPR:$rs1, AMEMR:$rs2), "mabsdiff.ew.x", "${rd}, ${rs1}, ${rs2}">;
def AME_MADD_EW : AMEInstR3<0x02, (outs AMEMR:$rd), (ins AMEMR:$rs1, AMEMR:$rs2), "madd.ew", "${rd}, ${rs1}, ${rs2}">;
def AME_MADD_EW_X : AMEInstR3<0x03, (outs AMEMR:$rd), (ins GPR:$rs1, AMEMR:$rs2), "madd.ew.x", "${rd}, ${rs1}, ${rs2}">;
def AME_MAND_EW : AMEInstR3<0x1a, (outs AMEMR:$rd), (ins AMEMR:$rs1, AMEMR:$rs2), "mand.ew", "${rd}, ${rs1}, ${rs2}">;
def AME_MAND_EW_X : AMEInstR3<0x1b, (outs AMEMR:$rd), (ins GPR:$rs1, AMEMR:$rs2), "mand.ew.x", "${rd}, ${rs1}, ${rs2}">;
def AME_MANDNOT_EW : AMEInstR3<0x1c, (outs AMEMR:$rd), (ins AMEMR:$rs1, AMEMR:$rs2), "mandnot.ew", "${rd}, ${rs1}, ${rs2}">;
def AME_MANDNOT_EW_X : AMEInstR3<0x1d, (outs AMEMR:$rd), (ins GPR:$rs1, AMEMR:$rs2), "mandnot.ew.x", "${rd}, ${rs1}, ${rs2}">;
def AME_MCMOVGE_EW : AMEInstR3<0x2a, (outs AMEMR:$rd), (ins AMEMR:$rs1, AMEMR:$rs2), "mcmovge.ew", "${rd}, ${rs1}, ${rs2}">;
def AME_MCMOVLT_EW : AMEInstR3<0x2b, (outs AMEMR:$rd), (ins AMEMR:$rs1, AMEMR:$rs2), "mcmovlt.ew", "${rd}, ${rs1}, ${rs2}">;
def AME_MCMPGE_EW : AMEInstR3<0x2c, (outs AMEMR:$rd), (ins AMEMR:$rs1, AMEMR:$rs2), "mcmpge.ew", "${rd}, ${rs1}, ${rs2}">;
def AME_MCMPGE_EW_X : AMEInstR3<0x2d, (outs AMEMR:$rd), (ins GPR:$rs1, AMEMR:$rs2), "mcmpge.ew.x", "${rd}, ${rs1}, ${rs2}">;
def AME_MCMPLT_EW : AMEInstR3<0x2e, (outs AMEMR:$rd), (ins AMEMR:$rs1, AMEMR:$rs2), "mcmplt.ew", "${rd}, ${rs1}, ${rs2}">;
def AME_MCMPLT_EW_X : AMEInstR3<0x2f, (outs AMEMR:$rd), (ins GPR:$rs1, AMEMR:$rs2), "mcmplt.ew.x", "${rd}, ${rs1}, ${rs2}">;
def AME_MCOLBCAST_EW_X : AMEInstR3<0x32, (outs AMEMR:$rd), (ins GPR:$rs1, AMEMR:$rs2), "mcolbcast.ew.x", "${rd}, ${rs1}, ${rs2}">;
def AME_MCOLGATHER_EW : AMEInstR3<0x33, (outs AMEMR:$rd), (ins AMEMR:$rs1, AMEMR:$rs2), "mcolgather.ew", "${rd}, ${rs1}, ${rs2}">;
def AME_MCOLID_EW : AMEInstR1<0x53, 0x002, (outs AMEMR:$rd), "mcolid.ew", "${rd}">;
def AME_MCOLSHIFT_EW_X : AMEInstR3<0x34, (outs AMEMR:$rd), (ins GPR:$rs1, AMEMR:$rs2), "mcolshift.ew.x", "${rd}, ${rs1}, ${rs2}">;
def AME_MCOLUNZIP_EW : AMEInstR3InPlace<0x61, "mcolunzip.ew">;
def AME_MCOLZIP_EW : AMEInstR3InPlace<0x62, "mcolzip.ew">;
def AME_MCONV_EW : AMEInstR2<0x51, 0x0d, (outs AMEMR:$rd), (ins AMEMR:$rs1), "mconv.ew", "${rd}, ${rs1}">;
def AME_MBCAST_M_X : AMEInstR3<0x58, (outs AMEMR:$rd), (ins GPR:$rs1, GPR:$rs2), "mbcast.m.x", "${rd}, ${rs1}, ${rs2}">;
def AME_MCOS_EW : AMEInstR2<0x51, 0x0e, (outs AMEMR:$rd), (ins AMEMR:$rs1), "mcos.ew", "${rd}, ${rs1}">;
def AME_MEXP2_EW : AMEInstR2<0x51, 0x0f, (outs AMEMR:$rd), (ins AMEMR:$rs1), "mexp2.ew", "${rd}, ${rs1}">;
def AME_MFRINTM_EW : AMEInstR2<0x51, 0x05, (outs AMEMR:$rd), (ins AMEMR:$rs1), "mfrintm.ew", "${rd}, ${rs1}">;
def AME_MFRINTN_EW : AMEInstR2<0x51, 0x06, (outs AMEMR:$rd), (ins AMEMR:$rs1), "mfrintn.ew", "${rd}, ${rs1}">;
def AME_MFRINTP_EW : AMEInstR2<0x51, 0x07, (outs AMEMR:$rd), (ins AMEMR:$rs1), "mfrintp.ew", "${rd}, ${rs1}">;
def AME_MFRINTZ_EW : AMEInstR2<0x51, 0x08, (outs AMEMR:$rd), (ins AMEMR:$rs1), "mfrintz.ew", "${rd}, ${rs1}">;
def AME_MGETTYP : AMEInstR2<0x51, 0x02, (outs GPR:$rd), (ins AMEMR:$rs1), "mgettyp", "${rd}, ${rs1}">;
def AME_MHDIFF_EW : AMEInstR3<0x04, (outs AMEMR:$rd), (ins AMEMR:$rs1, AMEMR:$rs2), "mhdiff.ew", "${rd}, ${rs1}, ${rs2}">;
def AME_MHDIFF_EW_X : AMEInstR3<0x05, (outs AMEMR:$rd), (ins GPR:$rs1, AMEMR:$rs2), "mhdiff.ew.x", "${rd}, ${rs1}, ${rs2}">;
def AME_MLDEXP_EW : AMEInstR3<0x3f, (outs AMEMR:$rd), (ins AMEMR:$rs1, AMEMR:$rs2), "mldexp.ew", "${rd}, ${rs1}, ${rs2}">;
def AME_MLDEXP_EW_X : AMEInstR3<0x40, (outs AMEMR:$rd), (ins GPR:$rs1, AMEMR:$rs2), "mldexp.ew.x", "${rd}, ${rs1}, ${rs2}">;
def AME_MLDEXPACC_EW : AMEInstR3<0x41, (outs AMEMR:$rd), (ins AMEMR:$rs1, AMEMR:$rs2), "mldexpacc.ew", "${rd}, ${rs1}, ${rs2}">;
def AME_MLDEXPACC_EW_X : AMEInstR3<0x42, (outs AMEMR:$rd), (ins GPR:$rs1, AMEMR:$rs2), "mldexpacc.ew.x", "${rd}, ${rs1}, ${rs2}">;
def AME_MLOG2_EW : AMEInstR2<0x51, 0x10, (outs AMEMR:$rd), (ins AMEMR:$rs1), "mlog2.ew", "${rd}, ${rs1}">;
def AME_MLOG2SUB_EW : AMEInstR3<0x43, (outs AMEMR:$rd), (ins AMEMR:$rs1, AMEMR:$rs2), "mlog2sub.ew", "${rd}, ${rs1}, ${rs2}">;
def AME_MLOG2SUB_EW_X : AMEInstR3<0x44, (outs AMEMR:$rd), (ins GPR:$rs1, AMEMR:$rs2), "mlog2sub.ew.x", "${rd}, ${rs1}, ${rs2}">;
def AME_MLS_1R : AMEInstR2<0x51, 0x16, (outs AMEMR:$rd), (ins GPR:$rs1), "mls.1r", "${rd}, ${rs1}">;
def AME_MLS_CM : AMEInstR2<0x51, 0x17, (outs AMEMR:$rd), (ins GPR:$rs1), "mls.cm", "${rd}, ${rs1}">;
def AME_MLS_RM : AMEInstR2<0x51, 0x18, (outs AMEMR:$rd), (ins GPR:$rs1), "mls.rm", "${rd}, ${rs1}">;
def AME_MLS_ST : AMEInstR3<0x54, (outs AMEMR:$rd), (ins GPR:$rs1, GPR:$rs2), "mls.st", "${rd}, (${rs1}), ${rs2}">;
def AME_MLS_TST : AMEInstR3<0x55, (outs AMEMR:$rd), (ins GPR:$rs1, GPR:$rs2), "mls.tst", "${rd}, (${rs1}), ${rs2}">;
def AME_MMAX_EW : AMEInstR3<0x06, (outs AMEMR:$rd), (ins AMEMR:$rs1, AMEMR:$rs2), "mmax.ew", "${rd}, ${rs1}, ${rs2}">;
def AME_MMAX_EW_X : AMEInstR3<0x07, (outs AMEMR:$rd), (ins GPR:$rs1, AMEMR:$rs2), "mmax.ew.x", "${rd}, ${rs1}, ${rs2}">;
def AME_MMEAN_EW : AMEInstR3<0x08, (outs AMEMR:$rd), (ins AMEMR:$rs1, AMEMR:$rs2), "mmean.ew", "${rd}, ${rs1}, ${rs2}">;
def AME_MMEAN_EW_X : AMEInstR3<0x09, (outs AMEMR:$rd), (ins GPR:$rs1, AMEMR:$rs2), "mmean.ew.x", "${rd}, ${rs1}, ${rs2}">;
def AME_MMIN_EW : AMEInstR3<0x0a, (outs AMEMR:$rd), (ins AMEMR:$rs1, AMEMR:$rs2), "mmin.ew", "${rd}, ${rs1}, ${rs2}">;
def AME_MMIN_EW_X : AMEInstR3<0x0b, (outs AMEMR:$rd), (ins GPR:$rs1, AMEMR:$rs2), "mmin.ew.x", "${rd}, ${rs1}, ${rs2}">;
def AME_MMOV_M_A : AMEInstR2<0x51, 0x1c, (outs AMEMR:$rd), (ins AMEAR:$rs1), "mmov.m.a", "${rd}, ${rs1}">;
def AME_MMOV_A_M : AMEInstR2<0x51, 0x1d, (outs AMEAR:$rd), (ins AMEMR:$rs1), "mmov.a.m", "${rd}, ${rs1}">;
def AME_MMOV_M_M : AMEInstR2<0x51, 0x1e, (outs AMEMR:$rd), (ins AMEMR:$rs1), "mmov.m.m", "${rd}, ${rs1}">;
def AME_MMOVE8_M_X : AMEInstR3<0x59, (outs AMEMR:$rd), (ins GPR:$rs1, GPR:$rs2), "mmove8.m.x", "${rd}, ${rs1}, ${rs2}">;
def AME_MMOVE16_M_X : AMEInstR3<0x5a, (outs AMEMR:$rd), (ins GPR:$rs1, GPR:$rs2), "mmove16.m.x", "${rd}, ${rs1}, ${rs2}">;
def AME_MMOVE32_M_X : AMEInstR3<0x5b, (outs AMEMR:$rd), (ins GPR:$rs1, GPR:$rs2), "mmove32.m.x", "${rd}, ${rs1}, ${rs2}">;
def AME_MMOVE64_M_X : AMEInstR3<0x5c, (outs AMEMR:$rd), (ins GPR:$rs1, GPR:$rs2), "mmove64.m.x", "${rd}, ${rs1}, ${rs2}">;
def AME_MMOVE8_X_M : AMEInstR3<0x5d, (outs GPR:$rd), (ins AMEMR:$rs1, GPR:$rs2), "mmove8.x.m", "${rd}, ${rs1}, ${rs2}">;
def AME_MMOVE16_X_M : AMEInstR3<0x5e, (outs GPR:$rd), (ins AMEMR:$rs1, GPR:$rs2), "mmove16.x.m", "${rd}, ${rs1}, ${rs2}">;
def AME_MMOVE32_X_M : AMEInstR3<0x5f, (outs GPR:$rd), (ins AMEMR:$rs1, GPR:$rs2), "mmove32.x.m", "${rd}, ${rs1}, ${rs2}">;
def AME_MMOVE64_X_M : AMEInstR3<0x60, (outs GPR:$rd), (ins AMEMR:$rs1, GPR:$rs2), "mmove64.x.m", "${rd}, ${rs1}, ${rs2}">;
def AME_MMUL_EW : AMEInstR3<0x0c, (outs AMEMR:$rd), (ins AMEMR:$rs1, AMEMR:$rs2), "mmul.ew", "${rd}, ${rs1}, ${rs2}">;
def AME_MMUL_EW_X : AMEInstR3<0x0d, (outs AMEMR:$rd), (ins GPR:$rs1, AMEMR:$rs2), "mmul.ew.x", "${rd}, ${rs1}, ${rs2}">;
def AME_MMULACC_2D : AMEInstR3<0x4a, (outs AMEAR:$rd), (ins AMEMR:$rs1, AMEMR:$rs2), "mmulacc.2d", "${rd}, ${rs1}, ${rs2}">;
def AME_MMULACC_EW : AMEInstR3<0x0e, (outs AMEMR:$rd), (ins AMEMR:$rs1, AMEMR:$rs2), "mmulacc.ew", "${rd}, ${rs1}, ${rs2}">;
def AME_MMULACC_EW_X : AMEInstR3<0x0f, (outs AMEMR:$rd), (ins GPR:$rs1, AMEMR:$rs2), "mmulacc.ew.x", "${rd}, ${rs1}, ${rs2}">;
def AME_MMULACCNEG_2D : AMEInstR3<0x4b, (outs AMEAR:$rd), (ins AMEMR:$rs1, AMEMR:$rs2), "mmulaccneg.2d", "${rd}, ${rs1}, ${rs2}">;
def AME_MMULACCNEG_EW : AMEInstR3<0x10, (outs AMEMR:$rd), (ins AMEMR:$rs1, AMEMR:$rs2), "mmulaccneg.ew", "${rd}, ${rs1}, ${rs2}">;
def AME_MMULACCNEG_EW_X : AMEInstR3<0x11, (outs AMEMR:$rd), (ins GPR:$rs1, AMEMR:$rs2), "mmulaccneg.ew.x", "${rd}, ${rs1}, ${rs2}">;
def AME_MMULADD_EW : AMEInstR3<0x12, (outs AMEMR:$rd), (ins AMEMR:$rs1, AMEMR:$rs2), "mmuladd.ew", "${rd}, ${rs1}, ${rs2}">;
def AME_MMULADD_EW_X : AMEInstR3<0x13, (outs AMEMR:$rd), (ins GPR:$rs1, AMEMR:$rs2), "mmuladd.ew.x", "${rd}, ${rs1}, ${rs2}">;
def AME_MMULATACC_2D : AMEInstR3<0x4d, (outs AMEAR:$rd), (ins AMEMR:$rs1, AMEMR:$rs2), "mmulatacc.2d", "${rd}, ${rs1}, ${rs2}">;
def AME_MMULATACCNEG_2D : AMEInstR3<0x4e, (outs AMEAR:$rd), (ins AMEMR:$rs1, AMEMR:$rs2), "mmulataccneg.2d", "${rd}, ${rs1}, ${rs2}">;
def AME_MMULBTACC_2D : AMEInstR3<0x4f, (outs AMEAR:$rd), (ins AMEMR:$rs1, AMEMR:$rs2), "mmulbtacc.2d", "${rd}, ${rs1}, ${rs2}">;
def AME_MMULBTACCNEG_2D : AMEInstR3<0x50, (outs AMEAR:$rd), (ins AMEMR:$rs1, AMEMR:$rs2), "mmulbtaccneg.2d", "${rd}, ${rs1}, ${rs2}">;
def AME_MMULNEG_EW : AMEInstR3<0x14, (outs AMEMR:$rd), (ins AMEMR:$rs1, AMEMR:$rs2), "mmulneg.ew", "${rd}, ${rs1}, ${rs2}">;
def AME_MMULNEG_EW_X : AMEInstR3<0x15, (outs AMEMR:$rd), (ins GPR:$rs1, AMEMR:$rs2), "mmulneg.ew.x", "${rd}, ${rs1}, ${rs2}">;
def AME_MMULSUB_EW : AMEInstR3<0x16, (outs AMEMR:$rd), (ins AMEMR:$rs1, AMEMR:$rs2), "mmulsub.ew", "${rd}, ${rs1}, ${rs2}">;
def AME_MMULSUB_EW_X : AMEInstR3<0x17, (outs AMEMR:$rd), (ins GPR:$rs1, AMEMR:$rs2), "mmulsub.ew.x", "${rd}, ${rs1}, ${rs2}">;
def AME_MOR_EW : AMEInstR3<0x1e, (outs AMEMR:$rd), (ins AMEMR:$rs1, AMEMR:$rs2), "mor.ew", "${rd}, ${rs1}, ${rs2}">;
def AME_MOR_EW_X : AMEInstR3<0x1f, (outs AMEMR:$rd), (ins GPR:$rs1, AMEMR:$rs2), "mor.ew.x", "${rd}, ${rs1}, ${rs2}">;
def AME_MORNOT_EW : AMEInstR3<0x20, (outs AMEMR:$rd), (ins AMEMR:$rs1, AMEMR:$rs2), "mornot.ew", "${rd}, ${rs1}, ${rs2}">;
def AME_MORNOT_EW_X : AMEInstR3<0x21, (outs AMEMR:$rd), (ins GPR:$rs1, AMEMR:$rs2), "mornot.ew.x", "${rd}, ${rs1}, ${rs2}">;
def AME_MPACK_EW_X : AMEInstR3<0x3d, (outs AMEMR:$rd), (ins GPR:$rs1, AMEMR:$rs2), "mpack.ew.x", "${rd}, ${rs1}, ${rs2}">;
def AME_MPREFIXADD_COL : AMEInstR2<0x51, 0x1f, (outs AMEMR:$rd), (ins AMEMR:$rs1), "mprefixadd.col", "${rd}, ${rs1}">;
def AME_MPREFIXADD_ROW : AMEInstR2<0x52, 0x00, (outs AMEMR:$rd), (ins AMEMR:$rs1), "mprefixadd.row", "${rd}, ${rs1}">;
def AME_MPREFIXMAX_COL : AMEInstR2<0x52, 0x01, (outs AMEMR:$rd), (ins AMEMR:$rs1), "mprefixmax.col", "${rd}, ${rs1}">;
def AME_MPREFIXMAX_ROW : AMEInstR2<0x52, 0x02, (outs AMEMR:$rd), (ins AMEMR:$rs1), "mprefixmax.row", "${rd}, ${rs1}">;
def AME_MRDEXP_EW : AMEInstR3<0x45, (outs AMEMR:$rd), (ins AMEMR:$rs1, AMEMR:$rs2), "mrdexp.ew", "${rd}, ${rs1}, ${rs2}">;
def AME_MRDEXPACC_EW : AMEInstR3<0x46, (outs AMEMR:$rd), (ins AMEMR:$rs1, AMEMR:$rs2), "mrdexpacc.ew", "${rd}, ${rs1}, ${rs2}">;
def AME_MREC_EW : AMEInstR2<0x51, 0x11, (outs AMEMR:$rd), (ins AMEMR:$rs1), "mrec.ew", "${rd}, ${rs1}">;
def AME_MREDUCEADD_COL : AMEInstR2<0x52, 0x03, (outs AMEMR:$rd), (ins AMEMR:$rs1), "mreduceadd.col", "${rd}, ${rs1}">;
def AME_MREDUCEADD_ROW : AMEInstR2<0x52, 0x04, (outs AMEMR:$rd), (ins AMEMR:$rs1), "mreduceadd.row", "${rd}, ${rs1}">;
def AME_MREDUCEMAX_COL : AMEInstR2<0x52, 0x05, (outs AMEMR:$rd), (ins AMEMR:$rs1), "mreducemax.col", "${rd}, ${rs1}">;
def AME_MREDUCEMAX_ROW : AMEInstR2<0x52, 0x06, (outs AMEMR:$rd), (ins AMEMR:$rs1), "mreducemax.row", "${rd}, ${rs1}">;
def AME_MREDUCEMIN_COL : AMEInstR2<0x52, 0x07, (outs AMEMR:$rd), (ins AMEMR:$rs1), "mreducemin.col", "${rd}, ${rs1}">;
def AME_MREDUCEMIN_ROW : AMEInstR2<0x52, 0x08, (outs AMEMR:$rd), (ins AMEMR:$rs1), "mreducemin.row", "${rd}, ${rs1}">;
def AME_MROWBCAST_EW_X : AMEInstR3<0x35, (outs AMEMR:$rd), (ins GPR:$rs1, AMEMR:$rs2), "mrowbcast.ew.x", "${rd}, ${rs1}, ${rs2}">;
def AME_MROWGATHER_EW : AMEInstR3<0x36, (outs AMEMR:$rd), (ins AMEMR:$rs1, AMEMR:$rs2), "mrowgather.ew", "${rd}, ${rs1}, ${rs2}">;
def AME_MROWID_EW : AMEInstR1<0x53, 0x003, (outs AMEMR:$rd), "mrowid.ew", "${rd}">;
def AME_MROWSHIFT_EW_X : AMEInstR3<0x37, (outs AMEMR:$rd), (ins GPR:$rs1, AMEMR:$rs2), "mrowshift.ew.x", "${rd}, ${rs1}, ${rs2}">;
def AME_MROWUNZIP_EW : AMEInstR3InPlace<0x63, "mrowunzip.ew">;
def AME_MROWZIP_EW : AMEInstR3InPlace<0x38, "mrowzip.ew">;
def AME_MRSQRT_EW : AMEInstR2<0x51, 0x12, (outs AMEMR:$rd), (ins AMEMR:$rs1), "mrsqrt.ew", "${rd}, ${rs1}">;
def AME_MROWSCATADD_EW : AMEInstR3<0x39, (outs AMEMR:$rd), (ins AMEMR:$rs1, AMEMR:$rs2), "mrowscatadd.ew", "${rd}, ${rs1}, ${rs2}">;
def AME_MCOLSCATADD_EW : AMEInstR3<0x3a, (outs AMEMR:$rd), (ins AMEMR:$rs1, AMEMR:$rs2), "mcolscatadd.ew", "${rd}, ${rs1}, ${rs2}">;
def AME_MROWSCATMAX_EW : AMEInstR3<0x3b, (outs AMEMR:$rd), (ins AMEMR:$rs1, AMEMR:$rs2), "mrowscatmax.ew", "${rd}, ${rs1}, ${rs2}">;
def AME_MCOLSCATMAX_EW : AMEInstR3<0x3c, (outs AMEMR:$rd), (ins AMEMR:$rs1, AMEMR:$rs2), "mcolscatmax.ew", "${rd}, ${rs1}, ${rs2}">;
def AME_MSELGE_EW : AMEInstR3<0x30, (outs AMEMR:$rd), (ins AMEMR:$rs1, AMEMR:$rs2), "mselge.ew", "${rd}, ${rs1}, ${rs2}">;
def AME_MSELLT_EW : AMEInstR3<0x31, (outs AMEMR:$rd), (ins AMEMR:$rs1, AMEMR:$rs2), "msellt.ew", "${rd}, ${rs1}, ${rs2}">;
def AME_MSETTYP : AMEInstR2<0x51, 0x03, (outs AMEMR:$rd), (ins GPR:$rs1), "msettyp", "${rd}, ${rs1}">;
def AME_MSIN_EW : AMEInstR2<0x51, 0x13, (outs AMEMR:$rd), (ins AMEMR:$rs1), "msin.ew", "${rd}, ${rs1}">;
def AME_MSLL_EW : AMEInstR3<0x22, (outs AMEMR:$rd), (ins AMEMR:$rs1, AMEMR:$rs2), "msll.ew", "${rd}, ${rs1}, ${rs2}">;
def AME_MSLL_EW_X : AMEInstR3<0x23, (outs AMEMR:$rd), (ins GPR:$rs1, AMEMR:$rs2), "msll.ew.x", "${rd}, ${rs1}, ${rs2}">;
def AME_MSQRT_EW : AMEInstR2<0x51, 0x14, (outs AMEMR:$rd), (ins AMEMR:$rs1), "msqrt.ew", "${rd}, ${rs1}">;
def AME_MSRA_EW : AMEInstR3<0x24, (outs AMEMR:$rd), (ins AMEMR:$rs1, AMEMR:$rs2), "msra.ew", "${rd}, ${rs1}, ${rs2}">;
def AME_MSRA_EW_X : AMEInstR3<0x25, (outs AMEMR:$rd), (ins GPR:$rs1, AMEMR:$rs2), "msra.ew.x", "${rd}, ${rs1}, ${rs2}">;
def AME_MSRL_EW : AMEInstR3<0x26, (outs AMEMR:$rd), (ins AMEMR:$rs1, AMEMR:$rs2), "msrl.ew", "${rd}, ${rs1}, ${rs2}">;
def AME_MSRL_EW_X : AMEInstR3<0x27, (outs AMEMR:$rd), (ins GPR:$rs1, AMEMR:$rs2), "msrl.ew.x", "${rd}, ${rs1}, ${rs2}">;
def AME_MSS_1R : AMEInstR2<0x51, 0x19, (outs AMEMR:$rd), (ins GPR:$rs1), "mss.1r", "${rd}, ${rs1}">;
def AME_MSS_CM : AMEInstR2<0x51, 0x1a, (outs AMEMR:$rd), (ins GPR:$rs1), "mss.cm", "${rd}, ${rs1}">;
def AME_MSS_RM : AMEInstR2<0x51, 0x1b, (outs AMEMR:$rd), (ins GPR:$rs1), "mss.rm", "${rd}, ${rs1}">;
def AME_MSS_ST : AMEInstR3<0x56, (outs AMEMR:$rd), (ins GPR:$rs1, GPR:$rs2), "mss.st", "${rd}, (${rs1}), ${rs2}">;
def AME_MSS_TST : AMEInstR3<0x57, (outs AMEMR:$rd), (ins GPR:$rs1, GPR:$rs2), "mss.tst", "${rd}, (${rs1}), ${rs2}">;
def AME_MSUB_EW : AMEInstR3<0x18, (outs AMEMR:$rd), (ins AMEMR:$rs1, AMEMR:$rs2), "msub.ew", "${rd}, ${rs1}, ${rs2}">;
def AME_MSUB_EW_X : AMEInstR3<0x19, (outs AMEMR:$rd), (ins GPR:$rs1, AMEMR:$rs2), "msub.ew.x", "${rd}, ${rs1}, ${rs2}">;
def AME_MSUBLOG2_EW : AMEInstR3<0x47, (outs AMEMR:$rd), (ins AMEMR:$rs1, AMEMR:$rs2), "msublog2.ew", "${rd}, ${rs1}, ${rs2}">;
def AME_MSUBLOG2_EW_X : AMEInstR3<0x48, (outs AMEMR:$rd), (ins GPR:$rs1, AMEMR:$rs2), "msublog2.ew.x", "${rd}, ${rs1}, ${rs2}">;
def AME_MTANH_EW : AMEInstR2<0x51, 0x15, (outs AMEMR:$rd), (ins AMEMR:$rs1), "mtanh.ew", "${rd}, ${rs1}">;
def AME_MUNPACK_EW_X : AMEInstR3<0x3e, (outs AMEMR:$rd), (ins GPR:$rs1, AMEMR:$rs2), "munpack.ew.x", "${rd}, ${rs1}, ${rs2}">;
def AME_MXOR_EW : AMEInstR3<0x28, (outs AMEMR:$rd), (ins AMEMR:$rs1, AMEMR:$rs2), "mxor.ew", "${rd}, ${rs1}, ${rs2}">;
def AME_MXOR_EW_X : AMEInstR3<0x29, (outs AMEMR:$rd), (ins GPR:$rs1, AMEMR:$rs2), "mxor.ew.x", "${rd}, ${rs1}, ${rs2}">;
def AME_MZERO_2D_ACC : AMEInstR1<0x53, 0x000, (outs AMEAR:$rd), "mzero.2d.acc", "${rd}">;
def AME_MZERO_2D_M : AMEInstR1<0x53, 0x001, (outs AMEMR:$rd), "mzero.2d.m", "${rd}">;
}
}
