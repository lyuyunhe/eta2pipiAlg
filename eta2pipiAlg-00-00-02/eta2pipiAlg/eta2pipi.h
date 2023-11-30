#ifndef Physics_Analysis_eta2pipi_H
#define Physics_Analysis_eta2pipi_H

#include "GaudiKernel/AlgFactory.h"
#include "GaudiKernel/Algorithm.h"
#include "GaudiKernel/NTuple.h"
#include "GaudiKernel/ITHistSvc.h"
#include "EvtRecEvent/EvtRecEvent.h"
#include "EvtRecEvent/EvtRecTrack.h"
#include "TH1.h"

//#include "VertexFit/ReadBeamParFromDb.h"

typedef std::vector<int> Vint;
typedef std::vector<HepLorentzVector> Vp4;

class eta2pipi : public Algorithm {

public:
  eta2pipi(const std::string &name, ISvcLocator *pSvcLocator);
  StatusCode initialize();
  StatusCode execute();
  StatusCode finalize();

private:
  // entNO,runNO
  int nevt;
  int nrun;
  // ReadBeamParFromDb m_reader;
  // Declare r0, z0 cut for charged tracks
  double m_vr0cut;
  double m_vz0cut;
  double m_chisq_4c_cut;
  double m_mgpippim_cut;
  // Declare energy, dphi, dthe cuts for fake gamma's

  //
  int m_test4C;
  int m_test5C;
  
  int m_debug;

  //
  int m_checkDedx;
  int m_checkTof;

  // define Ntuples here
  // 1)McTruth
  NTuple::Tuple *m_mcTuple;
  NTuple::Item<int> m_idxmc;
  NTuple::Array<int> m_trkidx;
  NTuple::Array<int> m_pdgid;
  NTuple::Array<int> m_motherpdgid;
  NTuple::Array<int> m_motheridx;
  NTuple::Item<double> n_jpsi_mom;
  NTuple::Item<double> n_jpsi_cos;
  NTuple::Item<double> n_gam1_mom;
  NTuple::Item<double> n_gam1_cos;
  NTuple::Item<double> n_eta_mom;
  NTuple::Item<double> n_eta_cos;
  NTuple::Item<double> n_gam2_mom;
  NTuple::Item<double> n_gam2_cos;
  NTuple::Item<double> n_pip_mom;
  NTuple::Item<double> n_pip_cos;
  NTuple::Item<double> n_pim_mom;
  NTuple::Item<double> n_pim_cos;

  // ana
  // 2)Analysis
  NTuple::Tuple *m_anaTuple;
  NTuple::Item<int> m_jpsi_pdgid;
  NTuple::Item<double> m_jpsi_mom;
  NTuple::Item<double> m_jpsi_cos;
  NTuple::Item<double> m_gam1_mom;
  NTuple::Item<double> m_gam1_cos;
  NTuple::Item<double> m_eta_mom;
  NTuple::Item<double> m_eta_cos;
  NTuple::Item<double> m_gam2_mom;
  NTuple::Item<double> m_gam2_cos;
  NTuple::Item<double> m_pip_mom;
  NTuple::Item<double> m_pip_cos;
  NTuple::Item<double> m_pim_mom;
  NTuple::Item<double> m_pim_cos;

  NTuple::Item<int> m_nGam;
  NTuple::Array<double> m_dthe;
  NTuple::Array<double> m_dphi;
  NTuple::Array<double> m_dang;
  NTuple::Array<double> m_eraw;
  NTuple::Array<double> m_phi;
  NTuple::Array<double> m_theta;

  NTuple::Item<double> e_jpsi_mom;
  NTuple::Item<double> px_jpsi_mom;
  NTuple::Item<double> py_jpsi_mom;
  NTuple::Item<double> pz_jpsi_mom;

  NTuple::Item<int> m_gam1_pdgid;
  NTuple::Item<double> e_gam1_mom;
  NTuple::Item<double> px_gam1_mom;
  NTuple::Item<double> py_gam1_mom;
  NTuple::Item<double> pz_gam1_mom;

  NTuple::Item<int> m_eta_pdgid;
  NTuple::Item<double> e_eta_mom;
  NTuple::Item<double> px_eta_mom;
  NTuple::Item<double> py_eta_mom;
  NTuple::Item<double> pz_eta_mom;

