
global database datasetinfo

% NOTE: Add the parameter information whenever a new parameters is added!


databasetemplate=database_variabletemplates(1);

%% for 6300 nm
parainfo={'u63_N',  ...
          'u63_E',  ...
          'u63_h',  ...
          'u63_bm1',    ...
          'u63_bm2',    ...
          'u63_bm3',    ...
          'u63_bm4',    ...
          'u63_bm5',    ...
          'a63_N',      ...
          'a63_E'};
ix=ismember(parainfo,datasetinfo.paralist);
if ~isempty(parainfo(ix))
  % linked file for reading FPI data
  filereader_6300='assign_FPI6300.m';
  filereader_5577='assign_FPI5577.m';
  
  %% Item 1: FPI/6300 uN
  database.u63_N=databasetemplate;
  item={                            ...
    'name',         'u63_N';        ...
    'label',        'u_N';          ...
    'unit',         'm/s';          ...
    'ndim',          1;              ...
    'group',        'u';    ...
    'dscp',         'Northward nuetral wind from FPI(6300nm)';      ...
    'filereader',   filereader_6300  ...
    };
  for i=1:size(item,1)
    database.u63_N.(item{i,1})=item{i,2};
  end
  
  %% Item 2: FPI/6300 uE
  database.u63_E=databasetemplate;
  item={                            ...
    'name',         'u63_E';        ...
    'label',        'u_E';          ...
    'unit',         'm/s';          ...
    'ndim',          1;              ...
    'group',        'u';    ...
    'dscp',         'East nuetral wind from FPI(6300nm)';      ...
    'filereader',   filereader_6300  ...
    };
  for i=1:size(item,1)
    database.u63_E.(item{i,1})=item{i,2};
  end
  
  %% Item 3: FPI/6300 uh
  database.u63_h=databasetemplate;
  item={                            ...
    'name',         'u63_h';        ...
    'label',        'u_h';          ...
    'unit',         'm/s';          ...
    'ndim',          1;              ...
    'group',        'u';    ...
    'dscp',         'Upward nuetral wind from FPI(6300nm)';      ...
    'filereader',   filereader_6300  ...
    };
  for i=1:size(item,1)
    database.u63_h.(item{i,1})=item{i,2};
  end
  
  %% Item 4: FPI/6300 beam1
  itemname='u63_bm1';
  database.(itemname)=databasetemplate;
  item={                            ...
    'name',         'u63_bm1';        ...
    'label',        'v_{1}';          ...
    'unit',         'm/s';          ...
    'ndim',          1;              ...
    'group',        'v_{LOS}^{6300}';    ...
    'dscp',         'Beam 1 los velocity from FPI(6300nm)';      ...
    'filereader',   filereader_6300  ...
    };
  for i=1:size(item,1)
    database.(itemname).(item{i,1})=item{i,2};
  end
  
  %% Item 5: FPI/6300 beam2
  itemname='u63_bm2';
  database.(itemname)=databasetemplate;
  item={                            ...
    'name',         'u63_bm2';        ...
    'label',        'v_{2}';          ...
    'unit',         'm/s';          ...
    'ndim',          1;              ...
    'group',        'v_{LOS}^{6300}';    ...
    'dscp',         'Beam 2 los velocity from FPI(6300nm)';      ...
    'filereader',   filereader_6300  ...
    };
  for i=1:size(item,1)
    database.(itemname).(item{i,1})=item{i,2};
  end

  %% Item 6: FPI/6300 beam3
  itemname='u63_bm3';
  database.(itemname)=databasetemplate;
  item={                            ...
    'name',         'u63_bm3';        ...
    'label',        'v_{3}';          ...
    'unit',         'm/s';          ...
    'ndim',          1;              ...
    'group',        'v_{LOS}^{6300}';    ...
    'dscp',         'Beam 3 los velocity from FPI(6300nm)';      ...
    'filereader',   filereader_6300  ...
    };
  for i=1:size(item,1)
    database.(itemname).(item{i,1})=item{i,2};
  end

  %% Item 7: FPI/6300 beam4
  itemname='u63_bm4';
  database.(itemname)=databasetemplate;
  item={                            ...
    'name',         'u63_bm4';        ...
    'label',        'v_{4}';          ...
    'unit',         'm/s';          ...
    'ndim',          1;              ...
    'group',        'v_{LOS}^{6300}';    ...
    'dscp',         'Beam 4 los velocity from FPI(6300nm)';      ...
    'filereader',   filereader_6300  ...
    };
  for i=1:size(item,1)
    database.(itemname).(item{i,1})=item{i,2};
  end
  
  %% Item 8: FPI/6300 beam5
  itemname='u63_bm5';
  database.(itemname)=databasetemplate;
  item={                            ...
    'name',         'u63_bm5';        ...
    'label',        'v_{5}';          ...
    'unit',         'm/s';          ...
    'ndim',          1;              ...
    'group',        'v_{LOS}^{6300}';    ...
    'dscp',         'Beam 5 los velocity from FPI(6300nm)';      ...
    'filereader',   filereader_6300  ...
    };
  for i=1:size(item,1)
    database.(itemname).(item{i,1})=item{i,2};
  end
  
   %% Item 9: FPI/6300 aN
  itemname='a63_N';
  database.(itemname)=databasetemplate;
  item={                            ...
    'name',         'a63_N';        ...
    'label',        'a_N';          ...
    'unit',         'm/s^2';          ...
    'ndim',          1;              ...
    'group',        'a';    ...
    'dscp',         'Northward acceleration from FPI(6300nm)';      ...
    'filereader',   filereader_6300  ...
    };
  for i=1:size(item,1)
    database.(itemname).(item{i,1})=item{i,2};
  end
  
   %% Item 10: FPI/6300 aE
  itemname='a63_E';
  database.(itemname)=databasetemplate;
  item={                            ...
    'name',         'a63_E';        ...
    'label',        'a_E';          ...
    'unit',         'm/s^2';          ...
    'ndim',          1;              ...
    'group',        'a';    ...
    'dscp',         'Eastward acceleration from FPI(6300nm)';      ...
    'filereader',   filereader_6300  ...
    };
  for i=1:size(item,1)
    database.(itemname).(item{i,1})=item{i,2};
  end
  
  %% Initialize plot settings
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  vis_init_FPI6300;
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end

