function [out] = ArrangeFromWorkspaceData(time)
vars = evalin('base','whos');
out = struct( 'signals', cell(length(vars),1) );
for i=1:length(vars)
   out(i).signals.values=evalin('base',vars(i).name);
   out(i).signals.name=vars(i).name;
   out(i).signals.dimension=vars(i).size;
   out(i).time=time;
end