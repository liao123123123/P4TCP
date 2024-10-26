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
    jWng = -(!true ? 64w10509109154087032006 : 64w15200942163361864171) << (bit<8>)64w4610269598089007027 | jWng;
    jWng = jWng;
    jWng = jWng;
    jWng = TimE;
    jWng = TimE;
    jWng = (!(106w12943125677605143387041842057775 ^ 106w42692953344348920530871593785265 == (bit<106>)jWng) ? 64w10273273124858582520 : 64w12768624202505919286) - TimE;
    jWng = -874619955;
    jWng = (bit<64>)-1475723908 |+| 64w7676441119219527634;
    jWng = 64w444834830427053126;
    return true;
}
parser p(packet_in pkt, out Headers hdr) {
    bit<16> qqQmvR = 16w41609;
    bool HDdhMw = false;
    ethernet_t SWrTnX = hdr.fRaJ[8];
    bit<16> ACUuWU = (HDdhMw ? 16w28968 % 16w14016 : hdr.iksk.eth_type);
    bit<64> SjmTCG = (bit<64>)SWrTnX.dst_addr;
    state start {
        transition parse_hdrs;
    }
    state parse_hdrs {
        pkt.extract(hdr.eth_hdr);
        pkt.extract(hdr.iksk);
        pkt.extract(hdr.fRaJ.next);
        pkt.extract(hdr.fRaJ.next);
        pkt.extract(hdr.fRaJ.next);
        pkt.extract(hdr.fRaJ.next);
        pkt.extract(hdr.fRaJ.next);
        pkt.extract(hdr.fRaJ.next);
        pkt.extract(hdr.fRaJ.next);
        pkt.extract(hdr.fRaJ.next);
        pkt.extract(hdr.fRaJ.next);
        pkt.extract(hdr.zEXs);
        transition accept;
    }
}

control ingress(inout Headers h) {
    bool rXrCFW = !true;
    bit<4> ZKpTNg = (false ? (bit<4>)((1018626323 & -446496460 | 1829067197) - 1371576639) : (bit<4>)h.eth_hdr.eth_type);
    action ILUOh(in bit<8> kSIZ, ethernet_t qPKk, bit<32> qhVw) {
        h.fRaJ[max((bit<3>)kSIZ, 3w0)].dst_addr = 48w278119037177854 + ((42w1388773091720 ^ 42w394924574177 << (bit<8>)42w2074688974546) ++ 6w21);
        h.fRaJ[8].eth_type[15:12] = (2w0 << (bit<8>)2w2 | (bit<2>)kSIZ) ++ (bit<2>)-1519918020 | 4w15;
        h.iksk.src_addr = 66w27386134056056087507[62:15];
        h.eth_hdr.eth_type = 16w4103;
    }
    action iSEIy(bit<16> aEso, bit<64> CywV, bit<8> dbpc) {
        ZKpTNg = ((bit<30>)(2065589317 ^ -2135178496) |+| 30w259017783 |-| 30w887072110)[16:13];
        h.fRaJ[max(3w4, 3w0)].eth_type = 16w7672 - h.fRaJ[8].eth_type;
        ZKpTNg = (!!(!!false && rXrCFW) ? 4w0 : (bit<2>)h.fRaJ[8].eth_type ++ ~(2w3 & 2w0));
        h.zEXs.src_addr = 48w37379703458179;
        const bool mwMgHp = false;
        const bit<16> FodMLK = 16w37302;
    }
    action svHPQ(bit<4> yfgx) {
        const int ZWBggc = --271692426;
        h.zEXs.eth_type = 16w39594;
        ZKpTNg = yfgx;
        h.zEXs.eth_type = 16w35768;
        {
            bit<64> vfedre = 64w17991850652028935695;
            ccWCqtG(vfedre, 64w3752837609637491955);
        }
        h.zEXs.eth_type = 16w13932 * h.fRaJ[8].eth_type;
        ZKpTNg = 4w14;
        {
            bit<8> xAbZIv = 474215309 * 460673097;
            ILUOh(8w42, { -48w112045767130091, 48w190374191705509, 16w16217 }, 32w1976593764);
        }
    }
    table GdMfje {
        key = {
            16w62428 % 16w38540: exact @name("MyjhcE");
            h.iksk.dst_addr    : exact @name("SOwfyW");
        }
        actions = {
            svHPQ();
            @defaultonly NoAction();
        }
        default_action = NoAction();
    }
    table ldrUJe {
        actions = {
            svHPQ();
            @defaultonly NoAction();
        }
        default_action = NoAction();
    }
    table FkqZfe {
        key = {
            4w5                                       : exact @name("RhcIuN");
            ((bit<86>)(bit<86>)h.iksk.src_addr)[71:68]: exact @name("WHorKo");
            16w31814                                  : exact @name("gCmRqS");
        }
        actions = {
            svHPQ();
            @defaultonly NoAction();
        }
        default_action = NoAction();
    }
    table gExylq {
        actions = {
            @defaultonly NoAction();
        }
        default_action = NoAction();
    }
    apply {
        h.fRaJ[max((rXrCFW ? 3w3 : (bit<3>)ZKpTNg), 3w0)].eth_type = (rXrCFW ? 16w22162 : h.eth_hdr.eth_type);
        switch (GdMfje.apply().action_run) {
            svHPQ: {
                h.iksk.eth_type = h.fRaJ[8].eth_type;
                ZKpTNg = 4w13 | ZKpTNg;
                FkqZfe.apply();
                h.fRaJ[max(3w2, 3w0)].dst_addr = 159w189234063677676773741603592979080945890942662580[120:73];
                bool xcWPEQ = !!!rXrCFW;
                {
                    bit<64> Gxorez = 188w237882005109850511634526925088315789891768855885506932200[163:100] * 64w18254008393543642248 ^ (bit<64>)h.eth_hdr.src_addr;
                    ccWCqtG(Gxorez, 64w18112078383848309943);
                }
                bit<128> rclEnI = (bit<11>)h.zEXs.eth_type ++ 117w150877536183077532750153374401288862;
            }
        }
        ZKpTNg = ZKpTNg;
        {
            bit<64> IGknYG = ((bit<153>)((1540495364 ^ -377049282) & 2120515032))[115:52];
            ccWCqtG(IGknYG, (bit<64>)(64w8521090570603858336 |+| (bit<64>)64w5877264509753700008 |+| 64w3127306631299298637));
        }
        ZKpTNg = 114901241 - 770185270;
        h.zEXs.eth_type = 16w12364;
        bit<128> CRcSlO = (bit<128>)ZKpTNg;
        h.zEXs.eth_type = (bit<14>)14w5714 ++ (bit<2>)h.fRaJ[8].src_addr;
        CRcSlO = 128w158634095206239386485749629850298953140 | -128w192388989148849979835500789237473617539 |+| 128w74154703335766178234697365605402930849;
    }
}

parser Parser(packet_in b, out Headers hdr);
control Ingress(inout Headers hdr);
package top(Parser p, Ingress ig);
top(p(), ingress()) main;
