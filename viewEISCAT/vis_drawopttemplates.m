function template=vis_drawopttemplates(ind)
  drawopttemplist{1}=struct(                          ...
          'plottype',        [],                      ...
          'xdataname',       [],                      ...
          'xdatagrid',       '',                      ...
          'xdatares',        [],                      ...
          'xdatascatter',    '',                      ...
          'xlabel',          '',                      ...
          'xunit',           '',                      ...
          'xlim',            [],                      ...
          'ydataname',       [],                      ...
          'ylabel',          '',                      ...
          'yunit',           '',                      ...
          'ytick',           [],                      ...
          'yticklabel',      [],                      ...
          'ylim',            [],                      ...
          'yscale',          '',                      ...  
          'color',           [],                      ...
          'alpha',            1,                       ...
          'lsp',             [],                       ...
          'linewidth',      []                          ...
          );
  drawopttemplist{2}=struct(                          ...
          'plottype',        [],                      ...
          'xdataname',       [],                      ...
          'xlabel',          '',                      ...
          'xunit',           '',                      ...
          'xlim',            [],                      ...
          'xdatagrid',       '',                      ...
          'xdatares',        [],                      ... 
          'xdatascatter',    '',                      ...
          'ydataname',       [],                      ...
          'ylabel',          '',                      ...
          'yunit',           '',                      ...
          'ytick',           [],                      ...
          'yticklabel',      [],                      ...
          'ylim',            [],                      ...
          'yscale',          '',                      ...
          'ydatagrid',       [],                      ...
          'ydatares',        [],                      ...
          'ydatascatter',    '',                      ...
          'zdataname',       [],                      ...
          'zlabel',          '',                      ...
          'zunit',           '',                      ...
          'ztick',           [],                      ...
          'zticklabel',      [],                      ...
          'zlim',            [],                      ...
          'zscale',          '',                      ...
          'colormap',        [],                      ...
          'alpha',            1                       ...
          );
  template=drawopttemplist{ind};
end