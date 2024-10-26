#include <core.p4>

header ethernet_t {
    bit<48> dst_addr;
    bit<48> src_addr;
    bit<16> eth_type;
}

struct lOVJDT {
    ethernet_t[10] dVjc;
    bit<32>        VYuX;
    bit<64>        rBVA;
    bit<64>        oTbs;
    bit<4>         Nnfs;
}

struct Headers {
    ethernet_t    eth_hdr;
    ethernet_t    iksk;
    ethernet_t[9] fRaJ;
    ethernet_t    zEXs;
}

parser p(packet_in pkt, out Headers hdr) {
    state start {
        pkt.extract<ethernet_t>(hdr.eth_hdr);
        pkt.extract<ethernet_t>(hdr.iksk);
        pkt.extract<ethernet_t>(hdr.fRaJ.next);
        pkt.extract<ethernet_t>(hdr.fRaJ.next);
        pkt.extract<ethernet_t>(hdr.fRaJ.next);
        pkt.extract<ethernet_t>(hdr.fRaJ.next);
        pkt.extract<ethernet_t>(hdr.fRaJ.next);
        pkt.extract<ethernet_t>(hdr.fRaJ.next);
        pkt.extract<ethernet_t>(hdr.fRaJ.next);
        pkt.extract<ethernet_t>(hdr.fRaJ.next);
        pkt.extract<ethernet_t>(hdr.fRaJ.next);
        pkt.extract<ethernet_t>(hdr.zEXs);
        transition accept;
    }
}

