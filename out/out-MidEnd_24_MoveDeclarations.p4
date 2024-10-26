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
    @name("ingress.rXrCFW") bool rXrCFW_0;
    @name("ingress.ZKpTNg") bit<4> ZKpTNg_0;
    @name("ingress.tmp_0") bit<3> tmp;
    @name("ingress.tmp_1") bit<3> tmp_0;
    @name("ingress.tmp_2") bit<3> tmp_1;
    @name("ingress.tmp_3") bit<3> tmp_2;
    @name("ingress.tmp_4") bit<3> tmp_3;
    @name("ingress.tmp_5") bit<16> tmp_4;
    @name("ingress.tmp_6") bit<3> tmp_5;
    @name("ingress.tmp_7") bit<3> tmp_6;
    @name("ingress.kSIZ") bit<8> kSIZ;
    @name("ingress.kSIZ") bit<8> kSIZ_2;
    @name("ingress.val_0") bit<3> val;
    @name("ingress.bound_0") bit<3> bound;
    @name("ingress.retval") bit<3> retval_0;
    @name("ingress.tmp") bit<3> tmp_7;
    @name("ingress.val_1") bit<3> val_4;
    @name("ingress.bound_1") bit<3> bound_4;
    @name("ingress.retval") bit<3> retval_4;
    @name("ingress.tmp") bit<3> tmp_17;
    @name("ingress.val_2") bit<3> val_5;
    @name("ingress.bound_2") bit<3> bound_5;
    @name("ingress.retval") bit<3> retval_5;
    @name("ingress.tmp") bit<3> tmp_18;
    @name("ingress.val_3") bit<3> val_6;
    @name("ingress.bound_3") bit<3> bound_6;
    @name("ingress.retval") bit<3> retval_6;
    @name("ingress.tmp") bit<3> tmp_19;
    bit<16> key_0;
    bit<4> key_1;
    bit<4> key_2;
    bit<16> key_3;
    @noWarn("unused") @name(".NoAction") action NoAction_1() {
    }
    @noWarn("unused") @name(".NoAction") action NoAction_2() {
    }
    @name("ingress.svHPQ") action svHPQ(@name("yfgx") bit<4> yfgx) {
        kSIZ = 8w42;
        val = (bit<3>)kSIZ;
        bound = 3w0;
        if (val < bound) {
            tmp_7 = val;
        } else {
            tmp_7 = bound;
        }
        retval_0 = tmp_7;
        tmp = retval_0;
        tmp_0 = tmp;
        h.fRaJ[tmp_0].dst_addr = 48w85525538337299;
        h.fRaJ[8].eth_type[15:12] = (bit<2>)kSIZ ++ 2w0 | 4w15;
        h.iksk.src_addr = 48w272808532176102;
        h.eth_hdr.eth_type = 16w4103;
    }
    @name("ingress.svHPQ") action svHPQ_1(@name("yfgx") bit<4> yfgx_1) {
        kSIZ_2 = 8w42;
        val_4 = (bit<3>)kSIZ_2;
        bound_4 = 3w0;
        if (val_4 < bound_4) {
            tmp_17 = val_4;
        } else {
            tmp_17 = bound_4;
        }
        retval_4 = tmp_17;
        tmp = retval_4;
        tmp_0 = tmp;
        h.fRaJ[tmp_0].dst_addr = 48w85525538337299;
        h.fRaJ[8].eth_type[15:12] = (bit<2>)kSIZ_2 ++ 2w0 | 4w15;
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
    apply {
        rXrCFW_0 = false;
        ZKpTNg_0 = (bit<4>)h.eth_hdr.eth_type;
        if (rXrCFW_0) {
            tmp_1 = 3w3;
        } else {
            tmp_1 = (bit<3>)ZKpTNg_0;
        }
        val_5 = tmp_1;
        bound_5 = 3w0;
        if (val_5 < bound_5) {
            tmp_18 = val_5;
        } else {
            tmp_18 = bound_5;
        }
        retval_5 = tmp_18;
        tmp_2 = retval_5;
        tmp_3 = tmp_2;
        if (rXrCFW_0) {
            tmp_4 = 16w22162;
        } else {
            tmp_4 = h.eth_hdr.eth_type;
        }
        h.fRaJ[tmp_3].eth_type = tmp_4;
        {
            key_0 = 16w23888;
            switch (GdMfje_0.apply().action_run) {
                svHPQ: {
                    h.iksk.eth_type = h.fRaJ[8].eth_type;
                    {
                        key_1 = 4w5;
                        key_2 = ((bit<86>)h.iksk.src_addr)[71:68];
                        key_3 = 16w31814;
                        FkqZfe_0.apply();
                    }
                    val_6 = 3w2;
                    bound_6 = 3w0;
                    if (val_6 < bound_6) {
                        tmp_19 = val_6;
                    } else {
                        tmp_19 = bound_6;
                    }
                    retval_6 = tmp_19;
                    tmp_5 = retval_6;
                    tmp_6 = tmp_5;
                    h.fRaJ[tmp_6].dst_addr = 48w169252056759663;
                }
                default: {
                }
            }
        }
        h.zEXs.eth_type = 14w5714 ++ (bit<2>)h.fRaJ[8].src_addr;
    }
}

parser Parser(packet_in b, out Headers hdr);
control Ingress(inout Headers hdr);
package top(Parser p, Ingress ig);
top(p(), ingress()) main;