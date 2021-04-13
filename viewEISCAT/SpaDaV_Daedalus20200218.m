%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% data manager for all types of data %%%
function [NaN]=SPDManager(varargin)
if isempty(varargin)
  clear global
end
global datasetinfo drawopt dataset


addpath_before_start;

if isempty(varargin)
  dataset=[];
  datasetinfo=[];
  % Project name which is shown in the data file name
  datasetinfo.projname='IMF/Geomag';
  datasetinfo.projname='Geomag/u6300';
  % Set parameters to be fetched (refer to initial files)
  datasetinfo.paralist={'u55_N','u55_E','u55_h', 'a55_N','a55_E',   ...
                        'u63_N','u63_E','u63_h', 'a63_N','a63_E',   ...
                        'EQ1Eext', 'EQ1Next','keolat', 'emAlt_peak', 'emAlt_mean',  ...
                        'empf', 'EF_E_NW', 'EF_N_NW', 'tau_ni'};
  datasetinfo.save=0; % 0 - no save; 1 - save
  
  % Set plotting pannels
  drawopt.order={11, 13, [17,-17; 18, -18],[6, -6; 7, -7], [9, -9; 10, -10], ...
                        [1, -1; 2, -2], [4, -4; 5, -5], {[19], [ 14, -14]}};
  drawopt.plottype=nan(size(drawopt.order));
  drawopt.plottype(end) = 2.01;
  drawopt.visual='on';
  drawopt.figureclose=0;
  drawopt.figure.position=[1 1 20 25];
  drawopt.save=1;
  drawopt.addlines=getadditionallines(1);
 % drawopt.addshadings=getadditionalshadings(1);
 
  datasetinfo.projname='Daedalus-EF/ElSpecGLOW-v3';
  
  %drawopt.order={20,24,[1,-1;2,-2],[23,-23],[22,-22],[3,-3]};
  drawopt.xunit='UT';
elseif length(varargin)==1
  datasetinfo=varargin{1};
  drawopt.visual='off';
elseif length(varargin)==1
  datasetinfo=varargin{1};
  drawopt=varargin{2};
end

% Set dates
datelist=getdatelist(1);

% Fetch and plot
for i=1:size(datelist,1)
 
  para_init; 
  dataset{1}.drawopt.ylim = [-310 160];
  dataset{1}.label = 'Nortward';
  dataset{1}.group = 'u-5577';
  dataset{2}.drawopt.ylim = [-310 160];
  dataset{2}.label = 'Eastward';
  dataset{2}.group = 'u-5577';
  
  
  dataset{6}.drawopt.ylim = [-280 200];
  dataset{6}.label = 'Northward';
  dataset{6}.group = 'u-6300';
  dataset{7}.drawopt.ylim = [-280 200];
  dataset{7}.label = 'Eastward';
  dataset{7}.group = 'u-6300';
  
  dataset{4}.drawopt.ylim = [-0.21 0.21];
  dataset{4}.drawopt.color = [];
  dataset{4}.drawopt.alpha = 0.4;
  dataset{4}.label = 'Northward';
  dataset{4}.group = 'a-5577';
  dataset{5}.drawopt.ylim = [-0.21 0.21];
  dataset{5}.drawopt.color = [];
  dataset{5}.drawopt.alpha = 0.4;
  dataset{5}.label = 'Eastward';
  dataset{5}.group = 'a-5577';
  dataset{9}.drawopt.ylim = [-0.21 0.21];
  dataset{9}.drawopt.color = [];
  dataset{9}.drawopt.alpha = 0.4;
  dataset{9}.label = 'Northward';
  dataset{9}.group = 'a-6300';
  dataset{10}.drawopt.ylim = [-0.21 0.21];
  dataset{10}.drawopt.color = [];
  dataset{10}.drawopt.alpha = 0.4;
  dataset{10}.label = 'Eastward';
  dataset{10}.group = 'a-6300';
  
  datasetinfo.dateran=datelist(i,:);
  
  %% Read data
  for j=1:length(datasetinfo.filereader)
    datasetinfo.filereaderrec=j;
    [pathstr, name, ext] = fileparts(datasetinfo.filereader(j).name);
    eval(name)
  end
  inds = [1 2 6 7 4 5 9 10 14];
  for ii = 1: length(inds)
    ind1 = inds(ii);
    disp([dataset{ind1}.name ': ' sprintf('%6f', nanmin(dataset{ind1}.val)) ...
        '  ' sprintf('%6f', nanmax(dataset{ind1}.val))])
  end

  %% Start plotting
  if strcmp(drawopt.visual,'off')
    continue
  else
    vis;
  end  
  
  %% Savedata
  if datasetinfo.save
    savedata;
  end
