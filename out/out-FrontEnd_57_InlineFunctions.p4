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
    @name("kSIZ") bit<8> kSIZ_0;
    @name("kSIZ") bit<8> kSIZ_1;
    @noWarn("unused") @name(".NoAction") action NoAction_0() {
    }
    @noWarn("unused") @name(".NoAction") action NoAction_3() {
    }
    @name("svHPQ") action svHPQ_0(@name("yfgx") bit<4> yfgx) {
        vfedre = 64w17991850652028935695;
        {
            bit<64> jWng_0 = vfedre;
            @name("hasReturned_0") bool hasReturned_2;
            @name("retval_0") bool retval_2;
            hasReturned_2 = false;
            jWng_0 = 64w444834830427053126;
            {
                hasReturned_2 = true;
                retval_2 = true;
            }
            vfedre = jWng_0;
        }
        {
            kSIZ_0 = 8w42;
            {
                bit<3> val_0 = (bit<3>)kSIZ_0;
                bit<3> bound_0 = 3w0;
                @name("hasReturned") bool hasReturned_1;
                @name("retval") bit<3> retval_1;
                @name("tmp") bit<3> tmp_8;
                hasReturned_1 = false;
                if (val_0 < bound_0) {
                    tmp_8 = val_0;
                } else {
                    tmp_8 = bound_0;
                }
                {
                    hasReturned_1 = true;
                    retval_1 = tmp_8;
                }
                tmp_9 = retval_1;
            }
            tmp_10 = tmp_9;
            h.fRaJ[tmp_10].dst_addr = 48w85525538337299;
            h.fRaJ[8].eth_type[15:12] = (bit<2>)kSIZ_0 ++ 2w0 | 4w15;
            h.iksk.src_addr = 48w272808532176102;
            h.eth_hdr.eth_type = 16w4103;
        }
    }
    @name("svHPQ") action svHPQ_2(@name("yfgx") bit<4> yfgx_1) {
        vfedre = 64w17991850652028935695;
        {
            bit<64> jWng_1 = vfedre;
            @name("hasReturned_0") bool hasReturned_2;
            @name("retval_0") bool retval_2;
            hasReturned_2 = false;
            jWng_1 = 64w444834830427053126;
            {
                hasReturned_2 = true;
                retval_2 = true;
            }
            vfedre = jWng_1;
        }
        {
            kSIZ_1 = 8w42;
            {
                bit<3> val_1 = (bit<3>)kSIZ_1;
                bit<3> bound_1 = 3w0;
                @name("hasReturned") bool hasReturned_1;
                @name("retval") bit<3> retval_1;
                @name("tmp") bit<3> tmp_8;
                hasReturned_1 = false;
                if (val_1 < bound_1) {
                    tmp_8 = val_1;
                } else {
                    tmp_8 = bound_1;
                }
                {
                    hasReturned_1 = true;
                    retval_1 = tmp_8;
                }
                tmp_9 = retval_1;
            }
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
        {
            bit<3> val_2 = tmp_11;
            bit<3> bound_2 = 3w0;
            @name("hasReturned") bool hasReturned_1;
            @name("retval") bit<3> retval_1;
            @name("tmp") bit<3> tmp_8;
            hasReturned_1 = false;
            if (val_2 < bound_2) {
                tmp_8 = val_2;
            } else {
                tmp_8 = bound_2;
            }
            {
                hasReturned_1 = true;
                retval_1 = tmp_8;
            }
            tmp_12 = retval_1;
        }
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
                {
                    bit<3> val_3 = 3w2;
                    bit<3> bound_3 = 3w0;
                    @name("hasReturned") bool hasReturned_1;
                    @name("retval") bit<3> retval_1;
                    @name("tmp") bit<3> tmp_8;
                    hasReturned_1 = false;
                    if (val_3 < bound_3) {
                        tmp_8 = val_3;
                    } else {
                        tmp_8 = bound_3;
                    }
                    {
                        hasReturned_1 = true;
                        retval_1 = tmp_8;
                    }
                    tmp_15 = retval_1;
                }
                tmp_16 = tmp_15;
                h.fRaJ[tmp_16].dst_addr = 48w169252056759663;
                Gxorez = 64w10818472500171495232 ^ (bit<64>)h.eth_hdr.src_addr;
                {
                    bit<64> jWng_2 = Gxorez;
                    @name("hasReturned_0") bool hasReturned_2;
                    @name("retval_0") bool retval_2;
                    hasReturned_2 = false;
                    jWng_2 = 64w444834830427053126;
                    {
                        hasReturned_2 = true;
                        retval_2 = true;
                    }
                    Gxorez = jWng_2;
                }
            }
            default: {
            }
        }
        IGknYG = 64w0;
        {
            bit<64> jWng_3 = IGknYG;
            @name("hasReturned_0") bool hasReturned_2;
            @name("retval_0") bool retval_2;
            hasReturned_2 = false;
            jWng_3 = 64w444834830427053126;
            {
                hasReturned_2 = true;
                retval_2 = true;
            }
            IGknYG = jWng_3;
        }
        h.zEXs.eth_type = 14w5714 ++ (bit<2>)h.fRaJ[8].src_addr;
    }
}

parser Parser(packet_in b, out Headers hdr);
control Ingress(inout Headers hdr);
package top(Parser p, Ingress ig);
top(p(), ingress()) main;