%% for 5577 nm
parainfo={'u55_N',  ...
          'u55_E',  ...
          'u55_h'   ...
          'u55_bm1',    ...
          'u55_bm2',    ...
          'u55_bm3',    ...
          'u55_bm4',    ...
          'u55_bm5'};
ix=ismember(parainfo,datasetinfo.paralist);
if ~isempty(parainfo(ix))
  % linked file for reading FPI data
  filereader_6300='assign_FPI6300.m';
  filereader_5577='assign_FPI5577.m';
  
  %% Item 1: FPI/5577 uN
  database.u63_N=databasetemplate;
  item={                            ...
    'name',         'u55_N';        ...
    'label',        'u_N';          ...
    'unit',         'm/s';          ...
    'ndim',          1;              ...
    'group',        'u';    ...
    'dscp',         'Northward nuetral wind from FPI(5577nm)';      ...
    'filereader',   filereader_5577  ...
    };
  for i=1:size(item,1)
    database.u55_N.(item{i,1})=item{i,2};
  end
  
  %% Item 2: FPI/5577 uE
  database.u55_E=databasetemplate;
  item={                            ...
    'name',         'u55_E';        ...
    'label',        'u_E';          ...
    'unit',         'm/s';          ...
    'ndim',          1;              ...
    'group',        'u';    ...
    'dscp',         'East nuetral wind from FPI(5577nm)';      ...
    'filereader',   filereader_5577  ...
    };
  for i=1:size(item,1)
    database.u55_E.(item{i,1})=item{i,2};
  end
  
  %% Item 3: FPI/5577 uh
  database.u55_h=databasetemplate;
  item={                            ...
    'name',         'u55_h';        ...
    'label',        'u_h';          ...
    'unit',         'm/s';          ...
    'ndim',          1;              ...
    'group',        'u';    ...
    'dscp',         'Upward nuetral wind from FPI(5577nm)';      ...
    'filereader',   filereader_5577  ...
    };
  for i=1:size(item,1)
    database.u55_h.(item{i,1})=item{i,2};
  end
  %% Item 4: FPI/5577 beam1
  itemname='u55_bm1';
  database.(itemname)=databasetemplate;
  item={                            ...
    'name',         'u55_bm1';        ...
    'label',        'v_{1}';          ...
    'unit',         'm/s';          ...
    'ndim',          1;              ...
    'group',        'v_{LOS}^{5577}';    ...
    'dscp',         'Beam 1 los velocity from FPI(5577nm)';      ...
    'filereader',   filereader_5577  ...
    };
  for i=1:size(item,1)
    database.(itemname).(item{i,1})=item{i,2};
  end
  
  %% Item 5: FPI/5577 beam2
  itemname='u55_bm2';
  database.(itemname)=databasetemplate;
  item={                            ...
    'name',         'u55_bm2';        ...
    'label',        'v_{2}';          ...
    'unit',         'm/s';          ...
    'ndim',          1;              ...
    'group',        'v_{LOS}^{5577}';    ...
    'dscp',         'Beam 2 los velocity from FPI(5577nm)';      ...
    'filereader',   filereader_5577  ...
    };
  for i=1:size(item,1)
    database.(itemname).(item{i,1})=item{i,2};
  end

  %% Item 6: FPI/5577 beam3
  itemname='u55_bm3';
  database.(itemname)=databasetemplate;
  item={                            ...
    'name',         'u55_bm3';        ...
    'label',        'v_{3}';          ...
    'unit',         'm/s';          ...
    'ndim',          1;              ...
    'group',        'v_{LOS}^{5577}';    ...
    'dscp',         'Beam 3 los velocity from FPI(5577nm)';      ...
    'filereader',   filereader_5577  ...
    };
  for i=1:size(item,1)
    database.(itemname).(item{i,1})=item{i,2};
  end

  %% Item 7: FPI/5577 beam4
  itemname='u55_bm4';
  database.(itemname)=databasetemplate;
  item={                            ...
    'name',         'u55_bm4';        ...
    'label',        'v_{4}';          ...
    'unit',         'm/s';          ...
    'ndim',          1;              ...
    'group',        'v_{LOS}^{5577}';    ...
    'dscp',         'Beam 4 los velocity from FPI(5577nm)';      ...
    'filereader',   filereader_5577  ...
    };
  for i=1:size(item,1)
    database.(itemname).(item{i,1})=item{i,2};
  end
  
  %% Item 8: FPI/5577 beam5
  itemname='u55_bm5';
  database.(itemname)=databasetemplate;
  item={                            ...
    'name',         'u55_bm5';        ...
    'label',        'v_{5}';          ...
    'unit',         'm/s';          ...
    'ndim',          1;              ...
    'group',        'v_{LOS}^{5577}';    ...
    'dscp',         'Beam 5 los velocity from FPI(5577nm)';      ...
    'filereader',   filereader_5577  ...
    };
  for i=1:size(item,1)
    database.(itemname).(item{i,1})=item{i,2};
  end
  
   %% Item 9: FPI/5577 aN
  itemname='a55_N';
  database.(itemname)=databasetemplate;
  item={                            ...
    'name',         'a55_N';        ...
    'label',        'a_N';          ...
    'unit',         'm/s^2';          ...
    'ndim',          1;              ...
    'group',        'a';    ...
    'dscp',         'Northward acceleration from FPI(5577nm)';      ...
    'filereader',   filereader_5577  ...
    };
  for i=1:size(item,1)
    database.(itemname).(item{i,1})=item{i,2};
  end
  
   %% Item 10: FPI/5577 aE
  itemname='a55_E';
  database.(itemname)=databasetemplate;
  item={                            ...
    'name',         'a55_E';        ...
    'label',        'a_E';          ...
    'unit',         'm/s^2';          ...
    'ndim',          1;              ...
    'group',        'a';    ...
    'dscp',         'Eastward acceleration from FPI(5577 nm)';      ...
    'filereader',   filereader_5577  ...
    };
  for i=1:size(item,1)
    database.(itemname).(item{i,1})=item{i,2};
  end
  
  %% Initialize plot settings
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  vis_init_FPI5577;
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