end
end


function [datelist]=getdatelist(id)

  if id==0
    prompt='Input starting date and time, e.g., [2005 09 01 00 00 00]:\n';
    dv=input(prompt);
    st_dn=datenum(dv);

    prompt='Input ending date and time, e.g., [2005 09 01 24 00 00]:\n';
    dv=input(prompt);
    ed_dn=datenum(dv);
  elseif id==1
    st_dn=datenum([2020 02 18 17 00 00]);
    ed_dn=datenum([2020 02 18 24 00 00]);
  elseif id==2
    dns=getdnlist(2); % dns in column
    st_time=[00 00 00 16 00 00]; % [HH MM SS];
    ed_time=[00 00 01 02 00 00];
    st_dn=dns+datenum(st_time);
    ed_dn=dns+datenum(ed_time);
  end

  datelist=[st_dn ed_dn];
end

function [dns]=getdnlist(id)
  if id==1
    dns=[datenum(2003,11,11):datenum(2003,11,19),        ...
      datenum(2005,09,01):datenum(2005,09,30)];
    dns=dns';
    dns=datenum([2011 12 17;
      2012 10 17;
      2012 11 25;
      2012 11 30;
      2012 12 01;
      2013 02 10;
      2013 03 08;
      2013 09 28;
      2015 02 15;
      2015 10 22;
      2016 10 20;
      2016 10 22;
      2016 10 23;
      2016 11 04;
      2016 11 06;
      2016 11 08;
      2016 11 16;
      2013 02 08;]);
    elseif id==2;
    fn=[pwd '/events/' 'event_dates1.dat'];
    fid=fopen(fn);
    C=textscan(fid,'%s');
    fclose(fid);
    dns=datenum(C{1},'yyyymmdd');
  end
  
end

function lines=getadditionallines(varargin)
  dn=datenum([2011 12 17 22 22 00]);
  t1=(dn-floor(dn))*24;
  lines={1,NaN,[69.58 69.58],struct('LineStyle',':');   ...
         2,NaN,[69.58 69.58],struct('LineStyle',':','Color',[0 0 0]);   ...
         0,[22.54 22.54],NaN,struct('Color',[0.7 0 0]);   ...
         0,[23.46 23.46],NaN,struct('Color',[0.7 0 0]);   ...
         0,[22.79 22.79],NaN,[];   ...
         0,[23.57 23.57],NaN,[];       ...
         0,[22.14 22.14],NaN,[]};
       
   lines = [lines;   ...
     {5, [18+18/60 19+39/60], [0.0352 0.0352],struct('LineStyle','-','Color',[1 0 0]);   ...
      5, [18+18/60 19+39/60], [-0.0208 -0.0208],struct('LineStyle','-','Color',[0 0 0]);   ...
      7, [18+18/60 19+39/60], [0.0189 0.0189],struct('LineStyle','-','Color',[1 0 0]);   ...
     }      ...
  ];     
end

function shadings=getadditionalshadings(varargin)
  dn=datenum([2012 12 17 22 22 00]);
  t1=(dn-floor(dn))*24;
%   shadings={1,NaN,[69.58 69.58];   ...
%             0,[t1 t1],NaN};
end

