#include <core.p4>

bit<3> max(in bit<3> val, in bit<3> bound) {
    return (val < bound ? val : bound);
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
    jWng = jWng;
    jWng = jWng;
    jWng = jWng;
    jWng = TimE;
    jWng = TimE;
    jWng = (106w55261993851444791882325804123550 != (bit<106>)jWng ? 64w10273273124858582520 : 64w12768624202505919286) - TimE;
    jWng = 64w18446744072834931661;
    jWng = 64w18446744073709551615;
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
    @name("CRcSlO") bit<128> CRcSlO_0;
    @name("ILUOh") action ILUOh_0(in bit<8> kSIZ, ethernet_t qPKk, bit<32> qhVw) {
        h.fRaJ[max((bit<3>)kSIZ, 3w0)].dst_addr = 48w85525538337299;
        h.fRaJ[8].eth_type[15:12] = (bit<2>)kSIZ ++ 2w0 | 4w15;
        h.iksk.src_addr = 48w272808532176102;
        h.eth_hdr.eth_type = 16w4103;
    }
    @name("svHPQ") action svHPQ_0(bit<4> yfgx) {
        h.zEXs.eth_type = 16w39594;
        ZKpTNg_0 = yfgx;
        h.zEXs.eth_type = 16w35768;
        {
            vfedre_0 = 64w17991850652028935695;
            ccWCqtG(vfedre_0, 64w3752837609637491955);
        }
        h.zEXs.eth_type = 16w13932 * h.fRaJ[8].eth_type;
        ZKpTNg_0 = 4w14;
        {
            ILUOh_0(8w42, (ethernet_t){dst_addr = 48w169429209580565,src_addr = 48w190374191705509,eth_type = 16w16217}, 32w1976593764);
        }
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
        h.fRaJ[max((rXrCFW_0 ? 3w3 : (bit<3>)ZKpTNg_0), 3w0)].eth_type = (rXrCFW_0 ? 16w22162 : h.eth_hdr.eth_type);
        switch (GdMfje_0.apply().action_run) {
            svHPQ_0: {
                h.iksk.eth_type = h.fRaJ[8].eth_type;
                ZKpTNg_0 = 4w13 | ZKpTNg_0;
                FkqZfe_0.apply();
                h.fRaJ[max(3w2, 3w0)].dst_addr = 48w169252056759663;
                {
                    Gxorez_0 = 64w10818472500171495232 ^ (bit<64>)h.eth_hdr.src_addr;
                    ccWCqtG(Gxorez_0, 64w18112078383848309943);
                }
            }
            default: {
            }
        }
        ZKpTNg_0 = ZKpTNg_0;
        {
            IGknYG_0 = 64w0;
            ccWCqtG(IGknYG_0, 64w17525661711656856981);
        }
        ZKpTNg_0 = 4w3;
        h.zEXs.eth_type = 16w12364;
        CRcSlO_0 = (bit<128>)ZKpTNg_0;
        h.zEXs.eth_type = 14w5714 ++ (bit<2>)h.fRaJ[8].src_addr;
        CRcSlO_0 = 128w328817608067935181134088950480928370110;
    }
}

parser Parser(packet_in b, out Headers hdr);
control Ingress(inout Headers hdr);
package top(Parser p, Ingress ig);
top(p(), ingress()) main;
