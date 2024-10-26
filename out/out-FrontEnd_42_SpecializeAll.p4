#include <core.p4>

bit<3> max(in bit<3> val, in bit<3> bound) {
    bit<3> tmp;
    if (val < bound) {
        tmp = val;
    } else {
        tmp = bound;
    }
    return tmp;
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
    jWng = 64w444834830427053126;
    return true;
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
    bit<3> tmp_0;
    bit<3> tmp_1;
    bit<3> tmp_2;
    bit<3> tmp_3;
    bit<3> tmp_4;
    bit<16> tmp_5;
    bit<3> tmp_6;
    bit<3> tmp_7;
    @name("ILUOh") action ILUOh_0(@name("kSIZ") in bit<8> kSIZ_0, @name("qPKk") ethernet_t qPKk_0, @name("qhVw") bit<32> qhVw_0) {
        tmp_0 = max((bit<3>)kSIZ_0, 3w0);
        tmp_1 = tmp_0;
        h.fRaJ[tmp_1].dst_addr = 48w85525538337299;
        h.fRaJ[8].eth_type[15:12] = (bit<2>)kSIZ_0 ++ 2w0 | 4w15;
        h.iksk.src_addr = 48w272808532176102;
        h.eth_hdr.eth_type = 16w4103;
    }
    @name("svHPQ") action svHPQ_0(@name("yfgx") bit<4> yfgx_0) {
        vfedre_0 = 64w17991850652028935695;
        ccWCqtG(vfedre_0, 64w3752837609637491955);
        ILUOh_0(8w42, (ethernet_t){dst_addr = 48w169429209580565,src_addr = 48w190374191705509,eth_type = 16w16217}, 32w1976593764);
    }
    @name("GdMfje") table GdMfje_0 {
        key = {
            16w23888       : exact @name("MyjhcE");
            h.iksk.dst_addr: exact @name("SOwfyW");
        }
        actions = {
            svHPQ_0();
            @defaultonly NoAction();
        }
        default_action = NoAction();
    }
    @name("FkqZfe") table FkqZfe_0 {
        key = {
            4w5                              : exact @name("RhcIuN");
            ((bit<86>)h.iksk.src_addr)[71:68]: exact @name("WHorKo");
            16w31814                         : exact @name("gCmRqS");
        }
        actions = {
            svHPQ_0();
            @defaultonly NoAction();
        }
        default_action = NoAction();
    }
    apply {
        rXrCFW_0 = false;
        ZKpTNg_0 = (bit<4>)h.eth_hdr.eth_type;
        if (rXrCFW_0) {
            tmp_2 = 3w3;
        } else {
            tmp_2 = (bit<3>)ZKpTNg_0;
        }
        tmp_3 = max(tmp_2, 3w0);
        tmp_4 = tmp_3;
        if (rXrCFW_0) {
            tmp_5 = 16w22162;
        } else {
            tmp_5 = h.eth_hdr.eth_type;
        }
        h.fRaJ[tmp_4].eth_type = tmp_5;
        switch (GdMfje_0.apply().action_run) {
            svHPQ_0: {
                h.iksk.eth_type = h.fRaJ[8].eth_type;
                FkqZfe_0.apply();
                tmp_6 = max(3w2, 3w0);
                tmp_7 = tmp_6;
                h.fRaJ[tmp_7].dst_addr = 48w169252056759663;
                Gxorez_0 = 64w10818472500171495232 ^ (bit<64>)h.eth_hdr.src_addr;
                ccWCqtG(Gxorez_0, 64w18112078383848309943);
            }
            default: {
            }
        }
        IGknYG_0 = 64w0;
        ccWCqtG(IGknYG_0, 64w17525661711656856981);
        h.zEXs.eth_type = 14w5714 ++ (bit<2>)h.fRaJ[8].src_addr;
    }
}

parser Parser(packet_in b, out Headers hdr);
control Ingress(inout Headers hdr);
package top(Parser p, Ingress ig);
top(p(), ingress()) main;
