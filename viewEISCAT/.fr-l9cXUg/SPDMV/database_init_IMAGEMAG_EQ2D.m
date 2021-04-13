global database datasetinfo

% NOTE: Add the parameter information whenever a new parameters is added!


databasetemplate=database_variabletemplates(2);

%% for Jeq from IMAGE
parainfo={'EQ1Eext',            ...
          'EQ1Eext_mono',       ...
          'EQ1Next',            ...
          'EQ1Next_mono'};
ix=ismember(parainfo,datasetinfo.paralist);
if ~isempty(parainfo(ix))
  % linked file for reading FPI data
  filereader='assign_IMAGEMAG_EQ2D.m';
  
  %% Item 1: EQ1D Eastward
  database.EQ1Eext=databasetemplate;
  item={                            ...
    'name',         'EQ1Eext';        ...
    'label',        'J_E^{eq}';    ...
    'unit',         'mA/m';          ...
    'ndim',          2;              ... 
    'group',        'J_{eq}';    ...
    'dscp',         'Eastward equivalent current';      ...
    'filereader',   filereader      ...
    };
  for i=1:size(item,1)
    database.EQ1Eext.(item{i,1})=item{i,2};
  end
  
  %% Item 2: EQ1D monosite
  database.EQ1Eext_mono=databasetemplate;
  item={                            ...
    'name',         'EQ1Eext_mono';        ...
    'label',        'J_E^{eq}';    ...
    'unit',         'mA/m';          ...
    'ndim',          1;              ...
    'group',        'J_{eq}';    ...
    'dscp',         'Eastward equivalent current at a single location';      ...
    'filereader',   filereader      ...
    };
  for i=1:size(item,1)
    database.EQ1Eext_mono.(item{i,1})=item{i,2};
  end
  %% Item 3: EQ1D northward
  database.EQ1Next=databasetemplate;
  item={                            ...
    'name',         'EQ1Next';        ...
    'label',        'J_N^{eq}';    ...
    'unit',         'mA/m';          ...
    'ndim',          2;              ... 
    'group',        'J_{eq}';    ...
    'dscp',         'Northward equivalent current';      ...
    'filereader',   filereader      ...
    };
  for i=1:size(item,1)
    database.EQ1Next.(item{i,1})=item{i,2};
  end
  
  %% Item 4: EQ1D northward monosite
  database.EQ1Next_mono=databasetemplate;
  item={                            ...
    'name',         'EQ1Next_mono';        ...
    'label',        'J_N^{eq}';    ...
    'unit',         'mA/m';          ...
    'ndim',          1;              ...
    'group',        'J_{eq}';    ...
    'dscp',         'Northward equivalent current at a single location';      ...
    'filereader',   filereader      ...
    };
  for i=1:size(item,1)
    database.EQ1Next_mono.(item{i,1})=item{i,2};
  end  
  %% Initialize plot settings
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  vis_init_IMAGEMAG_EQ2D;
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end