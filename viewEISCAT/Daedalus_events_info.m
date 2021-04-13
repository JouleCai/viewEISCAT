function event = Daedalus_events_info(dn)

templete = struct('datenum', [], 'substorms', []);
% events.datenum = datenum([]);
% events{}.substorms{1}.GP = [];
% events{}.substorms{1}.EP = [];
% events{}.substorms{1}.RP = [];
% events{}.substorms{2}.GP = [];
% events{}.substorms{2}.EP = [];
% events{}.substorms{2}.RP = [];

%% 20150215
events{1} = templete;
events{1}.datenum = datenum([2015 02 15]);
events{1}.substorms{1}.GP = [17.60 18.78];
events{1}.substorms{1}.EP = [18.78 19.16];
events{1}.substorms{1}.RP = [19.16 20.72];
events{1}.substorms{2}.GP = [20.72 22.17];
events{1}.substorms{2}.EP = [22.17 22.58];
events{1}.substorms{2}.RP = [22.58 23.65];

%% 20161023
events{2} = templete;
events{2}.datenum = datenum([2016 10 23]);
events{2}.substorms{1}.GP = [16.86 17.5];
events{2}.substorms{1}.EP = [17.5 17.86];
events{2}.substorms{1}.RP = [17.86 18.30];
events{2}.substorms{2}.GP = [];
events{2}.substorms{2}.EP = [18.30 18.88];
events{2}.substorms{2}.RP = [18.88 19.66];

%% 20180119
events{3} = templete;
events{3}.datenum = datenum([2018 01 19]);
events{3}.substorms{1}.GP = [17.35 17.80];
events{3}.substorms{1}.EP = [17.80 18.50];
events{3}.substorms{1}.RP = [18.5 19.47];

%% 20180217
events{4} = templete;
events{4}.datenum = datenum([2018 02 17]);
events{4}.substorms{1}.GP = [20.61 21.15];
events{4}.substorms{1}.EP = [21.15 21.94];
events{4}.substorms{1}.RP = [21.94 23.45];
events{4}.substorms{2}.GP = [];
events{4}.substorms{2}.EP = [23.45 24.88];
events{4}.substorms{2}.RP = [24.88 26.80];

%% 20190204
events{5} = templete;
events{5}.datenum = datenum([2019 02 04]);
events{5}.substorms{1}.GP = [18.33 19.42];
events{5}.substorms{1}.EP = [19.42 19.98];
events{5}.substorms{1}.RP = [19.98 21.00];
events{5}.substorms{2}.GP = [21.47 22.17];
events{5}.substorms{2}.EP = [22.17 22.60];
events{5}.substorms{2}.RP = [22.60 24.13];
events{5}.substorms{3}.GP = [];
events{5}.substorms{3}.EP = [24.13 24.66];
events{5}.substorms{3}.RP = [24.66 26.01];

%% 20191128
events{6} = templete;
events{6}.datenum = datenum([2019 11 28]);
events{6}.substorms{1}.GP = [17.54 18.30];
events{6}.substorms{1}.EP = [18.30 18.90];
events{6}.substorms{1}.RP = [18.90 19.62];
events{6}.substorms{2}.GP = [];
events{6}.substorms{2}.EP = [19.62 19.92];
events{6}.substorms{2}.RP = [19.92 20.71];

%% 20200218
events{7} = templete;
events{7}.datenum = datenum([2020 02 18]);
events{7}.substorms{1}.GP = [22.14 22.54];
events{7}.substorms{1}.EP = [22.54 22.79];
events{7}.substorms{1}.RP = [22.79 23.46];
events{7}.substorms{2}.GP = [];
events{7}.substorms{2}.EP = [23.46 23.79];
events{7}.substorms{2}.RP = [];

for i=1 : length(events)
    i
   for j = 1 : length(events{i}.substorms)
       j
      disp(datestr((events{i}.substorms{j}.GP'+2.6)/24, 'HHMM')) 
      disp(datestr((events{i}.substorms{j}.EP'+2.6)/24, 'HHMM')) 
      disp(datestr((events{i}.substorms{j}.RP'+2.6)/24, 'HHMM')) 
   end
end

for i=1 : length(events)
   if events{i}.datenum == floor(dn)
       event = events{i};
       break
   end
end

end