  NTuple::Item<int> m_gam2_pdgid;
  NTuple::Item<double> e_gam2_mom;
  NTuple::Item<double> px_gam2_mom;
  NTuple::Item<double> py_gam2_mom;
  NTuple::Item<double> pz_gam2_mom;

  NTuple::Item<int> m_pip_pdgid;
  NTuple::Item<double> e_pip_mom;
  NTuple::Item<double> px_pip_mom;
  NTuple::Item<double> py_pip_mom;
  NTuple::Item<double> pz_pip_mom;

  NTuple::Item<int> m_pim_pdgid;
  NTuple::Item<double> e_pim_mom;
  NTuple::Item<double> px_pim_mom;
  NTuple::Item<double> py_pim_mom;
  NTuple::Item<double> pz_pim_mom;

  // kmfit4C lab  Info.
  NTuple::Item<int> m_kmfit_Jpsigam_index;
  NTuple::Item<int> m_kmfit_Etagam_index;
  NTuple::Item<double> m_kmfit_Jpsigam_eraw;
  NTuple::Item<double> m_kmfit_Etagam_eraw;
  
  NTuple::Item<double> m_kmfit_lab_pip_e;
  NTuple::Item<double> m_kmfit_lab_pip_px;
  NTuple::Item<double> m_kmfit_lab_pip_py;
  NTuple::Item<double> m_kmfit_lab_pip_pz;
  NTuple::Item<double> m_kmfit_lab_pip_mom;

  NTuple::Item<double> m_kmfit_lab_pim_e;
  NTuple::Item<double> m_kmfit_lab_pim_px;
  NTuple::Item<double> m_kmfit_lab_pim_py;
  NTuple::Item<double> m_kmfit_lab_pim_pz;
  NTuple::Item<double> m_kmfit_lab_pim_mom;

  NTuple::Item<double> m_kmfit_lab_Etagam_e;
  NTuple::Item<double> m_kmfit_lab_Etagam_px;
  NTuple::Item<double> m_kmfit_lab_Etagam_py;
  NTuple::Item<double> m_kmfit_lab_Etagam_pz;
  NTuple::Item<double> m_kmfit_lab_Etagam_mom;

  NTuple::Item<double> m_kmfit_lab_Jpsigam_e;
  NTuple::Item<double> m_kmfit_lab_Jpsigam_px;
  NTuple::Item<double> m_kmfit_lab_Jpsigam_py;
  NTuple::Item<double> m_kmfit_lab_Jpsigam_pz;
  NTuple::Item<double> m_kmfit_lab_Jpsigam_mom;

  // kmfit cms Info.
  NTuple::Item<double> m_kmfit_cms_pim_e;
  NTuple::Item<double> m_kmfit_cms_pim_px;
  NTuple::Item<double> m_kmfit_cms_pim_py;
  NTuple::Item<double> m_kmfit_cms_pim_pz;
  NTuple::Item<double> m_kmfit_cms_pim_mom;
  NTuple::Item<double> m_kmfit_cms_pip_e;
  NTuple::Item<double> m_kmfit_cms_pip_px;
  NTuple::Item<double> m_kmfit_cms_pip_py;
  NTuple::Item<double> m_kmfit_cms_pip_pz;
  NTuple::Item<double> m_kmfit_cms_pip_mom;
  NTuple::Item<double> m_kmfit_cms_Etagam_e;
  NTuple::Item<double> m_kmfit_cms_Etagam_px;
  NTuple::Item<double> m_kmfit_cms_Etagam_py;
  NTuple::Item<double> m_kmfit_cms_Etagam_pz;
  NTuple::Item<double> m_kmfit_cms_Etagam_mom;
  // Inv.Masses[kmfit]
  NTuple::Item<double> m_kmfit_mg1pippim;
  NTuple::Item<double> m_kmfit_mg2pippim;
  NTuple::Item<double> m_kmfit_mpippim;
  NTuple::Item<double> m_kmfit_mEtagampippim;
  NTuple::Item<double> m_kmfit_mgg;

