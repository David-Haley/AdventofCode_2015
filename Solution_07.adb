with Ada.Text_IO; use Ada.Text_IO;
with Interfaces; use Interfaces;

procedure Solution_07 is

   type Wires is record
      Value : Unsigned_16 := 0;
      -- initialised to prevent compiler warnings
      Defined : Boolean := False;
   end record; -- Wires

   Wire_a : Wires;
   Wire_aa : Wires;
   Wire_ab : Wires;
   Wire_ac : Wires;
   Wire_ad : Wires;
   Wire_ae : Wires;
   Wire_af : Wires;
   Wire_ag : Wires;
   Wire_ah : Wires;
   Wire_ai : Wires;
   Wire_aj : Wires;
   Wire_ak : Wires;
   Wire_al : Wires;
   Wire_am : Wires;
   Wire_an : Wires;
   Wire_ao : Wires;
   Wire_ap : Wires;
   Wire_aq : Wires;
   Wire_ar : Wires;
   Wire_as : Wires;
   Wire_at : Wires;
   Wire_au : Wires;
   Wire_av : Wires;
   Wire_aw : Wires;
   Wire_ax : Wires;
   Wire_ay : Wires;
   Wire_az : Wires;
   Wire_b : Wires;
   Wire_ba : Wires;
   Wire_bb : Wires;
   Wire_bc : Wires;
   Wire_bd : Wires;
   Wire_be : Wires;
   Wire_bf : Wires;
   Wire_bg : Wires;
   Wire_bh : Wires;
   Wire_bi : Wires;
   Wire_bj : Wires;
   Wire_bk : Wires;
   Wire_bl : Wires;
   Wire_bm : Wires;
   Wire_bn : Wires;
   Wire_bo : Wires;
   Wire_bp : Wires;
   Wire_bq : Wires;
   Wire_br : Wires;
   Wire_bs : Wires;
   Wire_bt : Wires;
   Wire_bu : Wires;
   Wire_bv : Wires;
   Wire_bw : Wires;
   Wire_bx : Wires;
   Wire_by : Wires;
   Wire_bz : Wires;
   Wire_c : Wires;
   Wire_ca : Wires;
   Wire_cb : Wires;
   Wire_cc : Wires;
   Wire_cd : Wires;
   Wire_ce : Wires;
   Wire_cf : Wires;
   Wire_cg : Wires;
   Wire_ch : Wires;
   Wire_ci : Wires;
   Wire_cj : Wires;
   Wire_ck : Wires;
   Wire_cl : Wires;
   Wire_cm : Wires;
   Wire_cn : Wires;
   Wire_co : Wires;
   Wire_cp : Wires;
   Wire_cq : Wires;
   Wire_cr : Wires;
   Wire_cs : Wires;
   Wire_ct : Wires;
   Wire_cu : Wires;
   Wire_cv : Wires;
   Wire_cw : Wires;
   Wire_cx : Wires;
   Wire_cy : Wires;
   Wire_cz : Wires;
   Wire_d : Wires;
   Wire_da : Wires;
   Wire_db : Wires;
   Wire_dc : Wires;
   Wire_dd : Wires;
   Wire_de : Wires;
   Wire_df : Wires;
   Wire_dg : Wires;
   Wire_dh : Wires;
   Wire_di : Wires;
   Wire_dj : Wires;
   Wire_dk : Wires;
   Wire_dl : Wires;
   Wire_dm : Wires;
   Wire_dn : Wires;
   Wire_do : Wires;
   Wire_dp : Wires;
   Wire_dq : Wires;
   Wire_dr : Wires;
   Wire_ds : Wires;
   Wire_dt : Wires;
   Wire_du : Wires;
   Wire_dv : Wires;
   Wire_dw : Wires;
   Wire_dx : Wires;
   Wire_dy : Wires;
   Wire_dz : Wires;
   Wire_e : Wires;
   Wire_ea : Wires;
   Wire_eb : Wires;
   Wire_ec : Wires;
   Wire_ed : Wires;
   Wire_ee : Wires;
   Wire_ef : Wires;
   Wire_eg : Wires;
   Wire_eh : Wires;
   Wire_ei : Wires;
   Wire_ej : Wires;
   Wire_ek : Wires;
   Wire_el : Wires;
   Wire_em : Wires;
   Wire_en : Wires;
   Wire_eo : Wires;
   Wire_ep : Wires;
   Wire_eq : Wires;
   Wire_er : Wires;
   Wire_es : Wires;
   Wire_et : Wires;
   Wire_eu : Wires;
   Wire_ev : Wires;
   Wire_ew : Wires;
   Wire_ex : Wires;
   Wire_ey : Wires;
   Wire_ez : Wires;
   Wire_f : Wires;
   Wire_fa : Wires;
   Wire_fb : Wires;
   Wire_fc : Wires;
   Wire_fd : Wires;
   Wire_fe : Wires;
   Wire_ff : Wires;
   Wire_fg : Wires;
   Wire_fh : Wires;
   Wire_fi : Wires;
   Wire_fj : Wires;
   Wire_fk : Wires;
   Wire_fl : Wires;
   Wire_fm : Wires;
   Wire_fn : Wires;
   Wire_fo : Wires;
   Wire_fp : Wires;
   Wire_fq : Wires;
   Wire_fr : Wires;
   Wire_fs : Wires;
   Wire_ft : Wires;
   Wire_fu : Wires;
   Wire_fv : Wires;
   Wire_fw : Wires;
   Wire_fx : Wires;
   Wire_fy : Wires;
   Wire_fz : Wires;
   Wire_g : Wires;
   Wire_ga : Wires;
   Wire_gb : Wires;
   Wire_gc : Wires;
   Wire_gd : Wires;
   Wire_ge : Wires;
   Wire_gf : Wires;
   Wire_gg : Wires;
   Wire_gh : Wires;
   Wire_gi : Wires;
   Wire_gj : Wires;
   Wire_gk : Wires;
   Wire_gl : Wires;
   Wire_gm : Wires;
   Wire_gn : Wires;
   Wire_go : Wires;
   Wire_gp : Wires;
   Wire_gq : Wires;
   Wire_gr : Wires;
   Wire_gs : Wires;
   Wire_gt : Wires;
   Wire_gu : Wires;
   Wire_gv : Wires;
   Wire_gw : Wires;
   Wire_gx : Wires;
   Wire_gy : Wires;
   Wire_gz : Wires;
   Wire_h : Wires;
   Wire_ha : Wires;
   Wire_hb : Wires;
   Wire_hc : Wires;
   Wire_hd : Wires;
   Wire_he : Wires;
   Wire_hf : Wires;
   Wire_hg : Wires;
   Wire_hh : Wires;
   Wire_hi : Wires;
   Wire_hj : Wires;
   Wire_hk : Wires;
   Wire_hl : Wires;
   Wire_hm : Wires;
   Wire_hn : Wires;
   Wire_ho : Wires;
   Wire_hp : Wires;
   Wire_hq : Wires;
   Wire_hr : Wires;
   Wire_hs : Wires;
   Wire_ht : Wires;
   Wire_hu : Wires;
   Wire_hv : Wires;
   Wire_hw : Wires;
   Wire_hx : Wires;
   Wire_hy : Wires;
   Wire_hz : Wires;
   Wire_i : Wires;
   Wire_ia : Wires;
   Wire_ib : Wires;
   Wire_ic : Wires;
   Wire_id : Wires;
   Wire_ie : Wires;
   Wire_if : Wires;
   Wire_ig : Wires;
   Wire_ih : Wires;
   Wire_ii : Wires;
   Wire_ij : Wires;
   Wire_ik : Wires;
   Wire_il : Wires;
   Wire_im : Wires;
   Wire_in : Wires;
   Wire_io : Wires;
   Wire_ip : Wires;
   Wire_iq : Wires;
   Wire_ir : Wires;
   Wire_is : Wires;
   Wire_it : Wires;
   Wire_iu : Wires;
   Wire_iv : Wires;
   Wire_iw : Wires;
   Wire_ix : Wires;
   Wire_iy : Wires;
   Wire_iz : Wires;
   Wire_j : Wires;
   Wire_ja : Wires;
   Wire_jb : Wires;
   Wire_jc : Wires;
   Wire_jd : Wires;
   Wire_je : Wires;
   Wire_jf : Wires;
   Wire_jg : Wires;
   Wire_jh : Wires;
   Wire_ji : Wires;
   Wire_jj : Wires;
   Wire_jk : Wires;
   Wire_jl : Wires;
   Wire_jm : Wires;
   Wire_jn : Wires;
   Wire_jo : Wires;
   Wire_jp : Wires;
   Wire_jq : Wires;
   Wire_jr : Wires;
   Wire_js : Wires;
   Wire_jt : Wires;
   Wire_ju : Wires;
   Wire_jv : Wires;
   Wire_jw : Wires;
   Wire_jx : Wires;
   Wire_jy : Wires;
   Wire_jz : Wires;
   Wire_k : Wires;
   Wire_ka : Wires;
   Wire_kb : Wires;
   Wire_kc : Wires;
   Wire_kd : Wires;
   Wire_ke : Wires;
   Wire_kf : Wires;
   Wire_kg : Wires;
   Wire_kh : Wires;
   Wire_ki : Wires;
   Wire_kj : Wires;
   Wire_kk : Wires;
   Wire_kl : Wires;
   Wire_km : Wires;
   Wire_kn : Wires;
   Wire_ko : Wires;
   Wire_kp : Wires;
   Wire_kq : Wires;
   Wire_kr : Wires;
   Wire_ks : Wires;
   Wire_kt : Wires;
   Wire_ku : Wires;
   Wire_kv : Wires;
   Wire_kw : Wires;
   Wire_kx : Wires;
   Wire_ky : Wires;
   Wire_kz : Wires;
   Wire_l : Wires;
   Wire_la : Wires;
   Wire_lb : Wires;
   Wire_lc : Wires;
   Wire_ld : Wires;
   Wire_le : Wires;
   Wire_lf : Wires;
   Wire_lg : Wires;
   Wire_lh : Wires;
   Wire_li : Wires;
   Wire_lj : Wires;
   Wire_lk : Wires;
   Wire_ll : Wires;
   Wire_lm : Wires;
   Wire_ln : Wires;
   Wire_lo : Wires;
   Wire_lp : Wires;
   Wire_lq : Wires;
   Wire_lr : Wires;
   Wire_ls : Wires;
   Wire_lt : Wires;
   Wire_lu : Wires;
   Wire_lv : Wires;
   Wire_lw : Wires;
   Wire_lx : Wires;
   Wire_ly : Wires;
   Wire_lz : Wires;
   Wire_m : Wires;
   Wire_ma : Wires;
   Wire_n : Wires;
   Wire_o : Wires;
   Wire_p : Wires;
   Wire_q : Wires;
   Wire_r : Wires;
   Wire_s : Wires;
   Wire_t : Wires;
   Wire_u : Wires;
   Wire_v : Wires;
   Wire_w : Wires;
   Wire_x : Wires;
   Wire_y : Wires;
   Wire_z : Wires;

