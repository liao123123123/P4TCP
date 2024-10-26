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
    @name("ingress.tmp") bit<3> tmp_18;
    bit<16> key_0;
    bit<4> key_1;
    bit<4> key_2;
    bit<16> key_3;
    @noWarn("unused") @name(".NoAction") action NoAction_1() {
    }
    @noWarn("unused") @name(".NoAction") action NoAction_2() {
    }
    @name("ingress.svHPQ") action svHPQ(@name("yfgx") bit<4> yfgx) {
        h.fRaJ[3w0].dst_addr = 48w85525538337299;
        h.fRaJ[8].eth_type[15:12] = 4w15;
        h.iksk.src_addr = 48w272808532176102;
        h.eth_hdr.eth_type = 16w4103;
    }
    @name("ingress.svHPQ") action svHPQ_1(@name("yfgx") bit<4> yfgx_1) {
        h.fRaJ[3w0].dst_addr = 48w85525538337299;
        h.fRaJ[8].eth_type[15:12] = 4w15;
        h.iksk.src_addr = 48w272808532176102;
        h.eth_hdr.eth_type = 16w4103;
    }
    @name("ingress.GdMfje") table GdMfje_0 {
        key = {
            key_0          : exact @name("MyjhcE");
            h.iksk.dst_addr: exact @name("SOwfyW");
        }
        actions = {
            svHPQ();
            @defaultonly NoAction_1();
        }
        default_action = NoAction_1();
    }
    @name("ingress.FkqZfe") table FkqZfe_0 {
        key = {
            key_1: exact @name("RhcIuN");
            key_2: exact @name("WHorKo");
            key_3: exact @name("gCmRqS");
        }
        actions = {
            svHPQ_1();
            @defaultonly NoAction_2();
        }
        default_action = NoAction_2();
    }
    @hidden action out3() {
        tmp_18 = (bit<3>)(bit<4>)h.eth_hdr.eth_type;
    }
    @hidden action out3_0() {
        tmp_18 = 3w0;
    }
    @hidden action out130() {
        h.fRaJ[3w0].eth_type = h.eth_hdr.eth_type;
    }
    @hidden action out130_0() {
        h.fRaJ[3w1].eth_type = h.eth_hdr.eth_type;
    }
    @hidden action out130_1() {
        h.fRaJ[3w2].eth_type = h.eth_hdr.eth_type;
    }
    @hidden action out130_2() {
        h.fRaJ[3w3].eth_type = h.eth_hdr.eth_type;
    }
    @hidden action out130_3() {
        h.fRaJ[3w4].eth_type = h.eth_hdr.eth_type;
    }
    @hidden action out130_4() {
        h.fRaJ[3w5].eth_type = h.eth_hdr.eth_type;
    }
    @hidden action out130_5() {
        h.fRaJ[3w6].eth_type = h.eth_hdr.eth_type;
    }
    @hidden action out130_6() {
        h.fRaJ[3w7].eth_type = h.eth_hdr.eth_type;
    }
    @hidden action out130_7() {
        h.fRaJ[3w0].eth_type = h.eth_hdr.eth_type;
    }
    @hidden action out115() {
        h.iksk.eth_type = h.fRaJ[8].eth_type;
        key_1 = 4w5;
        key_2 = ((bit<86>)h.iksk.src_addr)[71:68];
        key_3 = 16w31814;
    }
    @hidden action out136() {
        h.fRaJ[3w0].dst_addr = 48w169252056759663;
    }
    @hidden action out99() {
        key_0 = 16w23888;
    }
    @hidden action out153() {
        h.zEXs.eth_type = 14w5714 ++ (bit<2>)h.fRaJ[8].src_addr;
    }
    apply {
        if ((bit<3>)(bit<4>)h.eth_hdr.eth_type < 3w0) {
            out3();
        } else {
            out3_0();
        }
        if (tmp_18 == 3w0) {
            out130();
        } else if (tmp_18 == 3w1) {
            out130_0();
        } else if (tmp_18 == 3w2) {
            out130_1();
        } else if (tmp_18 == 3w3) {
            out130_2();
        } else if (tmp_18 == 3w4) {
            out130_3();
        } else if (tmp_18 == 3w5) {
            out130_4();
        } else if (tmp_18 == 3w6) {
            out130_5();
        } else if (tmp_18 == 3w7) {
            out130_6();
        } else if (tmp_18 == 3w0) {
            out130_7();
        }
        out99();
        switch (GdMfje_0.apply().action_run) {
            svHPQ: {
                out115();
                FkqZfe_0.apply();
                out136();
            }
            default: {
            }
        }
        out153();
    }
}

parser Parser(packet_in b, out Headers hdr);
control Ingress(inout Headers hdr);
package top(Parser p, Ingress ig);
top(p(), ingress()) main;
