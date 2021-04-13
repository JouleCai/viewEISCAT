function ISR = loaddata_EISCAT_cdt(dn)
  
%% find filenames
pwd1=pwd;
cd ..
fp_root=[pwd '/EISCAT_cdt/dat_cmb/'];
cd(pwd1)

dstr = datestr(dn, 'yyyymmdd');

dstr1 = datestr(dn, 'yyyymm');

flist = dir([fp_root  '/ESR'  dstr1 '/*.mat']);
fnlist = {flist.name};
ix = regexp(fnlist, ['ESR_' dstr '_cmb']);
ix = ~cellfun('isempty', ix);
fn = fnlist(ix);

fpfn = fullfile(fp_root, ['ESR' dstr1], fn{1});
eval(['load ' fpfn]);

%ind=find(abs(az-186.2)<1 & abs(el-77.5)<1);
  ind=1:size(n_e,2);
  ne=n_e(:,ind);
  ti=ti(:,ind);
  te=te(:,ind);
  vel=vel(:,ind);
  height=height(:,ind);
  stat=stat(:,ind);
  resid=resid(:,ind);
  ti_err=ti_err(:,ind);
  lat = lat(:, ind);
  
  ind2=find(stat>0);
  ne(ind2)=nan;
  ti(ind2)=nan;
  te(ind2)=nan;
  vel(ind2)=nan;
%   
%   ind3=find(resid>10);
%   ne(ind3)=nan;
%   ti(ind3)=nan;
%   te(ind3)=nan;
%   
%   ind4=find(ti_err./ti>1);
%   ne(ind4)=nan;
%   ti(ind4)=nan;
%   te(ind4)=nan;
%   
%   % T_i < 50 K? velocity is not independent from other fittings, bad ion
%   % velocity may be related to wired temperature
%     ind4=find(ti>2500);
%   ne(ind4)=nan;
%   ti(ind4)=nan;
%   te(ind4)=nan;
  
  
  t1=datenum(t1');
  t2=datenum(t2');
  
  
  t1=t1(ind);
  t2=t2(ind);
  midtime=(t1+t2)/2;
  sectime=(midtime-floor(midtime))*86400;
  
  
  ISR.ne.val = ne;
  ISR.ne.err = [];
  ISR.Ti.val = ti;
  ISR.Ti.err = [];
  ISR.Te.val = te;
  ISR.Te.err = [];
  ISR.vi.val = -vel;
  ISR.vi.err = [];
  ISR.az = az(1, ind);
  ISR.el = el(1, ind);
  ISR.tl = midtime';
  ISR.alt = lat;
  % ISR.lat = lat;
  
end