control ingress(inout Headers h) {
    @name("rXrCFW") bool rXrCFW_0;
    @name("ZKpTNg") bit<4> ZKpTNg_0;
    @name("vfedre") bit<64> vfedre_0;
    @name("Gxorez") bit<64> Gxorez_0;
    @name("IGknYG") bit<64> IGknYG_0;
    @name("tmp_0") bit<3> tmp;
    @name("tmp_1") bit<3> tmp_0;
    @name("tmp_2") bit<3> tmp_1;
    @name("tmp_3") bit<3> tmp_2;
    @name("tmp_4") bit<3> tmp_3;
    @name("tmp_5") bit<16> tmp_4;
    @name("tmp_6") bit<3> tmp_5;
    @name("tmp_7") bit<3> tmp_6;
    @name("kSIZ") bit<8> kSIZ;
    @name("kSIZ") bit<8> kSIZ_2;
    @name("jWng_0") bit<64> jWng;
    @name("hasReturned_0") bool hasReturned;
    @name("retval_0") bool retval;
    @name("val_0") bit<3> val;
    @name("bound_0") bit<3> bound;
    @name("hasReturned") bool hasReturned_0;
    @name("retval") bit<3> retval_0;
    @name("tmp") bit<3> tmp_7;
    @name("jWng_1") bit<64> jWng_4;
    @name("hasReturned_0") bool hasReturned_3;
    @name("retval_0") bool retval_3;
    @name("val_1") bit<3> val_4;
    @name("bound_1") bit<3> bound_4;
    @name("hasReturned") bool hasReturned_4;
    @name("retval") bit<3> retval_4;
    @name("tmp") bit<3> tmp_17;
    @name("val_2") bit<3> val_5;
    @name("bound_2") bit<3> bound_5;
    @name("hasReturned") bool hasReturned_5;
    @name("retval") bit<3> retval_5;
    @name("tmp") bit<3> tmp_18;
    @name("val_3") bit<3> val_6;
    @name("bound_3") bit<3> bound_6;
    @name("hasReturned") bool hasReturned_6;
    @name("retval") bit<3> retval_6;
    @name("tmp") bit<3> tmp_19;
    @name("jWng_2") bit<64> jWng_5;
    @name("hasReturned_0") bool hasReturned_7;
    @name("retval_0") bool retval_7;
    @name("jWng_3") bit<64> jWng_6;
    @name("hasReturned_0") bool hasReturned_8;
    @name("retval_0") bool retval_8;
    @noWarn("unused") @name(".NoAction") action NoAction_1() {
    }
    @noWarn("unused") @name(".NoAction") action NoAction_2() {
    }
    @name("svHPQ") action svHPQ(@name("yfgx") bit<4> yfgx) {
        vfedre_0 = 64w17991850652028935695;
        {
            jWng = vfedre_0;
            hasReturned = false;
            jWng = 64w444834830427053126;
            hasReturned = true;
            retval = true;
            vfedre_0 = jWng;
        }
        kSIZ = 8w42;
        {
            val = (bit<3>)kSIZ;
            bound = 3w0;
            hasReturned_0 = false;
            if (val < bound) {
                tmp_7 = val;
            } else {
                tmp_7 = bound;
            }
            hasReturned_0 = true;
            retval_0 = tmp_7;
            tmp = retval_0;
        }
        tmp_0 = tmp;
        h.fRaJ[tmp_0].dst_addr = 48w85525538337299;
        h.fRaJ[8].eth_type[15:12] = (bit<2>)kSIZ ++ 2w0 | 4w15;
        h.iksk.src_addr = 48w272808532176102;
        h.eth_hdr.eth_type = 16w4103;
    }
    @name("svHPQ") action svHPQ_1(@name("yfgx") bit<4> yfgx_1) {
        vfedre_0 = 64w17991850652028935695;
        {
            jWng_4 = vfedre_0;
            hasReturned_3 = false;
            jWng_4 = 64w444834830427053126;
            hasReturned_3 = true;
            retval_3 = true;
            vfedre_0 = jWng_4;
        }
        kSIZ_2 = 8w42;
        {
            val_4 = (bit<3>)kSIZ_2;
            bound_4 = 3w0;
            hasReturned_4 = false;
            if (val_4 < bound_4) {
                tmp_17 = val_4;
            } else {
                tmp_17 = bound_4;
            }
            hasReturned_4 = true;
            retval_4 = tmp_17;
            tmp = retval_4;
        }
        tmp_0 = tmp;
        h.fRaJ[tmp_0].dst_addr = 48w85525538337299;
        h.fRaJ[8].eth_type[15:12] = (bit<2>)kSIZ_2 ++ 2w0 | 4w15;
        h.iksk.src_addr = 48w272808532176102;
        h.eth_hdr.eth_type = 16w4103;
    }
    @name("GdMfje") table GdMfje_0 {
        key = {
            16w23888       : exact @name("MyjhcE");
            h.iksk.dst_addr: exact @name("SOwfyW");
        }
        actions = {
            svHPQ();
            @defaultonly NoAction_1();
        }
        default_action = NoAction_1();
    }
    @name("FkqZfe") table FkqZfe_0 {
        key = {
            4w5                              : exact @name("RhcIuN");
            ((bit<86>)h.iksk.src_addr)[71:68]: exact @name("WHorKo");
            16w31814                         : exact @name("gCmRqS");
        }
        actions = {
            svHPQ_1();
            @defaultonly NoAction_2();
        }
        default_action = NoAction_2();
    }
    apply {
        rXrCFW_0 = false;
        ZKpTNg_0 = (bit<4>)h.eth_hdr.eth_type;
        if (rXrCFW_0) {
            tmp_1 = 3w3;
        } else {
            tmp_1 = (bit<3>)ZKpTNg_0;
        }
        {
            val_5 = tmp_1;
            bound_5 = 3w0;
            hasReturned_5 = false;
            if (val_5 < bound_5) {
                tmp_18 = val_5;
            } else {
                tmp_18 = bound_5;
            }
            hasReturned_5 = true;
            retval_5 = tmp_18;
            tmp_2 = retval_5;
        }
        tmp_3 = tmp_2;
        if (rXrCFW_0) {
            tmp_4 = 16w22162;
        } else {
            tmp_4 = h.eth_hdr.eth_type;
        }
        h.fRaJ[tmp_3].eth_type = tmp_4;
        switch (GdMfje_0.apply().action_run) {
            svHPQ: {
                h.iksk.eth_type = h.fRaJ[8].eth_type;
                FkqZfe_0.apply();
                {
                    val_6 = 3w2;
                    bound_6 = 3w0;
                    hasReturned_6 = false;
                    if (val_6 < bound_6) {
                        tmp_19 = val_6;
                    } else {
                        tmp_19 = bound_6;
                    }
                    hasReturned_6 = true;
                    retval_6 = tmp_19;
                    tmp_5 = retval_6;
                }
                tmp_6 = tmp_5;
                h.fRaJ[tmp_6].dst_addr = 48w169252056759663;
                Gxorez_0 = 64w10818472500171495232 ^ (bit<64>)h.eth_hdr.src_addr;
                {
                    jWng_5 = Gxorez_0;
                    hasReturned_7 = false;
                    jWng_5 = 64w444834830427053126;
                    hasReturned_7 = true;
                    retval_7 = true;
                    Gxorez_0 = jWng_5;
                }
            }
            default: {
            }
        }
        IGknYG_0 = 64w0;
        {
            jWng_6 = IGknYG_0;
            hasReturned_8 = false;
            jWng_6 = 64w444834830427053126;
            hasReturned_8 = true;
            retval_8 = true;
            IGknYG_0 = jWng_6;
        }
        h.zEXs.eth_type = 14w5714 ++ (bit<2>)h.fRaJ[8].src_addr;
    }
}

parser Parser(packet_in b, out Headers hdr);
control Ingress(inout Headers hdr);
package top(Parser p, Ingress ig);
top(p(), ingress()) main;
