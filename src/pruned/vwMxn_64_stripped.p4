#include <core.p4>
#define V1MODEL_VERSION 20180101
#include <v1model.p4>

bit<3> max(in bit<3> val, in bit<3> bound) {
    return (val < bound ? val : bound);
}
header ethernet_t {
    bit<48> dst_addr;
    bit<48> src_addr;
    bit<16> eth_type;
}

struct rKSsYg {
    bit<8>  PWxg;
    bit<4>  DrMx;
    bit<16> scDj;
}

struct Headers {
    ethernet_t eth_hdr;
    ethernet_t tQYt;
    ethernet_t YKHi;
    ethernet_t vraF;
    ethernet_t ZYAI;
}

struct Meta {
}

bit<128> SDzBHqH(inout Meta beMe, bit<64> jMQo, bit<32> vANc) {
    bool kbaWfR = false;
    bit<16> FgsCjt = (bit<16>)jMQo;
    bool lnVCrv = !(114w73342687294860205462932082015846 / 114w18181430349438250495789696009271642 != (!true ? 114w12812620616098579453612902022391867 : 114w20212267558159625943662169453838870));
    return (128w216167655286540630560948066148640449776 & 128w198300707696210757349772862330062864314 |-| 128w196967271926994749020553308905268594367) * 128w206024893815449692950603126643181719907;
}
bit<128> VtjezJl(bit<64> jmRq) {
    bit<32> koHiFD = (bit<32>)jmRq;
    {
        Meta pqMTWG = {  };
    }
    return ~(bit<128>)128w286973816464090274398591515723735665563 ^ -(bit<128>)jmRq;
}
bit<16> LbMXITU(bit<8> EHFe) {
    bit<16> kuunlJ = 16w61530;
    const bit<128> PFTszg = 128w141307118827579096228983745115342935657 | 128w7143007874610316148934453003535568824;
    bit<4> OcvTBv = (bit<4>)kuunlJ;
    bit<4> xPbUwP = 4w14;
    VtjezJl(64w7578159151753380503);
    return 16w34148;
}
ethernet_t lUevASY(inout rKSsYg isXP, bit<128> xdFv, bit<4> rTro) {
    const int yrrETS = 1432729702;
    bit<32> Lwrvue = 32w409439783;
    ethernet_t ZhtMbD = { (bit<48>)xdFv, 48w149090818054177, 16w26259 };
    isXP.DrMx = (!false ? 4w6 : (bit<4>)(1753776381 - 4w15));
    const bit<64> IDMrWk = 64w6665612574698116916 >> (bit<8>)2022685143 ^ ~(bit<64>)64w6329455809568292903;
    return ZhtMbD;
}
parser p(packet_in pkt, out Headers hdr, inout Meta m, inout standard_metadata_t sm) {
    state start {
        transition parse_hdrs;
    }
    state parse_hdrs {
        transition accept;
    }
}

control ingress(inout Headers h, inout Meta m, inout standard_metadata_t sm) {
    bool TzxkoE = !((bit<39>)h.vraF.dst_addr ++ (bit<37>)-1064338737 != (bit<76>)h.vraF.src_addr);
    bit<128> bBGotg = 128w106724362438119879912416625009853835178;
    bool PEVzxt = false;
    bit<8> MHyGLR = 8w151;
    bit<32> PWVxda = 32w3908463214;
    action EQBLg(out bit<64> nyqc, inout bit<128> oOIT, bit<64> jFiL) {
        MHyGLR = ((bit<50>)50w265349940513965)[18:11];
    }
    action wMtiW(in bit<4> nNoT, bit<4> zznS, bit<8> nzwR) {
        bBGotg = 1651421348 + 1777837963;
        MHyGLR = 8w194;
        MHyGLR = 8w219;
        bBGotg[90:43] = 48w169876910444295;
        h.tQYt.src_addr = 1561817557 % 1634937624 | 296867509;
    }
    action fZxmn() {
        MHyGLR = 8w0;
        PWVxda = (bit<32>)(bit<32>)LbMXITU(8w180);
        bBGotg = 128w258078480004245207025596920130104108511;
        h.ZYAI.dst_addr = (bit<48>)48w198327334249811;
        LbMXITU(8w28);
        PWVxda = PWVxda | PWVxda |-| 32w2278995568;
        LbMXITU(8w64);
        MHyGLR = (!true ? 118w5203482728741241170464966611832755 : (bit<118>)PWVxda)[30:23];
        bit<128> njKCSO = bBGotg;
    }
    table ULcZLZ {
        key = {
            32w1443149516                          : exact @name("aoLKUc");
            (bit<16>)16w10586                      : exact @name("BwarDE");
            95w27436849018048067577086064604[75:60]: exact @name("IONELC");
        }
        actions = {
        }
    }
    apply {
        {
            rKSsYg PEIvDE = { MHyGLR, (bit<4>)MHyGLR, h.ZYAI.eth_type };
            lUevASY(PEIvDE, 128w198928725110421140558236535701152920830, 4w9);
        }
        switch (ULcZLZ.apply().action_run) {
        }
        PWVxda = (bit<32>)((bit<32>)LbMXITU(225655958) | 32w446905242) >> (bit<8>)PWVxda;
        const bool nmYVrU = true;
        PWVxda = PWVxda;
        SDzBHqH(m, 64w16958871415527079412, 32w1913075729);
        const bit<64> JTaNAK = 64w10352956975119714996;
        h.ZYAI.eth_type = h.tQYt.eth_type;
        const bit<4> ZOUNCz = 4w6;
        PWVxda = PWVxda;
    }
}

control vrfy(inout Headers h, inout Meta m) {
    apply {
    }
}

control update(inout Headers h, inout Meta m) {
    apply {
    }
}

control egress(inout Headers h, inout Meta m, inout standard_metadata_t sm) {
    apply {
    }
}

control deparser(packet_out pkt, in Headers h) {
    apply {
        pkt.emit(h);
    }
}

V1Switch(p(), vrfy(), ingress(), egress(), update(), deparser()) main;