begin -- Solution_07
   for I in Positive range 1 .. 1000 loop
      -- bn RSHIFT 2 -> bo
      if Wire_bn.Defined and True then
         Wire_bo.Defined := True;
         Wire_bo.Value := Shift_Right (Wire_bn.Value, 2);
      end if;
      -- lf RSHIFT 1 -> ly
      if Wire_lf.Defined and True then
         Wire_ly.Defined := True;
         Wire_ly.Value := Shift_Right (Wire_lf.Value, 1);
      end if;
      -- fo RSHIFT 3 -> fq
      if Wire_fo.Defined and True then
         Wire_fq.Defined := True;
         Wire_fq.Value := Shift_Right (Wire_fo.Value, 3);
      end if;
      -- cj OR cp -> cq
      if Wire_cj.Defined and Wire_cp.Defined then
         Wire_cq.Defined := True;
         Wire_cq.Value := Wire_cj.Value or Wire_cp.Value;
      end if;
      -- fo OR fz -> ga
      if Wire_fo.Defined and Wire_fz.Defined then
         Wire_ga.Defined := True;
         Wire_ga.Value := Wire_fo.Value or Wire_fz.Value;
      end if;
      -- t OR s -> u
      if Wire_t.Defined and Wire_s.Defined then
         Wire_u.Defined := True;
         Wire_u.Value := Wire_t.Value or Wire_s.Value;
      end if;
      -- lx -> a
      if Wire_lx.Defined then
         Wire_a.Defined := True;
         Wire_a.Value := Wire_lx.Value;
      end if;
      -- NOT ax -> ay
      if Wire_ax.Defined then
         Wire_ay.Defined := True;
         Wire_ay.Value := not Wire_ax.Value;
      end if;
      -- he RSHIFT 2 -> hf
      if Wire_he.Defined and True then
         Wire_hf.Defined := True;
         Wire_hf.Value := Shift_Right (Wire_he.Value, 2);
      end if;
      -- lf OR lq -> lr
      if Wire_lf.Defined and Wire_lq.Defined then
         Wire_lr.Defined := True;
         Wire_lr.Value := Wire_lf.Value or Wire_lq.Value;
      end if;
      -- lr AND lt -> lu
      if Wire_lr.Defined and Wire_lt.Defined then
         Wire_lu.Defined := True;
         Wire_lu.Value := Wire_lr.Value and Wire_lt.Value;
      end if;
      -- dy OR ej -> ek
      if Wire_dy.Defined and Wire_ej.Defined then
         Wire_ek.Defined := True;
         Wire_ek.Value := Wire_dy.Value or Wire_ej.Value;
      end if;
      -- 1 AND cx -> cy
      if True and Wire_cx.Defined then
         Wire_cy.Defined := True;
         Wire_cy.Value := 1 and Wire_cx.Value;
      end if;
      -- hb LSHIFT 1 -> hv
      if Wire_hb.Defined and True then
         Wire_hv.Defined := True;
         Wire_hv.Value := Shift_Left (Wire_hb.Value, 1);
      end if;
      -- 1 AND bh -> bi
      if True and Wire_bh.Defined then
         Wire_bi.Defined := True;
         Wire_bi.Value := 1 and Wire_bh.Value;
      end if;
      -- ih AND ij -> ik
      if Wire_ih.Defined and Wire_ij.Defined then
         Wire_ik.Defined := True;
         Wire_ik.Value := Wire_ih.Value and Wire_ij.Value;
      end if;
      -- c LSHIFT 1 -> t
      if Wire_c.Defined and True then
         Wire_t.Defined := True;
         Wire_t.Value := Shift_Left (Wire_c.Value, 1);
      end if;
      -- ea AND eb -> ed
      if Wire_ea.Defined and Wire_eb.Defined then
         Wire_ed.Defined := True;
         Wire_ed.Value := Wire_ea.Value and Wire_eb.Value;
      end if;
      -- km OR kn -> ko
      if Wire_km.Defined and Wire_kn.Defined then
         Wire_ko.Defined := True;
         Wire_ko.Value := Wire_km.Value or Wire_kn.Value;
      end if;
      -- NOT bw -> bx
      if Wire_bw.Defined then
         Wire_bx.Defined := True;
         Wire_bx.Value := not Wire_bw.Value;
      end if;
      -- ci OR ct -> cu
      if Wire_ci.Defined and Wire_ct.Defined then
         Wire_cu.Defined := True;
         Wire_cu.Value := Wire_ci.Value or Wire_ct.Value;
      end if;
      -- NOT p -> q
      if Wire_p.Defined then
         Wire_q.Defined := True;
         Wire_q.Value := not Wire_p.Value;
      end if;
      -- lw OR lv -> lx
      if Wire_lw.Defined and Wire_lv.Defined then
         Wire_lx.Defined := True;
         Wire_lx.Value := Wire_lw.Value or Wire_lv.Value;
      end if;
      -- NOT lo -> lp
      if Wire_lo.Defined then
         Wire_lp.Defined := True;
         Wire_lp.Value := not Wire_lo.Value;
      end if;
      -- fp OR fv -> fw
      if Wire_fp.Defined and Wire_fv.Defined then
         Wire_fw.Defined := True;
         Wire_fw.Value := Wire_fp.Value or Wire_fv.Value;
      end if;
      -- o AND q -> r
      if Wire_o.Defined and Wire_q.Defined then
         Wire_r.Defined := True;
         Wire_r.Value := Wire_o.Value and Wire_q.Value;
      end if;
      -- dh AND dj -> dk
      if Wire_dh.Defined and Wire_dj.Defined then
         Wire_dk.Defined := True;
         Wire_dk.Value := Wire_dh.Value and Wire_dj.Value;
      end if;
      -- ap LSHIFT 1 -> bj
      if Wire_ap.Defined and True then
         Wire_bj.Defined := True;
         Wire_bj.Value := Shift_Left (Wire_ap.Value, 1);
      end if;
      -- bk LSHIFT 1 -> ce
      if Wire_bk.Defined and True then
         Wire_ce.Defined := True;
         Wire_ce.Value := Shift_Left (Wire_bk.Value, 1);
      end if;
      -- NOT ii -> ij
      if Wire_ii.Defined then
         Wire_ij.Defined := True;
         Wire_ij.Value := not Wire_ii.Value;
      end if;
      -- gh OR gi -> gj
      if Wire_gh.Defined and Wire_gi.Defined then
         Wire_gj.Defined := True;
         Wire_gj.Value := Wire_gh.Value or Wire_gi.Value;
      end if;
      -- kk RSHIFT 1 -> ld
      if Wire_kk.Defined and True then
         Wire_ld.Defined := True;
         Wire_ld.Value := Shift_Right (Wire_kk.Value, 1);
      end if;
      -- lc LSHIFT 1 -> lw
      if Wire_lc.Defined and True then
         Wire_lw.Defined := True;
         Wire_lw.Value := Shift_Left (Wire_lc.Value, 1);
      end if;
      -- lb OR la -> lc
      if Wire_lb.Defined and Wire_la.Defined then
         Wire_lc.Defined := True;
         Wire_lc.Value := Wire_lb.Value or Wire_la.Value;
      end if;
      -- 1 AND am -> an
      if True and Wire_am.Defined then
         Wire_an.Defined := True;
         Wire_an.Value := 1 and Wire_am.Value;
      end if;
      -- gn AND gp -> gq
      if Wire_gn.Defined and Wire_gp.Defined then
         Wire_gq.Defined := True;
         Wire_gq.Value := Wire_gn.Value and Wire_gp.Value;
      end if;
      -- lf RSHIFT 3 -> lh
      if Wire_lf.Defined and True then
         Wire_lh.Defined := True;
         Wire_lh.Value := Shift_Right (Wire_lf.Value, 3);
      end if;
      -- e OR f -> g
      if Wire_e.Defined and Wire_f.Defined then
         Wire_g.Defined := True;
         Wire_g.Value := Wire_e.Value or Wire_f.Value;
      end if;
      -- lg AND lm -> lo
      if Wire_lg.Defined and Wire_lm.Defined then
         Wire_lo.Defined := True;
         Wire_lo.Value := Wire_lg.Value and Wire_lm.Value;
      end if;
      -- ci RSHIFT 1 -> db
      if Wire_ci.Defined and True then
         Wire_db.Defined := True;
         Wire_db.Value := Shift_Right (Wire_ci.Value, 1);
      end if;
      -- cf LSHIFT 1 -> cz
      if Wire_cf.Defined and True then
         Wire_cz.Defined := True;
         Wire_cz.Value := Shift_Left (Wire_cf.Value, 1);
      end if;
      -- bn RSHIFT 1 -> cg
      if Wire_bn.Defined and True then
         Wire_cg.Defined := True;
         Wire_cg.Value := Shift_Right (Wire_bn.Value, 1);
      end if;
      -- et AND fe -> fg
      if Wire_et.Defined and Wire_fe.Defined then
         Wire_fg.Defined := True;
         Wire_fg.Value := Wire_et.Value and Wire_fe.Value;
      end if;
      -- is OR it -> iu
      if Wire_is.Defined and Wire_it.Defined then
         Wire_iu.Defined := True;
         Wire_iu.Value := Wire_is.Value or Wire_it.Value;
      end if;
      -- kw AND ky -> kz
      if Wire_kw.Defined and Wire_ky.Defined then
         Wire_kz.Defined := True;
         Wire_kz.Value := Wire_kw.Value and Wire_ky.Value;
      end if;
      -- ck AND cl -> cn
      if Wire_ck.Defined and Wire_cl.Defined then
         Wire_cn.Defined := True;
         Wire_cn.Value := Wire_ck.Value and Wire_cl.Value;
      end if;
      -- bj OR bi -> bk
      if Wire_bj.Defined and Wire_bi.Defined then
         Wire_bk.Defined := True;
         Wire_bk.Value := Wire_bj.Value or Wire_bi.Value;
      end if;
      -- gj RSHIFT 1 -> hc
      if Wire_gj.Defined and True then
         Wire_hc.Defined := True;
         Wire_hc.Value := Shift_Right (Wire_gj.Value, 1);
      end if;
      -- iu AND jf -> jh
      if Wire_iu.Defined and Wire_jf.Defined then
         Wire_jh.Defined := True;
         Wire_jh.Value := Wire_iu.Value and Wire_jf.Value;
      end if;
      -- NOT bs -> bt
      if Wire_bs.Defined then
         Wire_bt.Defined := True;
         Wire_bt.Value := not Wire_bs.Value;
      end if;
      -- kk OR kv -> kw
      if Wire_kk.Defined and Wire_kv.Defined then
         Wire_kw.Defined := True;
         Wire_kw.Value := Wire_kk.Value or Wire_kv.Value;
      end if;
      -- ks AND ku -> kv
      if Wire_ks.Defined and Wire_ku.Defined then
         Wire_kv.Defined := True;
         Wire_kv.Value := Wire_ks.Value and Wire_ku.Value;
      end if;
      -- hz OR ik -> il
      if Wire_hz.Defined and Wire_ik.Defined then
         Wire_il.Defined := True;
         Wire_il.Value := Wire_hz.Value or Wire_ik.Value;
      end if;
      -- b RSHIFT 1 -> v
      if Wire_b.Defined and True then
         Wire_v.Defined := True;
         Wire_v.Value := Shift_Right (Wire_b.Value, 1);
      end if;
      -- iu RSHIFT 1 -> jn
      if Wire_iu.Defined and True then
         Wire_jn.Defined := True;
         Wire_jn.Value := Shift_Right (Wire_iu.Value, 1);
      end if;
      -- fo RSHIFT 5 -> fr
      if Wire_fo.Defined and True then
         Wire_fr.Defined := True;
         Wire_fr.Value := Shift_Right (Wire_fo.Value, 5);
      end if;
      -- be AND bg -> bh
      if Wire_be.Defined and Wire_bg.Defined then
         Wire_bh.Defined := True;
         Wire_bh.Value := Wire_be.Value and Wire_bg.Value;
      end if;
      -- ga AND gc -> gd
      if Wire_ga.Defined and Wire_gc.Defined then
         Wire_gd.Defined := True;
         Wire_gd.Value := Wire_ga.Value and Wire_gc.Value;
      end if;
      -- hf OR hl -> hm
      if Wire_hf.Defined and Wire_hl.Defined then
         Wire_hm.Defined := True;
         Wire_hm.Value := Wire_hf.Value or Wire_hl.Value;
      end if;
      -- ld OR le -> lf
      if Wire_ld.Defined and Wire_le.Defined then
         Wire_lf.Defined := True;
         Wire_lf.Value := Wire_ld.Value or Wire_le.Value;
      end if;
      -- as RSHIFT 5 -> av
      if Wire_as.Defined and True then
         Wire_av.Defined := True;
         Wire_av.Value := Shift_Right (Wire_as.Value, 5);
      end if;
      -- fm OR fn -> fo
      if Wire_fm.Defined and Wire_fn.Defined then
         Wire_fo.Defined := True;
         Wire_fo.Value := Wire_fm.Value or Wire_fn.Value;
      end if;
      -- hm AND ho -> hp
      if Wire_hm.Defined and Wire_ho.Defined then
         Wire_hp.Defined := True;
         Wire_hp.Value := Wire_hm.Value and Wire_ho.Value;
      end if;
      -- lg OR lm -> ln
      if Wire_lg.Defined and Wire_lm.Defined then
         Wire_ln.Defined := True;
         Wire_ln.Value := Wire_lg.Value or Wire_lm.Value;
      end if;
      -- NOT kx -> ky
      if Wire_kx.Defined then
         Wire_ky.Defined := True;
         Wire_ky.Value := not Wire_kx.Value;
      end if;
      -- kk RSHIFT 3 -> km
      if Wire_kk.Defined and True then
         Wire_km.Defined := True;
         Wire_km.Value := Shift_Right (Wire_kk.Value, 3);
      end if;
      -- ek AND em -> en
      if Wire_ek.Defined and Wire_em.Defined then
         Wire_en.Defined := True;
         Wire_en.Value := Wire_ek.Value and Wire_em.Value;
      end if;
      -- NOT ft -> fu
      if Wire_ft.Defined then
         Wire_fu.Defined := True;
         Wire_fu.Value := not Wire_ft.Value;
      end if;
      -- NOT jh -> ji
      if Wire_jh.Defined then
         Wire_ji.Defined := True;
         Wire_ji.Value := not Wire_jh.Value;
      end if;
      -- jn OR jo -> jp
      if Wire_jn.Defined and Wire_jo.Defined then
         Wire_jp.Defined := True;
         Wire_jp.Value := Wire_jn.Value or Wire_jo.Value;
      end if;
      -- gj AND gu -> gw
      if Wire_gj.Defined and Wire_gu.Defined then
         Wire_gw.Defined := True;
         Wire_gw.Value := Wire_gj.Value and Wire_gu.Value;
      end if;
      -- d AND j -> l
      if Wire_d.Defined and Wire_j.Defined then
         Wire_l.Defined := True;
         Wire_l.Value := Wire_d.Value and Wire_j.Value;
      end if;
      -- et RSHIFT 1 -> fm
      if Wire_et.Defined and True then
         Wire_fm.Defined := True;
         Wire_fm.Value := Shift_Right (Wire_et.Value, 1);
      end if;
      -- jq OR jw -> jx
      if Wire_jq.Defined and Wire_jw.Defined then
         Wire_jx.Defined := True;
         Wire_jx.Value := Wire_jq.Value or Wire_jw.Value;
      end if;
      -- ep OR eo -> eq
      if Wire_ep.Defined and Wire_eo.Defined then
         Wire_eq.Defined := True;
         Wire_eq.Value := Wire_ep.Value or Wire_eo.Value;
      end if;
      -- lv LSHIFT 15 -> lz
      if Wire_lv.Defined and True then
         Wire_lz.Defined := True;
         Wire_lz.Value := Shift_Left (Wire_lv.Value, 15);
      end if;
      -- NOT ey -> ez
      if Wire_ey.Defined then
         Wire_ez.Defined := True;
         Wire_ez.Value := not Wire_ey.Value;
      end if;
      -- jp RSHIFT 2 -> jq
      if Wire_jp.Defined and True then
         Wire_jq.Defined := True;
         Wire_jq.Value := Shift_Right (Wire_jp.Value, 2);
      end if;
      -- eg AND ei -> ej
      if Wire_eg.Defined and Wire_ei.Defined then
         Wire_ej.Defined := True;
         Wire_ej.Value := Wire_eg.Value and Wire_ei.Value;
      end if;
      -- NOT dm -> dn
      if Wire_dm.Defined then
         Wire_dn.Defined := True;
         Wire_dn.Value := not Wire_dm.Value;
      end if;
      -- jp AND ka -> kc
      if Wire_jp.Defined and Wire_ka.Defined then
         Wire_kc.Defined := True;
         Wire_kc.Value := Wire_jp.Value and Wire_ka.Value;
      end if;
      -- as AND bd -> bf
      if Wire_as.Defined and Wire_bd.Defined then
         Wire_bf.Defined := True;
         Wire_bf.Value := Wire_as.Value and Wire_bd.Value;
      end if;
      -- fk OR fj -> fl
      if Wire_fk.Defined and Wire_fj.Defined then
         Wire_fl.Defined := True;
         Wire_fl.Value := Wire_fk.Value or Wire_fj.Value;
      end if;
      -- dw OR dx -> dy
      if Wire_dw.Defined and Wire_dx.Defined then
         Wire_dy.Defined := True;
         Wire_dy.Value := Wire_dw.Value or Wire_dx.Value;
      end if;
      -- lj AND ll -> lm
      if Wire_lj.Defined and Wire_ll.Defined then
         Wire_lm.Defined := True;
         Wire_lm.Value := Wire_lj.Value and Wire_ll.Value;
      end if;
      -- ec AND ee -> ef
      if Wire_ec.Defined and Wire_ee.Defined then
         Wire_ef.Defined := True;
         Wire_ef.Value := Wire_ec.Value and Wire_ee.Value;
      end if;
      -- fq AND fr -> ft
      if Wire_fq.Defined and Wire_fr.Defined then
         Wire_ft.Defined := True;
         Wire_ft.Value := Wire_fq.Value and Wire_fr.Value;
      end if;
      -- NOT kp -> kq
      if Wire_kp.Defined then
         Wire_kq.Defined := True;
         Wire_kq.Value := not Wire_kp.Value;
      end if;
      -- ki OR kj -> kk
      if Wire_ki.Defined and Wire_kj.Defined then
         Wire_kk.Defined := True;
         Wire_kk.Value := Wire_ki.Value or Wire_kj.Value;
      end if;
      -- cz OR cy -> da
      if Wire_cz.Defined and Wire_cy.Defined then
         Wire_da.Defined := True;
         Wire_da.Value := Wire_cz.Value or Wire_cy.Value;
      end if;
      -- as RSHIFT 3 -> au
      if Wire_as.Defined and True then
         Wire_au.Defined := True;
         Wire_au.Value := Shift_Right (Wire_as.Value, 3);
      end if;
      -- an LSHIFT 15 -> ar
      if Wire_an.Defined and True then
         Wire_ar.Defined := True;
         Wire_ar.Value := Shift_Left (Wire_an.Value, 15);
      end if;
      -- fj LSHIFT 15 -> fn
      if Wire_fj.Defined and True then
         Wire_fn.Defined := True;
         Wire_fn.Value := Shift_Left (Wire_fj.Value, 15);
      end if;
      -- 1 AND fi -> fj
      if True and Wire_fi.Defined then
         Wire_fj.Defined := True;
         Wire_fj.Value := 1 and Wire_fi.Value;
      end if;
      -- he RSHIFT 1 -> hx
      if Wire_he.Defined and True then
         Wire_hx.Defined := True;
         Wire_hx.Value := Shift_Right (Wire_he.Value, 1);
      end if;
      -- lf RSHIFT 2 -> lg
      if Wire_lf.Defined and True then
         Wire_lg.Defined := True;
         Wire_lg.Value := Shift_Right (Wire_lf.Value, 2);
      end if;
      -- kf LSHIFT 15 -> kj
      if Wire_kf.Defined and True then
         Wire_kj.Defined := True;
         Wire_kj.Value := Shift_Left (Wire_kf.Value, 15);
      end if;
      -- dz AND ef -> eh
      if Wire_dz.Defined and Wire_ef.Defined then
         Wire_eh.Defined := True;
         Wire_eh.Value := Wire_dz.Value and Wire_ef.Value;
      end if;
      -- ib OR ic -> id
      if Wire_ib.Defined and Wire_ic.Defined then
         Wire_id.Defined := True;
         Wire_id.Value := Wire_ib.Value or Wire_ic.Value;
      end if;
      -- lf RSHIFT 5 -> li
      if Wire_lf.Defined and True then
         Wire_li.Defined := True;
         Wire_li.Value := Shift_Right (Wire_lf.Value, 5);
      end if;
      -- bp OR bq -> br
      if Wire_bp.Defined and Wire_bq.Defined then
         Wire_br.Defined := True;
         Wire_br.Value := Wire_bp.Value or Wire_bq.Value;
      end if;
      -- NOT gs -> gt
      if Wire_gs.Defined then
         Wire_gt.Defined := True;
         Wire_gt.Value := not Wire_gs.Value;
      end if;
      -- fo RSHIFT 1 -> gh
      if Wire_fo.Defined and True then
         Wire_gh.Defined := True;
         Wire_gh.Value := Shift_Right (Wire_fo.Value, 1);
      end if;
      -- bz AND cb -> cc
      if Wire_bz.Defined and Wire_cb.Defined then
         Wire_cc.Defined := True;
         Wire_cc.Value := Wire_bz.Value and Wire_cb.Value;
      end if;
      -- ea OR eb -> ec
      if Wire_ea.Defined and Wire_eb.Defined then
         Wire_ec.Defined := True;
         Wire_ec.Value := Wire_ea.Value or Wire_eb.Value;
      end if;
      -- lf AND lq -> ls
      if Wire_lf.Defined and Wire_lq.Defined then
         Wire_ls.Defined := True;
         Wire_ls.Value := Wire_lf.Value and Wire_lq.Value;
      end if;
      -- NOT l -> m
      if Wire_l.Defined then
         Wire_m.Defined := True;
         Wire_m.Value := not Wire_l.Value;
      end if;
      -- hz RSHIFT 3 -> ib
      if Wire_hz.Defined and True then
         Wire_ib.Defined := True;
         Wire_ib.Value := Shift_Right (Wire_hz.Value, 3);
      end if;
      -- NOT di -> dj
      if Wire_di.Defined then
         Wire_dj.Defined := True;
         Wire_dj.Value := not Wire_di.Value;
      end if;
      -- NOT lk -> ll
      if Wire_lk.Defined then
         Wire_ll.Defined := True;
         Wire_ll.Value := not Wire_lk.Value;
      end if;
      -- jp RSHIFT 3 -> jr
      if Wire_jp.Defined and True then
         Wire_jr.Defined := True;
         Wire_jr.Value := Shift_Right (Wire_jp.Value, 3);
      end if;
      -- jp RSHIFT 5 -> js
      if Wire_jp.Defined and True then
         Wire_js.Defined := True;
         Wire_js.Value := Shift_Right (Wire_jp.Value, 5);
      end if;
      -- NOT bf -> bg
      if Wire_bf.Defined then
         Wire_bg.Defined := True;
         Wire_bg.Value := not Wire_bf.Value;
      end if;
      -- s LSHIFT 15 -> w
      if Wire_s.Defined and True then
         Wire_w.Defined := True;
         Wire_w.Value := Shift_Left (Wire_s.Value, 15);
      end if;
      -- eq LSHIFT 1 -> fk
      if Wire_eq.Defined and True then
         Wire_fk.Defined := True;
         Wire_fk.Value := Shift_Left (Wire_eq.Value, 1);
      end if;
      -- jl OR jk -> jm
      if Wire_jl.Defined and Wire_jk.Defined then
         Wire_jm.Defined := True;
         Wire_jm.Value := Wire_jl.Value or Wire_jk.Value;
      end if;
      -- hz AND ik -> im
      if Wire_hz.Defined and Wire_ik.Defined then
         Wire_im.Defined := True;
         Wire_im.Value := Wire_hz.Value and Wire_ik.Value;
      end if;
      -- dz OR ef -> eg
      if Wire_dz.Defined and Wire_ef.Defined then
         Wire_eg.Defined := True;
         Wire_eg.Value := Wire_dz.Value or Wire_ef.Value;
      end if;
      -- 1 AND gy -> gz
      if True and Wire_gy.Defined then
         Wire_gz.Defined := True;
         Wire_gz.Value := 1 and Wire_gy.Value;
      end if;
      -- la LSHIFT 15 -> le
      if Wire_la.Defined and True then
         Wire_le.Defined := True;
         Wire_le.Value := Shift_Left (Wire_la.Value, 15);
      end if;
      -- br AND bt -> bu
      if Wire_br.Defined and Wire_bt.Defined then
         Wire_bu.Defined := True;
         Wire_bu.Value := Wire_br.Value and Wire_bt.Value;
      end if;
      -- NOT cn -> co
      if Wire_cn.Defined then
         Wire_co.Defined := True;
         Wire_co.Value := not Wire_cn.Value;
      end if;
      -- v OR w -> x
      if Wire_v.Defined and Wire_w.Defined then
         Wire_x.Defined := True;
         Wire_x.Value := Wire_v.Value or Wire_w.Value;
      end if;
      -- d OR j -> k
      if Wire_d.Defined and Wire_j.Defined then
         Wire_k.Defined := True;
         Wire_k.Value := Wire_d.Value or Wire_j.Value;
      end if;
      -- 1 AND gd -> ge
      if True and Wire_gd.Defined then
         Wire_ge.Defined := True;
         Wire_ge.Value := 1 and Wire_gd.Value;
      end if;
      -- ia OR ig -> ih
      if Wire_ia.Defined and Wire_ig.Defined then
         Wire_ih.Defined := True;
         Wire_ih.Value := Wire_ia.Value or Wire_ig.Value;
      end if;
      -- NOT go -> gp
      if Wire_go.Defined then
         Wire_gp.Defined := True;
         Wire_gp.Value := not Wire_go.Value;
      end if;
      -- NOT ed -> ee
      if Wire_ed.Defined then
         Wire_ee.Defined := True;
         Wire_ee.Value := not Wire_ed.Value;
      end if;
      -- jq AND jw -> jy
      if Wire_jq.Defined and Wire_jw.Defined then
         Wire_jy.Defined := True;
         Wire_jy.Value := Wire_jq.Value and Wire_jw.Value;
      end if;
      -- et OR fe -> ff
      if Wire_et.Defined and Wire_fe.Defined then
         Wire_ff.Defined := True;
         Wire_ff.Value := Wire_et.Value or Wire_fe.Value;
      end if;
      -- aw AND ay -> az
      if Wire_aw.Defined and Wire_ay.Defined then
         Wire_az.Defined := True;
         Wire_az.Value := Wire_aw.Value and Wire_ay.Value;
      end if;
      -- ff AND fh -> fi
      if Wire_ff.Defined and Wire_fh.Defined then
         Wire_fi.Defined := True;
         Wire_fi.Value := Wire_ff.Value and Wire_fh.Value;
      end if;
      -- ir LSHIFT 1 -> jl
      if Wire_ir.Defined and True then
         Wire_jl.Defined := True;
         Wire_jl.Value := Shift_Left (Wire_ir.Value, 1);
      end if;
      -- gg LSHIFT 1 -> ha
      if Wire_gg.Defined and True then
         Wire_ha.Defined := True;
         Wire_ha.Value := Shift_Left (Wire_gg.Value, 1);
      end if;
      -- x RSHIFT 2 -> y
      if Wire_x.Defined and True then
         Wire_y.Defined := True;
         Wire_y.Value := Shift_Right (Wire_x.Value, 2);
      end if;
      -- db OR dc -> dd
      if Wire_db.Defined and Wire_dc.Defined then
         Wire_dd.Defined := True;
         Wire_dd.Value := Wire_db.Value or Wire_dc.Value;
      end if;
      -- bl OR bm -> bn
      if Wire_bl.Defined and Wire_bm.Defined then
         Wire_bn.Defined := True;
         Wire_bn.Value := Wire_bl.Value or Wire_bm.Value;
      end if;
      -- ib AND ic -> ie
      if Wire_ib.Defined and Wire_ic.Defined then
         Wire_ie.Defined := True;
         Wire_ie.Value := Wire_ib.Value and Wire_ic.Value;
      end if;
      -- x RSHIFT 3 -> z
      if Wire_x.Defined and True then
         Wire_z.Defined := True;
         Wire_z.Value := Shift_Right (Wire_x.Value, 3);
      end if;
      -- lh AND li -> lk
      if Wire_lh.Defined and Wire_li.Defined then
         Wire_lk.Defined := True;
         Wire_lk.Value := Wire_lh.Value and Wire_li.Value;
      end if;
      -- ce OR cd -> cf
      if Wire_ce.Defined and Wire_cd.Defined then
         Wire_cf.Defined := True;
         Wire_cf.Value := Wire_ce.Value or Wire_cd.Value;
      end if;
      -- NOT bb -> bc
      if Wire_bb.Defined then
         Wire_bc.Defined := True;
         Wire_bc.Value := not Wire_bb.Value;
      end if;
      -- hi AND hk -> hl
      if Wire_hi.Defined and Wire_hk.Defined then
         Wire_hl.Defined := True;
         Wire_hl.Value := Wire_hi.Value and Wire_hk.Value;
      end if;
      -- NOT gb -> gc
      if Wire_gb.Defined then
         Wire_gc.Defined := True;
         Wire_gc.Value := not Wire_gb.Value;
      end if;
      -- 1 AND r -> s
      if True and Wire_r.Defined then
         Wire_s.Defined := True;
         Wire_s.Value := 1 and Wire_r.Value;
      end if;
      -- fw AND fy -> fz
      if Wire_fw.Defined and Wire_fy.Defined then
         Wire_fz.Defined := True;
         Wire_fz.Value := Wire_fw.Value and Wire_fy.Value;
      end if;
      -- fb AND fd -> fe
      if Wire_fb.Defined and Wire_fd.Defined then
         Wire_fe.Defined := True;
         Wire_fe.Value := Wire_fb.Value and Wire_fd.Value;
      end if;
      -- 1 AND en -> eo
      if True and Wire_en.Defined then
         Wire_eo.Defined := True;
         Wire_eo.Value := 1 and Wire_en.Value;
      end if;
      -- z OR aa -> ab
      if Wire_z.Defined and Wire_aa.Defined then
         Wire_ab.Defined := True;
         Wire_ab.Value := Wire_z.Value or Wire_aa.Value;
      end if;
      -- bi LSHIFT 15 -> bm
      if Wire_bi.Defined and True then
         Wire_bm.Defined := True;
         Wire_bm.Value := Shift_Left (Wire_bi.Value, 15);
      end if;
      -- hg OR hh -> hi
      if Wire_hg.Defined and Wire_hh.Defined then
         Wire_hi.Defined := True;
         Wire_hi.Value := Wire_hg.Value or Wire_hh.Value;
      end if;
      -- kh LSHIFT 1 -> lb
      if Wire_kh.Defined and True then
         Wire_lb.Defined := True;
         Wire_lb.Value := Shift_Left (Wire_kh.Value, 1);
      end if;
      -- cg OR ch -> ci
      if Wire_cg.Defined and Wire_ch.Defined then
         Wire_ci.Defined := True;
         Wire_ci.Value := Wire_cg.Value or Wire_ch.Value;
      end if;
      -- 1 AND kz -> la
      if True and Wire_kz.Defined then
         Wire_la.Defined := True;
         Wire_la.Value := 1 and Wire_kz.Value;
      end if;
      -- gf OR ge -> gg
      if Wire_gf.Defined and Wire_ge.Defined then
         Wire_gg.Defined := True;
         Wire_gg.Value := Wire_gf.Value or Wire_ge.Value;
      end if;
      -- gj RSHIFT 2 -> gk
      if Wire_gj.Defined and True then
         Wire_gk.Defined := True;
         Wire_gk.Value := Shift_Right (Wire_gj.Value, 2);
      end if;
      -- dd RSHIFT 2 -> de
      if Wire_dd.Defined and True then
         Wire_de.Defined := True;
         Wire_de.Value := Shift_Right (Wire_dd.Value, 2);
      end if;
      -- NOT ls -> lt
      if Wire_ls.Defined then
         Wire_lt.Defined := True;
         Wire_lt.Value := not Wire_ls.Value;
      end if;
      -- lh OR li -> lj
      if Wire_lh.Defined and Wire_li.Defined then
         Wire_lj.Defined := True;
         Wire_lj.Value := Wire_lh.Value or Wire_li.Value;
      end if;
      -- jr OR js -> jt
      if Wire_jr.Defined and Wire_js.Defined then
         Wire_jt.Defined := True;
         Wire_jt.Value := Wire_jr.Value or Wire_js.Value;
      end if;
      -- au AND av -> ax
      if Wire_au.Defined and Wire_av.Defined then
         Wire_ax.Defined := True;
         Wire_ax.Value := Wire_au.Value and Wire_av.Value;
      end if;
      -- 0 -> c
      if True then
         Wire_c.Defined := True;
         Wire_c.Value := 0;
      end if;
      -- he AND hp -> hr
      if Wire_he.Defined and Wire_hp.Defined then
         Wire_hr.Defined := True;
         Wire_hr.Value := Wire_he.Value and Wire_hp.Value;
      end if;
      -- id AND if -> ig
      if Wire_id.Defined and Wire_if.Defined then
         Wire_ig.Defined := True;
         Wire_ig.Value := Wire_id.Value and Wire_if.Value;
      end if;
      -- et RSHIFT 5 -> ew
      if Wire_et.Defined and True then
         Wire_ew.Defined := True;
         Wire_ew.Value := Shift_Right (Wire_et.Value, 5);
      end if;
      -- bp AND bq -> bs
      if Wire_bp.Defined and Wire_bq.Defined then
         Wire_bs.Defined := True;
         Wire_bs.Value := Wire_bp.Value and Wire_bq.Value;
      end if;
      -- e AND f -> h
      if Wire_e.Defined and Wire_f.Defined then
         Wire_h.Defined := True;
         Wire_h.Value := Wire_e.Value and Wire_f.Value;
      end if;
      -- ly OR lz -> ma
      if Wire_ly.Defined and Wire_lz.Defined then
         Wire_ma.Defined := True;
         Wire_ma.Value := Wire_ly.Value or Wire_lz.Value;
      end if;
      -- 1 AND lu -> lv
      if True and Wire_lu.Defined then
         Wire_lv.Defined := True;
         Wire_lv.Value := 1 and Wire_lu.Value;
      end if;
      -- NOT jd -> je
      if Wire_jd.Defined then
         Wire_je.Defined := True;
         Wire_je.Value := not Wire_jd.Value;
      end if;
      -- ha OR gz -> hb
      if Wire_ha.Defined and Wire_gz.Defined then
         Wire_hb.Defined := True;
         Wire_hb.Value := Wire_ha.Value or Wire_gz.Value;
      end if;
      -- dy RSHIFT 1 -> er
      if Wire_dy.Defined and True then
         Wire_er.Defined := True;
         Wire_er.Value := Shift_Right (Wire_dy.Value, 1);
      end if;
      -- iu RSHIFT 2 -> iv
      if Wire_iu.Defined and True then
         Wire_iv.Defined := True;
         Wire_iv.Value := Shift_Right (Wire_iu.Value, 2);
      end if;
      -- NOT hr -> hs
      if Wire_hr.Defined then
         Wire_hs.Defined := True;
         Wire_hs.Value := not Wire_hr.Value;
      end if;
      -- as RSHIFT 1 -> bl
      if Wire_as.Defined and True then
         Wire_bl.Defined := True;
         Wire_bl.Value := Shift_Right (Wire_as.Value, 1);
      end if;
      -- kk RSHIFT 2 -> kl
      if Wire_kk.Defined and True then
         Wire_kl.Defined := True;
         Wire_kl.Value := Shift_Right (Wire_kk.Value, 2);
      end if;
      -- b AND n -> p
      if Wire_b.Defined and Wire_n.Defined then
         Wire_p.Defined := True;
         Wire_p.Value := Wire_b.Value and Wire_n.Value;
      end if;
      -- ln AND lp -> lq
      if Wire_ln.Defined and Wire_lp.Defined then
         Wire_lq.Defined := True;
         Wire_lq.Value := Wire_ln.Value and Wire_lp.Value;
      end if;
      -- cj AND cp -> cr
      if Wire_cj.Defined and Wire_cp.Defined then
         Wire_cr.Defined := True;
         Wire_cr.Value := Wire_cj.Value and Wire_cp.Value;
      end if;
      -- dl AND dn -> do
      if Wire_dl.Defined and Wire_dn.Defined then
         Wire_do.Defined := True;
         Wire_do.Value := Wire_dl.Value and Wire_dn.Value;
      end if;
      -- ci RSHIFT 2 -> cj
      if Wire_ci.Defined and True then
         Wire_cj.Defined := True;
         Wire_cj.Value := Shift_Right (Wire_ci.Value, 2);
      end if;
      -- as OR bd -> be
      if Wire_as.Defined and Wire_bd.Defined then
         Wire_be.Defined := True;
         Wire_be.Value := Wire_as.Value or Wire_bd.Value;
      end if;
      -- ge LSHIFT 15 -> gi
      if Wire_ge.Defined and True then
         Wire_gi.Defined := True;
         Wire_gi.Value := Shift_Left (Wire_ge.Value, 15);
      end if;
      -- hz RSHIFT 5 -> ic
      if Wire_hz.Defined and True then
         Wire_ic.Defined := True;
         Wire_ic.Value := Shift_Right (Wire_hz.Value, 5);
      end if;
      -- dv LSHIFT 1 -> ep
      if Wire_dv.Defined and True then
         Wire_ep.Defined := True;
         Wire_ep.Value := Shift_Left (Wire_dv.Value, 1);
      end if;
      -- kl OR kr -> ks
      if Wire_kl.Defined and Wire_kr.Defined then
         Wire_ks.Defined := True;
         Wire_ks.Value := Wire_kl.Value or Wire_kr.Value;
      end if;
      -- gj OR gu -> gv
      if Wire_gj.Defined and Wire_gu.Defined then
         Wire_gv.Defined := True;
         Wire_gv.Value := Wire_gj.Value or Wire_gu.Value;
      end if;
      -- he RSHIFT 5 -> hh
      if Wire_he.Defined and True then
         Wire_hh.Defined := True;
         Wire_hh.Value := Shift_Right (Wire_he.Value, 5);
      end if;
      -- NOT fg -> fh
      if Wire_fg.Defined then
         Wire_fh.Defined := True;
         Wire_fh.Value := not Wire_fg.Value;
      end if;
      -- hg AND hh -> hj
      if Wire_hg.Defined and Wire_hh.Defined then
         Wire_hj.Defined := True;
         Wire_hj.Value := Wire_hg.Value and Wire_hh.Value;
      end if;
      -- b OR n -> o
      if Wire_b.Defined and Wire_n.Defined then
         Wire_o.Defined := True;
         Wire_o.Value := Wire_b.Value or Wire_n.Value;
      end if;
      -- jk LSHIFT 15 -> jo
      if Wire_jk.Defined and True then
         Wire_jo.Defined := True;
         Wire_jo.Value := Shift_Left (Wire_jk.Value, 15);
      end if;
      -- gz LSHIFT 15 -> hd
      if Wire_gz.Defined and True then
         Wire_hd.Defined := True;
         Wire_hd.Value := Shift_Left (Wire_gz.Value, 15);
      end if;
      -- cy LSHIFT 15 -> dc
      if Wire_cy.Defined and True then
         Wire_dc.Defined := True;
         Wire_dc.Value := Shift_Left (Wire_cy.Value, 15);
      end if;
      -- kk RSHIFT 5 -> kn
      if Wire_kk.Defined and True then
         Wire_kn.Defined := True;
         Wire_kn.Value := Shift_Right (Wire_kk.Value, 5);
      end if;
      -- ci RSHIFT 3 -> ck
      if Wire_ci.Defined and True then
         Wire_ck.Defined := True;
         Wire_ck.Value := Shift_Right (Wire_ci.Value, 3);
      end if;
      -- at OR az -> ba
      if Wire_at.Defined and Wire_az.Defined then
         Wire_ba.Defined := True;
         Wire_ba.Value := Wire_at.Value or Wire_az.Value;
      end if;
      -- iu RSHIFT 3 -> iw
      if Wire_iu.Defined and True then
         Wire_iw.Defined := True;
         Wire_iw.Value := Shift_Right (Wire_iu.Value, 3);
      end if;
      -- ko AND kq -> kr
      if Wire_ko.Defined and Wire_kq.Defined then
         Wire_kr.Defined := True;
         Wire_kr.Value := Wire_ko.Value and Wire_kq.Value;
      end if;
      -- NOT eh -> ei
      if Wire_eh.Defined then
         Wire_ei.Defined := True;
         Wire_ei.Value := not Wire_eh.Value;
      end if;
      -- aq OR ar -> as
      if Wire_aq.Defined and Wire_ar.Defined then
         Wire_as.Defined := True;
         Wire_as.Value := Wire_aq.Value or Wire_ar.Value;
      end if;
      -- iy AND ja -> jb
      if Wire_iy.Defined and Wire_ja.Defined then
         Wire_jb.Defined := True;
         Wire_jb.Value := Wire_iy.Value and Wire_ja.Value;
      end if;
      -- dd RSHIFT 3 -> df
      if Wire_dd.Defined and True then
         Wire_df.Defined := True;
         Wire_df.Value := Shift_Right (Wire_dd.Value, 3);
      end if;
      -- bn RSHIFT 3 -> bp
      if Wire_bn.Defined and True then
         Wire_bp.Defined := True;
         Wire_bp.Value := Shift_Right (Wire_bn.Value, 3);
      end if;
      -- 1 AND cc -> cd
      if True and Wire_cc.Defined then
         Wire_cd.Defined := True;
         Wire_cd.Value := 1 and Wire_cc.Value;
      end if;
      -- at AND az -> bb
      if Wire_at.Defined and Wire_az.Defined then
         Wire_bb.Defined := True;
         Wire_bb.Value := Wire_at.Value and Wire_az.Value;
      end if;
      -- x OR ai -> aj
      if Wire_x.Defined and Wire_ai.Defined then
         Wire_aj.Defined := True;
         Wire_aj.Value := Wire_x.Value or Wire_ai.Value;
      end if;
      -- kk AND kv -> kx
      if Wire_kk.Defined and Wire_kv.Defined then
         Wire_kx.Defined := True;
         Wire_kx.Value := Wire_kk.Value and Wire_kv.Value;
      end if;
      -- ao OR an -> ap
      if Wire_ao.Defined and Wire_an.Defined then
         Wire_ap.Defined := True;
         Wire_ap.Value := Wire_ao.Value or Wire_an.Value;
      end if;
      -- dy RSHIFT 3 -> ea
      if Wire_dy.Defined and True then
         Wire_ea.Defined := True;
         Wire_ea.Value := Shift_Right (Wire_dy.Value, 3);
      end if;
      -- x RSHIFT 1 -> aq
      if Wire_x.Defined and True then
         Wire_aq.Defined := True;
         Wire_aq.Value := Shift_Right (Wire_x.Value, 1);
      end if;
      -- eu AND fa -> fc
      if Wire_eu.Defined and Wire_fa.Defined then
         Wire_fc.Defined := True;
         Wire_fc.Value := Wire_eu.Value and Wire_fa.Value;
      end if;
      -- kl AND kr -> kt
      if Wire_kl.Defined and Wire_kr.Defined then
         Wire_kt.Defined := True;
         Wire_kt.Value := Wire_kl.Value and Wire_kr.Value;
      end if;
      -- ia AND ig -> ii
      if Wire_ia.Defined and Wire_ig.Defined then
         Wire_ii.Defined := True;
         Wire_ii.Value := Wire_ia.Value and Wire_ig.Value;
      end if;
      -- df AND dg -> di
      if Wire_df.Defined and Wire_dg.Defined then
         Wire_di.Defined := True;
         Wire_di.Value := Wire_df.Value and Wire_dg.Value;
      end if;
      -- NOT fx -> fy
      if Wire_fx.Defined then
         Wire_fy.Defined := True;
         Wire_fy.Value := not Wire_fx.Value;
      end if;
      -- k AND m -> n
      if Wire_k.Defined and Wire_m.Defined then
         Wire_n.Defined := True;
         Wire_n.Value := Wire_k.Value and Wire_m.Value;
      end if;
      -- bn RSHIFT 5 -> bq
      if Wire_bn.Defined and True then
         Wire_bq.Defined := True;
         Wire_bq.Value := Shift_Right (Wire_bn.Value, 5);
      end if;
      -- km AND kn -> kp
      if Wire_km.Defined and Wire_kn.Defined then
         Wire_kp.Defined := True;
         Wire_kp.Value := Wire_km.Value and Wire_kn.Value;
      end if;
      -- dt LSHIFT 15 -> dx
      if Wire_dt.Defined and True then
         Wire_dx.Defined := True;
         Wire_dx.Value := Shift_Left (Wire_dt.Value, 15);
      end if;
      -- hz RSHIFT 2 -> ia
      if Wire_hz.Defined and True then
         Wire_ia.Defined := True;
         Wire_ia.Value := Shift_Right (Wire_hz.Value, 2);
      end if;
      -- aj AND al -> am
      if Wire_aj.Defined and Wire_al.Defined then
         Wire_am.Defined := True;
         Wire_am.Value := Wire_aj.Value and Wire_al.Value;
      end if;
      -- cd LSHIFT 15 -> ch
      if Wire_cd.Defined and True then
         Wire_ch.Defined := True;
         Wire_ch.Value := Shift_Left (Wire_cd.Value, 15);
      end if;
      -- hc OR hd -> he
      if Wire_hc.Defined and Wire_hd.Defined then
         Wire_he.Defined := True;
         Wire_he.Value := Wire_hc.Value or Wire_hd.Value;
      end if;
      -- he RSHIFT 3 -> hg
      if Wire_he.Defined and True then
         Wire_hg.Defined := True;
         Wire_hg.Value := Shift_Right (Wire_he.Value, 3);
      end if;
      -- bn OR by -> bz
      if Wire_bn.Defined and Wire_by.Defined then
         Wire_bz.Defined := True;
         Wire_bz.Value := Wire_bn.Value or Wire_by.Value;
      end if;
      -- NOT kt -> ku
      if Wire_kt.Defined then
         Wire_ku.Defined := True;
         Wire_ku.Value := not Wire_kt.Value;
      end if;
      -- z AND aa -> ac
      if Wire_z.Defined and Wire_aa.Defined then
         Wire_ac.Defined := True;
         Wire_ac.Value := Wire_z.Value and Wire_aa.Value;
      end if;
      -- NOT ak -> al
      if Wire_ak.Defined then
         Wire_al.Defined := True;
         Wire_al.Value := not Wire_ak.Value;
      end if;
      -- cu AND cw -> cx
      if Wire_cu.Defined and Wire_cw.Defined then
         Wire_cx.Defined := True;
         Wire_cx.Value := Wire_cu.Value and Wire_cw.Value;
      end if;
      -- NOT ie -> if
      if Wire_ie.Defined then
         Wire_if.Defined := True;
         Wire_if.Value := not Wire_ie.Value;
      end if;
      -- dy RSHIFT 2 -> dz
      if Wire_dy.Defined and True then
         Wire_dz.Defined := True;
         Wire_dz.Value := Shift_Right (Wire_dy.Value, 2);
      end if;
      -- ip LSHIFT 15 -> it
      if Wire_ip.Defined and True then
         Wire_it.Defined := True;
         Wire_it.Value := Shift_Left (Wire_ip.Value, 15);
      end if;
      -- de OR dk -> dl
      if Wire_de.Defined and Wire_dk.Defined then
         Wire_dl.Defined := True;
         Wire_dl.Value := Wire_de.Value or Wire_dk.Value;
      end if;
      -- au OR av -> aw
      if Wire_au.Defined and Wire_av.Defined then
         Wire_aw.Defined := True;
         Wire_aw.Value := Wire_au.Value or Wire_av.Value;
      end if;
      -- jg AND ji -> jj
      if Wire_jg.Defined and Wire_ji.Defined then
         Wire_jj.Defined := True;
         Wire_jj.Value := Wire_jg.Value and Wire_ji.Value;
      end if;
      -- ci AND ct -> cv
      if Wire_ci.Defined and Wire_ct.Defined then
         Wire_cv.Defined := True;
         Wire_cv.Value := Wire_ci.Value and Wire_ct.Value;
      end if;
      -- dy RSHIFT 5 -> eb
      if Wire_dy.Defined and True then
         Wire_eb.Defined := True;
         Wire_eb.Value := Shift_Right (Wire_dy.Value, 5);
      end if;
      -- hx OR hy -> hz
      if Wire_hx.Defined and Wire_hy.Defined then
         Wire_hz.Defined := True;
         Wire_hz.Value := Wire_hx.Value or Wire_hy.Value;
      end if;
      -- eu OR fa -> fb
      if Wire_eu.Defined and Wire_fa.Defined then
         Wire_fb.Defined := True;
         Wire_fb.Value := Wire_eu.Value or Wire_fa.Value;
      end if;
      -- gj RSHIFT 3 -> gl
      if Wire_gj.Defined and True then
         Wire_gl.Defined := True;
         Wire_gl.Value := Shift_Right (Wire_gj.Value, 3);
      end if;
      -- fo AND fz -> gb
      if Wire_fo.Defined and Wire_fz.Defined then
         Wire_gb.Defined := True;
         Wire_gb.Value := Wire_fo.Value and Wire_fz.Value;
      end if;
      -- 1 AND jj -> jk
      if True and Wire_jj.Defined then
         Wire_jk.Defined := True;
         Wire_jk.Value := 1 and Wire_jj.Value;
      end if;
      -- jp OR ka -> kb
      if Wire_jp.Defined and Wire_ka.Defined then
         Wire_kb.Defined := True;
         Wire_kb.Value := Wire_jp.Value or Wire_ka.Value;
      end if;
      -- de AND dk -> dm
      if Wire_de.Defined and Wire_dk.Defined then
         Wire_dm.Defined := True;
         Wire_dm.Value := Wire_de.Value and Wire_dk.Value;
      end if;
      -- ex AND ez -> fa
      if Wire_ex.Defined and Wire_ez.Defined then
         Wire_fa.Defined := True;
         Wire_fa.Value := Wire_ex.Value and Wire_ez.Value;
      end if;
      -- df OR dg -> dh
      if Wire_df.Defined and Wire_dg.Defined then
         Wire_dh.Defined := True;
         Wire_dh.Value := Wire_df.Value or Wire_dg.Value;
      end if;
      -- iv OR jb -> jc
      if Wire_iv.Defined and Wire_jb.Defined then
         Wire_jc.Defined := True;
         Wire_jc.Value := Wire_iv.Value or Wire_jb.Value;
      end if;
      -- x RSHIFT 5 -> aa
      if Wire_x.Defined and True then
         Wire_aa.Defined := True;
         Wire_aa.Value := Shift_Right (Wire_x.Value, 5);
      end if;
      -- NOT hj -> hk
      if Wire_hj.Defined then
         Wire_hk.Defined := True;
         Wire_hk.Value := not Wire_hj.Value;
      end if;
      -- NOT im -> in
      if Wire_im.Defined then
         Wire_in.Defined := True;
         Wire_in.Value := not Wire_im.Value;
      end if;
      -- fl LSHIFT 1 -> gf
      if Wire_fl.Defined and True then
         Wire_gf.Defined := True;
         Wire_gf.Value := Shift_Left (Wire_fl.Value, 1);
      end if;
      -- hu LSHIFT 15 -> hy
      if Wire_hu.Defined and True then
         Wire_hy.Defined := True;
         Wire_hy.Value := Shift_Left (Wire_hu.Value, 15);
      end if;
      -- iq OR ip -> ir
      if Wire_iq.Defined and Wire_ip.Defined then
         Wire_ir.Defined := True;
         Wire_ir.Value := Wire_iq.Value or Wire_ip.Value;
      end if;
      -- iu RSHIFT 5 -> ix
      if Wire_iu.Defined and True then
         Wire_ix.Defined := True;
         Wire_ix.Value := Shift_Right (Wire_iu.Value, 5);
      end if;
      -- NOT fc -> fd
      if Wire_fc.Defined then
         Wire_fd.Defined := True;
         Wire_fd.Value := not Wire_fc.Value;
      end if;
      -- NOT el -> em
      if Wire_el.Defined then
         Wire_em.Defined := True;
         Wire_em.Value := not Wire_el.Value;
      end if;
      -- ck OR cl -> cm
      if Wire_ck.Defined and Wire_cl.Defined then
         Wire_cm.Defined := True;
         Wire_cm.Value := Wire_ck.Value or Wire_cl.Value;
      end if;
      -- et RSHIFT 3 -> ev
      if Wire_et.Defined and True then
         Wire_ev.Defined := True;
         Wire_ev.Value := Shift_Right (Wire_et.Value, 3);
      end if;
      -- hw LSHIFT 1 -> iq
      if Wire_hw.Defined and True then
         Wire_iq.Defined := True;
         Wire_iq.Value := Shift_Left (Wire_hw.Value, 1);
      end if;
      -- ci RSHIFT 5 -> cl
      if Wire_ci.Defined and True then
         Wire_cl.Defined := True;
         Wire_cl.Value := Shift_Right (Wire_ci.Value, 5);
      end if;
      -- iv AND jb -> jd
      if Wire_iv.Defined and Wire_jb.Defined then
         Wire_jd.Defined := True;
         Wire_jd.Value := Wire_iv.Value and Wire_jb.Value;
      end if;
      -- dd RSHIFT 5 -> dg
      if Wire_dd.Defined and True then
         Wire_dg.Defined := True;
         Wire_dg.Value := Shift_Right (Wire_dd.Value, 5);
      end if;
      -- as RSHIFT 2 -> at
      if Wire_as.Defined and True then
         Wire_at.Defined := True;
         Wire_at.Value := Shift_Right (Wire_as.Value, 2);
      end if;
      -- NOT jy -> jz
      if Wire_jy.Defined then
         Wire_jz.Defined := True;
         Wire_jz.Value := not Wire_jy.Value;
      end if;
      -- af AND ah -> ai
      if Wire_af.Defined and Wire_ah.Defined then
         Wire_ai.Defined := True;
         Wire_ai.Value := Wire_af.Value and Wire_ah.Value;
      end if;
      -- 1 AND ds -> dt
      if True and Wire_ds.Defined then
         Wire_dt.Defined := True;
         Wire_dt.Value := 1 and Wire_ds.Value;
      end if;
      -- jx AND jz -> ka
      if Wire_jx.Defined and Wire_jz.Defined then
         Wire_ka.Defined := True;
         Wire_ka.Value := Wire_jx.Value and Wire_jz.Value;
      end if;
      -- da LSHIFT 1 -> du
      if Wire_da.Defined and True then
         Wire_du.Defined := True;
         Wire_du.Value := Shift_Left (Wire_da.Value, 1);
      end if;
      -- fs AND fu -> fv
      if Wire_fs.Defined and Wire_fu.Defined then
         Wire_fv.Defined := True;
         Wire_fv.Value := Wire_fs.Value and Wire_fu.Value;
      end if;
      -- jp RSHIFT 1 -> ki
      if Wire_jp.Defined and True then
         Wire_ki.Defined := True;
         Wire_ki.Value := Shift_Right (Wire_jp.Value, 1);
      end if;
      -- iw AND ix -> iz
      if Wire_iw.Defined and Wire_ix.Defined then
         Wire_iz.Defined := True;
         Wire_iz.Value := Wire_iw.Value and Wire_ix.Value;
      end if;
      -- iw OR ix -> iy
      if Wire_iw.Defined and Wire_ix.Defined then
         Wire_iy.Defined := True;
         Wire_iy.Value := Wire_iw.Value or Wire_ix.Value;
      end if;
      -- eo LSHIFT 15 -> es
      if Wire_eo.Defined and True then
         Wire_es.Defined := True;
         Wire_es.Value := Shift_Left (Wire_eo.Value, 15);
      end if;
      -- ev AND ew -> ey
      if Wire_ev.Defined and Wire_ew.Defined then
         Wire_ey.Defined := True;
         Wire_ey.Value := Wire_ev.Value and Wire_ew.Value;
      end if;
      -- ba AND bc -> bd
      if Wire_ba.Defined and Wire_bc.Defined then
         Wire_bd.Defined := True;
         Wire_bd.Value := Wire_ba.Value and Wire_bc.Value;
      end if;
      -- fp AND fv -> fx
      if Wire_fp.Defined and Wire_fv.Defined then
         Wire_fx.Defined := True;
         Wire_fx.Value := Wire_fp.Value and Wire_fv.Value;
      end if;
      -- jc AND je -> jf
      if Wire_jc.Defined and Wire_je.Defined then
         Wire_jf.Defined := True;
         Wire_jf.Value := Wire_jc.Value and Wire_je.Value;
      end if;
      -- et RSHIFT 2 -> eu
      if Wire_et.Defined and True then
         Wire_eu.Defined := True;
         Wire_eu.Value := Shift_Right (Wire_et.Value, 2);
      end if;
      -- kg OR kf -> kh
      if Wire_kg.Defined and Wire_kf.Defined then
         Wire_kh.Defined := True;
         Wire_kh.Value := Wire_kg.Value or Wire_kf.Value;
      end if;
      -- iu OR jf -> jg
      if Wire_iu.Defined and Wire_jf.Defined then
         Wire_jg.Defined := True;
         Wire_jg.Value := Wire_iu.Value or Wire_jf.Value;
      end if;
      -- er OR es -> et
      if Wire_er.Defined and Wire_es.Defined then
         Wire_et.Defined := True;
         Wire_et.Value := Wire_er.Value or Wire_es.Value;
      end if;
      -- fo RSHIFT 2 -> fp
      if Wire_fo.Defined and True then
         Wire_fp.Defined := True;
         Wire_fp.Value := Shift_Right (Wire_fo.Value, 2);
      end if;
      -- NOT ca -> cb
      if Wire_ca.Defined then
         Wire_cb.Defined := True;
         Wire_cb.Value := not Wire_ca.Value;
      end if;
      -- bv AND bx -> by
      if Wire_bv.Defined and Wire_bx.Defined then
         Wire_by.Defined := True;
         Wire_by.Value := Wire_bv.Value and Wire_bx.Value;
      end if;
      -- u LSHIFT 1 -> ao
      if Wire_u.Defined and True then
         Wire_ao.Defined := True;
         Wire_ao.Value := Shift_Left (Wire_u.Value, 1);
      end if;
      -- cm AND co -> cp
      if Wire_cm.Defined and Wire_co.Defined then
         Wire_cp.Defined := True;
         Wire_cp.Value := Wire_cm.Value and Wire_co.Value;
      end if;
      -- y OR ae -> af
      if Wire_y.Defined and Wire_ae.Defined then
         Wire_af.Defined := True;
         Wire_af.Value := Wire_y.Value or Wire_ae.Value;
      end if;
      -- bn AND by -> ca
      if Wire_bn.Defined and Wire_by.Defined then
         Wire_ca.Defined := True;
         Wire_ca.Value := Wire_bn.Value and Wire_by.Value;
      end if;
      -- 1 AND ke -> kf
      if True and Wire_ke.Defined then
         Wire_kf.Defined := True;
         Wire_kf.Value := 1 and Wire_ke.Value;
      end if;
      -- jt AND jv -> jw
      if Wire_jt.Defined and Wire_jv.Defined then
         Wire_jw.Defined := True;
         Wire_jw.Value := Wire_jt.Value and Wire_jv.Value;
      end if;
      -- fq OR fr -> fs
      if Wire_fq.Defined and Wire_fr.Defined then
         Wire_fs.Defined := True;
         Wire_fs.Value := Wire_fq.Value or Wire_fr.Value;
      end if;
      -- dy AND ej -> el
      if Wire_dy.Defined and Wire_ej.Defined then
         Wire_el.Defined := True;
         Wire_el.Value := Wire_dy.Value and Wire_ej.Value;
      end if;
      -- NOT kc -> kd
      if Wire_kc.Defined then
         Wire_kd.Defined := True;
         Wire_kd.Value := not Wire_kc.Value;
      end if;
      -- ev OR ew -> ex
      if Wire_ev.Defined and Wire_ew.Defined then
         Wire_ex.Defined := True;
         Wire_ex.Value := Wire_ev.Value or Wire_ew.Value;
      end if;
      -- dd OR do -> dp
      if Wire_dd.Defined and Wire_do.Defined then
         Wire_dp.Defined := True;
         Wire_dp.Value := Wire_dd.Value or Wire_do.Value;
      end if;
      -- NOT cv -> cw
      if Wire_cv.Defined then
         Wire_cw.Defined := True;
         Wire_cw.Value := not Wire_cv.Value;
      end if;
      -- gr AND gt -> gu
      if Wire_gr.Defined and Wire_gt.Defined then
         Wire_gu.Defined := True;
         Wire_gu.Value := Wire_gr.Value and Wire_gt.Value;
      end if;
      -- dd RSHIFT 1 -> dw
      if Wire_dd.Defined and True then
         Wire_dw.Defined := True;
         Wire_dw.Value := Shift_Right (Wire_dd.Value, 1);
      end if;
      -- NOT gw -> gx
      if Wire_gw.Defined then
         Wire_gx.Defined := True;
         Wire_gx.Value := not Wire_gw.Value;
      end if;
      -- NOT iz -> ja
      if Wire_iz.Defined then
         Wire_ja.Defined := True;
         Wire_ja.Value := not Wire_iz.Value;
      end if;
      -- 1 AND io -> ip
      if True and Wire_io.Defined then
         Wire_ip.Defined := True;
         Wire_ip.Value := 1 and Wire_io.Value;
      end if;
      -- NOT ag -> ah
      if Wire_ag.Defined then
         Wire_ah.Defined := True;
         Wire_ah.Value := not Wire_ag.Value;
      end if;
      -- b RSHIFT 5 -> f
      if Wire_b.Defined and True then
         Wire_f.Defined := True;
         Wire_f.Value := Shift_Right (Wire_b.Value, 5);
      end if;
      -- NOT cr -> cs
      if Wire_cr.Defined then
         Wire_cs.Defined := True;
         Wire_cs.Value := not Wire_cr.Value;
      end if;
      -- kb AND kd -> ke
      if Wire_kb.Defined and Wire_kd.Defined then
         Wire_ke.Defined := True;
         Wire_ke.Value := Wire_kb.Value and Wire_kd.Value;
      end if;
      -- jr AND js -> ju
      if Wire_jr.Defined and Wire_js.Defined then
         Wire_ju.Defined := True;
         Wire_ju.Value := Wire_jr.Value and Wire_js.Value;
      end if;
      -- cq AND cs -> ct
      if Wire_cq.Defined and Wire_cs.Defined then
         Wire_ct.Defined := True;
         Wire_ct.Value := Wire_cq.Value and Wire_cs.Value;
      end if;
      -- il AND in -> io
      if Wire_il.Defined and Wire_in.Defined then
         Wire_io.Defined := True;
         Wire_io.Value := Wire_il.Value and Wire_in.Value;
      end if;
      -- NOT ju -> jv
      if Wire_ju.Defined then
         Wire_jv.Defined := True;
         Wire_jv.Value := not Wire_ju.Value;
      end if;
      -- du OR dt -> dv
      if Wire_du.Defined and Wire_dt.Defined then
         Wire_dv.Defined := True;
         Wire_dv.Value := Wire_du.Value or Wire_dt.Value;
      end if;
      -- dd AND do -> dq
      if Wire_dd.Defined and Wire_do.Defined then
         Wire_dq.Defined := True;
         Wire_dq.Value := Wire_dd.Value and Wire_do.Value;
      end if;
      -- b RSHIFT 2 -> d
      if Wire_b.Defined and True then
         Wire_d.Defined := True;
         Wire_d.Value := Shift_Right (Wire_b.Value, 2);
      end if;
      -- jm LSHIFT 1 -> kg
      if Wire_jm.Defined and True then
         Wire_kg.Defined := True;
         Wire_kg.Value := Shift_Left (Wire_jm.Value, 1);
      end if;
      -- NOT dq -> dr
      if Wire_dq.Defined then
         Wire_dr.Defined := True;
         Wire_dr.Value := not Wire_dq.Value;
      end if;
      -- bo OR bu -> bv
      if Wire_bo.Defined and Wire_bu.Defined then
         Wire_bv.Defined := True;
         Wire_bv.Value := Wire_bo.Value or Wire_bu.Value;
      end if;
      -- gk OR gq -> gr
      if Wire_gk.Defined and Wire_gq.Defined then
         Wire_gr.Defined := True;
         Wire_gr.Value := Wire_gk.Value or Wire_gq.Value;
      end if;
      -- he OR hp -> hq
      if Wire_he.Defined and Wire_hp.Defined then
         Wire_hq.Defined := True;
         Wire_hq.Value := Wire_he.Value or Wire_hp.Value;
      end if;
      -- NOT h -> i
      if Wire_h.Defined then
         Wire_i.Defined := True;
         Wire_i.Value := not Wire_h.Value;
      end if;
      -- hf AND hl -> hn
      if Wire_hf.Defined and Wire_hl.Defined then
         Wire_hn.Defined := True;
         Wire_hn.Value := Wire_hf.Value and Wire_hl.Value;
      end if;
      -- gv AND gx -> gy
      if Wire_gv.Defined and Wire_gx.Defined then
         Wire_gy.Defined := True;
         Wire_gy.Value := Wire_gv.Value and Wire_gx.Value;
      end if;
      -- x AND ai -> ak
      if Wire_x.Defined and Wire_ai.Defined then
         Wire_ak.Defined := True;
         Wire_ak.Value := Wire_x.Value and Wire_ai.Value;
      end if;
      -- bo AND bu -> bw
      if Wire_bo.Defined and Wire_bu.Defined then
         Wire_bw.Defined := True;
         Wire_bw.Value := Wire_bo.Value and Wire_bu.Value;
      end if;
      -- hq AND hs -> ht
      if Wire_hq.Defined and Wire_hs.Defined then
         Wire_ht.Defined := True;
         Wire_ht.Value := Wire_hq.Value and Wire_hs.Value;
      end if;
      -- hz RSHIFT 1 -> is
      if Wire_hz.Defined and True then
         Wire_is.Defined := True;
         Wire_is.Value := Shift_Right (Wire_hz.Value, 1);
      end if;
      -- gj RSHIFT 5 -> gm
      if Wire_gj.Defined and True then
         Wire_gm.Defined := True;
         Wire_gm.Value := Shift_Right (Wire_gj.Value, 5);
      end if;
      -- g AND i -> j
      if Wire_g.Defined and Wire_i.Defined then
         Wire_j.Defined := True;
         Wire_j.Value := Wire_g.Value and Wire_i.Value;
      end if;
      -- gk AND gq -> gs
      if Wire_gk.Defined and Wire_gq.Defined then
         Wire_gs.Defined := True;
         Wire_gs.Value := Wire_gk.Value and Wire_gq.Value;
      end if;
      -- dp AND dr -> ds
      if Wire_dp.Defined and Wire_dr.Defined then
         Wire_ds.Defined := True;
         Wire_ds.Value := Wire_dp.Value and Wire_dr.Value;
      end if;
      -- b RSHIFT 3 -> e
      if Wire_b.Defined and True then
         Wire_e.Defined := True;
         Wire_e.Value := Shift_Right (Wire_b.Value, 3);
      end if;
      -- gl AND gm -> go
      if Wire_gl.Defined and Wire_gm.Defined then
         Wire_go.Defined := True;
         Wire_go.Value := Wire_gl.Value and Wire_gm.Value;
      end if;
      -- gl OR gm -> gn
      if Wire_gl.Defined and Wire_gm.Defined then
         Wire_gn.Defined := True;
         Wire_gn.Value := Wire_gl.Value or Wire_gm.Value;
      end if;
      -- y AND ae -> ag
      if Wire_y.Defined and Wire_ae.Defined then
         Wire_ag.Defined := True;
         Wire_ag.Value := Wire_y.Value and Wire_ae.Value;
      end if;
      -- hv OR hu -> hw
      if Wire_hv.Defined and Wire_hu.Defined then
         Wire_hw.Defined := True;
         Wire_hw.Value := Wire_hv.Value or Wire_hu.Value;
      end if;
      -- 1674 -> b
      if True then
         Wire_b.Defined := True;
         Wire_b.Value := 1674;
      end if;
      -- ab AND ad -> ae
      if Wire_ab.Defined and Wire_ad.Defined then
         Wire_ae.Defined := True;
         Wire_ae.Value := Wire_ab.Value and Wire_ad.Value;
      end if;
      -- NOT ac -> ad
      if Wire_ac.Defined then
         Wire_ad.Defined := True;
         Wire_ad.Value := not Wire_ac.Value;
      end if;
      -- 1 AND ht -> hu
      if True and Wire_ht.Defined then
         Wire_hu.Defined := True;
         Wire_hu.Value := 1 and Wire_ht.Value;
      end if;
      -- NOT hn -> ho
      if Wire_hn.Defined then
         Wire_ho.Defined := True;
         Wire_ho.Value := not Wire_hn.Value;
      end if;
   end loop; -- I in Positive range 1 .. 1000
   Put_Line ("a:" & Unsigned_16'Image (Wire_a.Value));
end Solution_07;