  NTuple::Item<double> m_kmfit_chi2_ggpippim;
  NTuple::Item<double> m_kmfit_chi2_threegampippim;
  NTuple::Item<double> m_ene_g1;
  NTuple::Item<double> m_ene_g2;


  NTuple::Item<int> m_nGood;
  NTuple::Array<double> m_ptrk;
  NTuple::Array<double> m_chie;
  NTuple::Array<double> m_chimu;
  NTuple::Array<double> m_chipi;
  NTuple::Array<double> m_chik;
  NTuple::Array<double> m_chip;
  NTuple::Array<double> m_probPH;
  NTuple::Array<double> m_normPH;
  NTuple::Array<double> m_ghit;
  NTuple::Array<double> m_thit;

  NTuple::Array<int> m_nHits_btof1;
  NTuple::Array<int> m_nHits_btof2;
  NTuple::Array<int> m_nHits_etof;

  NTuple::Array<double> m_ptot_etof;
  NTuple::Array<double> m_cntr_etof;
  NTuple::Array<double> m_te_etof;
  NTuple::Array<double> m_tmu_etof;
  NTuple::Array<double> m_tpi_etof;
  NTuple::Array<double> m_tk_etof;
  NTuple::Array<double> m_tp_etof;
  NTuple::Array<double> m_ph_etof;
  NTuple::Array<double> m_rhit_etof;
  NTuple::Array<double> m_qual_etof;

  NTuple::Array<double> m_ptot_btof1;
  NTuple::Array<double> m_cntr_btof1;
  NTuple::Array<double> m_te_btof1;
  NTuple::Array<double> m_tmu_btof1;
  NTuple::Array<double> m_tpi_btof1;
  NTuple::Array<double> m_tk_btof1;
  NTuple::Array<double> m_tp_btof1;
  NTuple::Array<double> m_ph_btof1;
  NTuple::Array<double> m_zhit_btof1;
  NTuple::Array<double> m_qual_btof1;

  NTuple::Array<double> m_ptot_btof2;
  NTuple::Array<double> m_cntr_btof2;
  NTuple::Array<double> m_te_btof2;
  NTuple::Array<double> m_tmu_btof2;
  NTuple::Array<double> m_tpi_btof2;
  NTuple::Array<double> m_tk_btof2;
  NTuple::Array<double> m_tp_btof2;
  NTuple::Array<double> m_ph_btof2;
  NTuple::Array<double> m_zhit_btof2;
  NTuple::Array<double> m_qual_btof2;

  NTuple::Item<int> m_pip_index;
  NTuple::Item<int> m_pim_index;
  NTuple::Item<bool> m_pip_pi_pid;
  NTuple::Item<bool> m_pim_pi_pid;
  NTuple::Array<double> m_ptrk_pid;
  NTuple::Array<double> m_cost_pid;
  NTuple::Array<double> m_dedx_pid;
  NTuple::Array<double> m_tof1_pid;
  NTuple::Array<double> m_tof2_pid;
  NTuple::Array<double> m_prob_pi_pid;
  NTuple::Array<double> m_prob_e_pid;
  NTuple::Array<double> m_prob_mu_pid;
  NTuple::Array<bool> m_pi_pid;
  // More information about pip, pim 
  NTuple::Item<double> m_pip_kalTrk_px;
  NTuple::Item<double> m_pip_kalTrk_py;
  NTuple::Item<double> m_pip_kalTrk_pz;
  NTuple::Item<double> m_pip_kalTrk_e;
  NTuple::Item<double> m_pip_kalTrk_mom;
  NTuple::Item<double> m_pip_emc_e;
  NTuple::Item<double> m_pip_emc_theta;
  NTuple::Item<double> m_pip_emc_phi;
  NTuple::Item<double> m_pip_epratio;
  NTuple::Item<double> m_pip_muc_layers;
  NTuple::Item<double> m_pip_muc_hits;
  NTuple::Item<double> m_pip_muc_dep;
  
  NTuple::Item<double> m_pim_kalTrk_px;
  NTuple::Item<double> m_pim_kalTrk_py;
  NTuple::Item<double> m_pim_kalTrk_pz;
  NTuple::Item<double> m_pim_kalTrk_e;
  NTuple::Item<double> m_pim_kalTrk_mom;
  NTuple::Item<double> m_pim_emc_e;
  NTuple::Item<double> m_pim_emc_theta;
  NTuple::Item<double> m_pim_emc_phi;
  NTuple::Item<double> m_pim_epratio;
  NTuple::Item<double> m_pim_muc_layers;
  NTuple::Item<double> m_pim_muc_hits;
  NTuple::Item<double> m_pim_muc_dep;

