

% choose the calculating mode
choice = questdlg('Choose a calculating mode', ...
	'Calculate conductivities from EISCAT/GUISDAP analyzed data:', ...
	'Individual','Batch','Quit','Individual');
% Handle response
switch choice
    case 'Individual'
        disp([choice])
        mode = 1;
    case 'Batch'
        disp([choice])
        mode = 2;
    case 'Quit'
        disp('Thank you, bye!')
        mode = 0;
end

if mode==0
  return;
elseif mode==1
  filterSpec='/data/eiscat/*.mat';
  [filenamein,pathname]=uigetfile(filterSpec,'Select any file in the wanted DIRECTORY');
  if filenamein==0; return, end
  nfd=1;
  pathlist{1}=pathname;
elseif mode==2
  start_path=pwd;  
  root_dir = uigetdir(start_path,'Select the root folder where the data are stored:');
  dirlist=dir(root_dir); % find folders
  nfd=0;
  for i=1:length(dirlist)
    if dirlist(i).isdir && ~strcmp(dirlist(i).name,'.') && ~strcmp(dirlist(i).name,'..');
      nfd=nfd+1;
      pathlist{nfd}=[root_dir '/' dirlist(i).name '/'];
    end
  end
  if nfd==0
    error('No Folder found!','Search error:');
    return
  end
end

res_root_path=[pwd '/res_cdt/'];
for i=1:nfd
  fp=pathlist{i};
  nfp=length(fp);
%   if strcmp(fp(nfp-3:nfp-1),'42m')
%     
%   [fp_cmb fn_cmb]=combine_mat14(fp);
%   conductivities_2X_err(fp_cmb,fn_cmb,res_root_path);
%   end
[fp_cmb fn_cmb]=combine_mat14(fp);
conductivities_2X_err_TiTe(fp_cmb,fn_cmb,res_root_path);
end



