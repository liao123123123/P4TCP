#include <core.p4>

bit<3> max(in bit<3> val, in bit<3> bound) {
    @name("hasReturned") bool hasReturned_1 = false;
    @name("retval") bit<3> retval_1;
    @name("tmp") bit<3> tmp_8;
    if (val < bound) {
        tmp_8 = val;
    } else {
        tmp_8 = bound;
    }
    {
        hasReturned_1 = true;
        retval_1 = tmp_8;
    }
    return retval_1;
}
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

bool ccWCqtG(inout bit<64> jWng, bit<64> TimE) {
    @name("hasReturned_0") bool hasReturned_2 = false;
    @name("retval_0") bool retval_2;
    jWng = 64w444834830427053126;
    {
        hasReturned_2 = true;
        retval_2 = true;
    }
    return retval_2;
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
    @noWarn("unused") @name(".NoAction") action NoAction_0() {
    }
    @noWarn("unused") @name(".NoAction") action NoAction_3() {
    }
    @name("rXrCFW") bool rXrCFW;
    @name("ZKpTNg") bit<4> ZKpTNg;
    @name("vfedre") bit<64> vfedre;
    @name("Gxorez") bit<64> Gxorez;
    @name("IGknYG") bit<64> IGknYG;
    @name("tmp_0") bit<3> tmp_9;
    @name("tmp_1") bit<3> tmp_10;
    @name("tmp_2") bit<3> tmp_11;
    @name("tmp_3") bit<3> tmp_12;
    @name("tmp_4") bit<3> tmp_13;
    @name("tmp_5") bit<16> tmp_14;
    @name("tmp_6") bit<3> tmp_15;
    @name("tmp_7") bit<3> tmp_16;
    @name("svHPQ") action svHPQ_0(@name("yfgx") bit<4> yfgx) {
        vfedre = 64w17991850652028935695;
        ccWCqtG(vfedre, 64w3752837609637491955);
        {
            @name("kSIZ") bit<8> kSIZ_0 = 8w42;
            tmp_9 = max((bit<3>)kSIZ_0, 3w0);
            tmp_10 = tmp_9;
            h.fRaJ[tmp_10].dst_addr = 48w85525538337299;
            h.fRaJ[8].eth_type[15:12] = (bit<2>)kSIZ_0 ++ 2w0 | 4w15;
            h.iksk.src_addr = 48w272808532176102;
            h.eth_hdr.eth_type = 16w4103;
        }
    }
    @name("svHPQ") action svHPQ_2(@name("yfgx") bit<4> yfgx_1) {
        vfedre = 64w17991850652028935695;
        ccWCqtG(vfedre, 64w3752837609637491955);
        {
            @name("kSIZ") bit<8> kSIZ_1 = 8w42;
            tmp_9 = max((bit<3>)kSIZ_1, 3w0);
            tmp_10 = tmp_9;
            h.fRaJ[tmp_10].dst_addr = 48w85525538337299;
            h.fRaJ[8].eth_type[15:12] = (bit<2>)kSIZ_1 ++ 2w0 | 4w15;
            h.iksk.src_addr = 48w272808532176102;
            h.eth_hdr.eth_type = 16w4103;
        }
    }
    @name("GdMfje") table GdMfje {
        key = {
            16w23888       : exact @name("MyjhcE");
            h.iksk.dst_addr: exact @name("SOwfyW");
        }
        actions = {
            svHPQ_0();
            @defaultonly NoAction_0();
        }
        default_action = NoAction_0();
    }
    @name("FkqZfe") table FkqZfe {
        key = {
            4w5                              : exact @name("RhcIuN");
            ((bit<86>)h.iksk.src_addr)[71:68]: exact @name("WHorKo");
            16w31814                         : exact @name("gCmRqS");
        }
        actions = {
            svHPQ_2();
            @defaultonly NoAction_3();
        }
        default_action = NoAction_3();
    }
    apply {
        rXrCFW = false;
        ZKpTNg = (bit<4>)h.eth_hdr.eth_type;
        if (rXrCFW) {
            tmp_11 = 3w3;
        } else {
            tmp_11 = (bit<3>)ZKpTNg;
        }
        tmp_12 = max(tmp_11, 3w0);
        tmp_13 = tmp_12;
        if (rXrCFW) {
            tmp_14 = 16w22162;
        } else {
            tmp_14 = h.eth_hdr.eth_type;
        }
        h.fRaJ[tmp_13].eth_type = tmp_14;
        switch (GdMfje.apply().action_run) {
            svHPQ_0: {
                h.iksk.eth_type = h.fRaJ[8].eth_type;
                FkqZfe.apply();
                tmp_15 = max(3w2, 3w0);
                tmp_16 = tmp_15;
                h.fRaJ[tmp_16].dst_addr = 48w169252056759663;
                Gxorez = 64w10818472500171495232 ^ (bit<64>)h.eth_hdr.src_addr;
                ccWCqtG(Gxorez, 64w18112078383848309943);
            }
            default: {
            }
        }
        IGknYG = 64w0;
        ccWCqtG(IGknYG, 64w17525661711656856981);
        h.zEXs.eth_type = 14w5714 ++ (bit<2>)h.fRaJ[8].src_addr;
    }
}

parser Parser(packet_in b, out Headers hdr);
control Ingress(inout Headers hdr);
package top(Parser p, Ingress ig);
top(p(), ingress()) main;
