function [keo]=loaddata_ASC_keo(varargin)

  if isempty(varargin)
    dn=datenum([2011 12 17]);
  else
    dn=varargin{1};
  end

  global datasetinfo
  
  %fp_data=['/home/leicai/Projects/Analysis/J_eq/'];
  pwd1=pwd;
  cd ..
  fp_data=[pwd '/Data/ASC/keo/'];
  cd(pwd1)
  
    [yy, mm, dd, HH, MM, SS]=datevec(dn);
  syy=sprintf('%04d',yy);
  syy_2=syy(3:4);
  smm=sprintf('%02d',mm);
  sdd=sprintf('%02d',dd);
  
  %   fdir=[root_dat];
  %   flist=dir([fdir '*.mat']);
  %   fnlist={flist.name};
  %   ix=regexp(fnlist,['wind_' syy_2 smm sdd]);
  %   ix=~cellfun('isempty',ix);
  %   fn=fnlist(ix);
  %
  %   fp_dat=fdir;
  %   fn_dat=fn{1};
  
  fn_data=['keo_lat_' datestr(dn,'yyyymmdd') '.mat'];
  
  keo=[];
  if ~isempty(dir([fp_data fn_data]))
 
  eval(['load ' [fp_data fn_data]]);
  
  lon0=19.23;
  
  
  %[row, col] = find((latkeo(:,:,1)>0.2*255 & latkeo(:,:,1)>latkeo(:,:,2)));
  %latkeo(,2) =0;
  gc = latkeo(:,:,2);
  gc((latkeo(:,:,1)>0.3*255 & latkeo(:,:,1)>1.2*latkeo(:,:,2)) | (latkeo(:,:,3)>0.3*255 & latkeo(:,:,3)>1.2*latkeo(:,:,2))) = NaN;
  keo.NS.val = gc;
  %keo.NS.val = latkeo;
  %keo.NS.val=latkeo(:,:,2);
  %keo.NS.val(:,:,1) = imadjust(keo.NS.val(:,:,1));
  %keo.NS.val(:,:,3) = imadjust(keo.NS.val(:,:,3));
  %keo.NS.val(:,:,2) = imadjust(keo.NS.val(:,:,2), [0.5 1]);
  %keo.NS.val = hsv2rgb(rgb2hsv(latkeo) .* cat(3, 1, 5, 1));
  keo.NS.tl=tl;
  if length(latbins) == size(latkeo, 1)
    keo.NS.lat = latbins;
  else
    keo.NS.lat=latbins(1:end-1)+diff(latbins(1:2))/2;
  end
  keo.NS.lat=keo.NS.lat';
  keo.NS.lon=lon0;
  
  end
end