  // after5C, Inv.Masses
  NTuple::Item<int> m_kmfit5C_Jpsigam_index;
  NTuple::Item<int> m_kmfit5C_Etagam_index;
  NTuple::Item<double> m_kmfit5C_Jpsigam_eraw;
  NTuple::Item<double> m_kmfit5C_Etagam_eraw;

  NTuple::Item<double> m_kmfit5C_chi2;
  NTuple::Item<double> m_kmfit5C_mEtagampippim;
  NTuple::Item<double> m_kmfit5C_mgam1pippim;
  NTuple::Item<double> m_kmfit5C_mpippim;
  NTuple::Item<double> m_kmfit5C_mgg;
  // kmfit5C four lab mom
  NTuple::Item<double> m_kmfit5C_lab_pip_e;
  NTuple::Item<double> m_kmfit5C_lab_pip_px;
  NTuple::Item<double> m_kmfit5C_lab_pip_py;
  NTuple::Item<double> m_kmfit5C_lab_pip_pz;
  NTuple::Item<double> m_kmfit5C_lab_pip_mom;

  NTuple::Item<double> m_kmfit5C_lab_pim_e;
  NTuple::Item<double> m_kmfit5C_lab_pim_px;
  NTuple::Item<double> m_kmfit5C_lab_pim_py;
  NTuple::Item<double> m_kmfit5C_lab_pim_pz;
  NTuple::Item<double> m_kmfit5C_lab_pim_mom;

  NTuple::Item<double> m_kmfit5C_lab_Etagam_e;
  NTuple::Item<double> m_kmfit5C_lab_Etagam_px;
  NTuple::Item<double> m_kmfit5C_lab_Etagam_py;
  NTuple::Item<double> m_kmfit5C_lab_Etagam_pz;
  NTuple::Item<double> m_kmfit5C_lab_Etagam_mom;

  NTuple::Item<double> m_kmfit5C_lab_Jpsigam_e;
  NTuple::Item<double> m_kmfit5C_lab_Jpsigam_px;
  NTuple::Item<double> m_kmfit5C_lab_Jpsigam_py;
  NTuple::Item<double> m_kmfit5C_lab_Jpsigam_pz;
  NTuple::Item<double> m_kmfit5C_lab_Jpsigam_mom;
  // kmfit5C cms mom

  NTuple::Item<double> m_kmfit5C_cms_pip_e;
  NTuple::Item<double> m_kmfit5C_cms_pip_px;
  NTuple::Item<double> m_kmfit5C_cms_pip_py;
  NTuple::Item<double> m_kmfit5C_cms_pip_pz;
  NTuple::Item<double> m_kmfit5C_cms_pip_mom;

  NTuple::Item<double> m_kmfit5C_cms_pim_e;
  NTuple::Item<double> m_kmfit5C_cms_pim_px;
  NTuple::Item<double> m_kmfit5C_cms_pim_py;
  NTuple::Item<double> m_kmfit5C_cms_pim_pz;
  NTuple::Item<double> m_kmfit5C_cms_pim_mom;

  NTuple::Item<double> m_kmfit5C_cms_Etagam_e;
  NTuple::Item<double> m_kmfit5C_cms_Etagam_px;
  NTuple::Item<double> m_kmfit5C_cms_Etagam_py;
  NTuple::Item<double> m_kmfit5C_cms_Etagam_pz;
  NTuple::Item<double> m_kmfit5C_cms_Etagam_mom;
  ITHistSvc *m_histSvc;
  // TH1F for cutflow
  TH1F *m_cutflow;

  //functions for check dE/dx
  void checkDedx(SmartDataPtr<EvtRecTrackCol> evtRecTrkCol, const Vint& iGood, int nGood);
  void checkTof(SmartDataPtr<EvtRecTrackCol> evtRecTrkCol, const Vint& iGood, int nGood);
  //functions for check tof 

};
#endif
